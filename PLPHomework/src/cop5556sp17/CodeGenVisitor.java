package cop5556sp17;

import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import java.util.HashMap;

import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.util.TraceClassVisitor;

import cop5556sp17.Scanner.Kind;
import cop5556sp17.Scanner.Token;
import cop5556sp17.AST.ASTVisitor;
import cop5556sp17.AST.AssignmentStatement;
import cop5556sp17.AST.BinaryChain;
import cop5556sp17.AST.BinaryExpression;
import cop5556sp17.AST.Block;
import cop5556sp17.AST.BooleanLitExpression;
import cop5556sp17.AST.Chain;
import cop5556sp17.AST.ChainElem;
import cop5556sp17.AST.ConstantExpression;
import cop5556sp17.AST.Dec;
import cop5556sp17.AST.Expression;
import cop5556sp17.AST.FilterOpChain;
import cop5556sp17.AST.FrameOpChain;
import cop5556sp17.AST.IdentChain;
import cop5556sp17.AST.IdentExpression;
import cop5556sp17.AST.IdentLValue;
import cop5556sp17.AST.IfStatement;
import cop5556sp17.AST.ImageOpChain;
import cop5556sp17.AST.IntLitExpression;
import cop5556sp17.AST.ParamDec;
import cop5556sp17.AST.Program;
import cop5556sp17.AST.SleepStatement;
import cop5556sp17.AST.Statement;
import cop5556sp17.AST.Tuple;
import cop5556sp17.AST.Type;
import cop5556sp17.AST.Type.TypeName;
import cop5556sp17.AST.WhileStatement;

import static cop5556sp17.AST.Type.TypeName.FRAME;
import static cop5556sp17.AST.Type.TypeName.IMAGE;
import static cop5556sp17.AST.Type.TypeName.URL;
import static cop5556sp17.Scanner.Kind.*;

public class CodeGenVisitor implements ASTVisitor, Opcodes {

	/**
	 * @param DEVEL
	 *            used as parameter to genPrint and genPrintTOS
	 * @param GRADE
	 *            used as parameter to genPrint and genPrintTOS
	 * @param sourceFileName
	 *            name of source file, may be null.
	 */
	public CodeGenVisitor(boolean DEVEL, boolean GRADE, String sourceFileName) {
		super();
		this.DEVEL = DEVEL;
		this.GRADE = GRADE;
		this.sourceFileName = sourceFileName;
	}

	ClassWriter cw;
	//FieldVisitor fv;
	String className;
	String classDesc;
	String sourceFileName;
	SymbolTable dectable = new SymbolTable();
	SymbolTable paramtable = new SymbolTable();
	MethodVisitor mv; // visitor of method currently under construction
	int slot_count;
    HashMap<Dec,Boolean> frame = new HashMap<Dec,Boolean>();

	/** Indicates whether genPrint and genPrintTOS should generate code. */
	final boolean DEVEL;
	final boolean GRADE;

	@Override
	public Object visitProgram(Program program, Object arg) throws Exception {
		cw = new ClassWriter(ClassWriter.COMPUTE_FRAMES);
		className = program.getName();
		classDesc = "L" + className + ";";
		String sourceFileName = (String) arg;
		cw.visit(52, ACC_PUBLIC + ACC_SUPER, className, null, "java/lang/Object",
				new String[] { "java/lang/Runnable" });
		cw.visitSource(sourceFileName, null);

		//put the field into class file
		int paramDecSlotNum = 0;
		for(ParamDec param:program.getParams()){
			param.setslot(paramDecSlotNum);
			paramtable.insert(param.getIdent().getText(), param);
			if(param.get()==Type.TypeName.INTEGER)
			      cw.visitField(ACC_PUBLIC, param.getIdent().getText(), "I", null, null);
			else if(param.get()==Type.TypeName.BOOLEAN)
			      cw.visitField(ACC_PUBLIC, param.getIdent().getText(), "Z", null, null);
			else if(param.get()==Type.TypeName.FILE)
			      cw.visitField(ACC_PUBLIC, param.getIdent().getText(), "Ljava/io/File;", null, null);
			else if(param.get()==Type.TypeName.URL)
			      cw.visitField(ACC_PUBLIC, param.getIdent().getText(), "Ljava/net/URL;", null, null);
			paramDecSlotNum++;
		}

		// generate constructor code
		// get a MethodVisitor
		mv = cw.visitMethod(ACC_PUBLIC, "<init>", "([Ljava/lang/String;)V", null,
				null);
		mv.visitCode();
		// Create label at start of code
		Label constructorStart = new Label();
		mv.visitLabel(constructorStart);
		// this is for convenience during development--you can see that the code
		// is doing something.
		CodeGenUtils.genPrint(DEVEL, mv, "\nentering <init>");
		// generate code to call superclass constructor
		mv.visitVarInsn(ALOAD, 0);
		mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
		// visit parameter decs to add each as field to the class
		// pass in mv so decs can add their initialization code to the
		// constructor.
		ArrayList<ParamDec> params = program.getParams();
		for (ParamDec dec : params)
			dec.visit(this, mv);
		mv.visitInsn(RETURN);
		// create label at end of code
		Label constructorEnd = new Label();
		mv.visitLabel(constructorEnd);
		// finish up by visiting local vars of constructor
		// the fourth and fifth arguments are the region of code where the local
		// variable is defined as represented by the labels we inserted.
		mv.visitLocalVariable("this", classDesc, null, constructorStart, constructorEnd, 0);
		mv.visitLocalVariable("args", "[Ljava/lang/String;", null, constructorStart, constructorEnd, 1);
		// indicates the max stack size for the method.
		// because we used the COMPUTE_FRAMES parameter in the classwriter
		// constructor, asm
		// will do this for us. The parameters to visitMaxs don't matter, but
		// the method must
		// be called.
		mv.visitMaxs(1, 1);
		// finish up code generation for this method.
		mv.visitEnd();
		// end of constructor

		// create main method which does the following
		// 1. instantiate an instance of the class being generated, passing the
		// String[] with command line arguments
		// 2. invoke the run method.
		mv = cw.visitMethod(ACC_PUBLIC + ACC_STATIC, "main", "([Ljava/lang/String;)V", null,
				null);
		mv.visitCode();
		Label mainStart = new Label();
		mv.visitLabel(mainStart);
		// this is for convenience during development--you can see that the code
		// is doing something.
		CodeGenUtils.genPrint(DEVEL, mv, "\nentering main");
		mv.visitTypeInsn(NEW, className);
		mv.visitInsn(DUP);
		mv.visitVarInsn(ALOAD, 0);
		mv.visitMethodInsn(INVOKESPECIAL, className, "<init>", "([Ljava/lang/String;)V", false);
		mv.visitMethodInsn(INVOKEVIRTUAL, className, "run", "()V", false);
		mv.visitInsn(RETURN);
		Label mainEnd = new Label();
		mv.visitLabel(mainEnd);
		mv.visitLocalVariable("args", "[Ljava/lang/String;", null, mainStart, mainEnd, 0);
		mv.visitLocalVariable("instance", classDesc, null, mainStart, mainEnd, 1);
		mv.visitMaxs(0, 0);
		mv.visitEnd();

		// create run method
		mv = cw.visitMethod(ACC_PUBLIC, "run", "()V", null, null);
		mv.visitCode();
		Label startRun = new Label();
		Label endRun = new Label();
		mv.visitLabel(startRun);
		CodeGenUtils.genPrint(DEVEL, mv, "\nentering run");
		program.getB().visit(this, null);
		mv.visitInsn(RETURN);
		mv.visitLabel(endRun);
		//TODO  visit the local variables
		mv.visitLocalVariable("this", classDesc, null, startRun, endRun, 0);
		mv.visitMaxs(0, 0);
		mv.visitEnd(); // end of run method


		cw.visitEnd();//end of class

		//generate classfile and return it
		return cw.toByteArray();
	}



	@Override
	public Object visitAssignmentStatement(AssignmentStatement assignStatement, Object arg) throws Exception {
		assignStatement.getE().visit(this, arg);
		CodeGenUtils.genPrint(DEVEL, mv, "\nassignment: " + assignStatement.var.getText() + "=");
		CodeGenUtils.genPrintTOS(GRADE, mv, assignStatement.getE().get());
		if(assignStatement.getE().get()==Type.TypeName.IMAGE){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "copyImage", "(Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
		}
		assignStatement.getVar().visit(this, arg);
		return null;
	}

	@Override
	public Object visitBinaryChain(BinaryChain binaryChain, Object arg) throws Exception {
//		assert false : "not yet implemented";
		binaryChain.getE0().visit(this,"left");
		if(binaryChain.getE0().get()==Type.TypeName.URL){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageIO", "readFromURL", "(Ljava/net/URL;)Ljava/awt/image/BufferedImage;", false);
		}else if(binaryChain.getE0().get()==Type.TypeName.FILE){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageIO", "readFromFile", "(Ljava/io/File;)Ljava/awt/image/BufferedImage;", false);
		}
		binaryChain.getE1().visit(this, "right");
		return null;
	}

	@Override
	public Object visitBinaryExpression(BinaryExpression binaryExpression, Object arg) throws Exception {
      //TODO  Implement this
		binaryExpression.getE0().visit(this, arg);
		binaryExpression.getE1().visit(this, arg);
		if(binaryExpression.getE0().get()==Type.TypeName.INTEGER&&binaryExpression.getE1().get()==Type.TypeName.INTEGER){
			if(binaryExpression.getOp().isKind(PLUS)){
				mv.visitInsn(IADD);
			}else if(binaryExpression.getOp().isKind(MINUS)){
				mv.visitInsn(ISUB);
			}else if(binaryExpression.getOp().isKind(TIMES)){
				mv.visitInsn(IMUL);
			}else if(binaryExpression.getOp().isKind(DIV)){
				mv.visitInsn(IDIV);
			}else if(binaryExpression.getOp().isKind(MOD)){
				mv.visitInsn(IREM);
			}else if(binaryExpression.getOp().isKind(OR)){
				mv.visitInsn(IOR);
			}else if(binaryExpression.getOp().isKind(AND)){
				mv.visitInsn(IAND);
			}else if(binaryExpression.getOp().isKind(LT)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPGE, label1);
				mv.visitInsn(ICONST_1);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_0);
				mv.visitLabel(label2);
			}else if(binaryExpression.getOp().isKind(LE)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPGT, label1);
				mv.visitInsn(ICONST_1);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_0);
				mv.visitLabel(label2);
			}else if(binaryExpression.getOp().isKind(GT)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPLE, label1);
				mv.visitInsn(ICONST_1);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_0);
				mv.visitLabel(label2);
			}else if(binaryExpression.getOp().isKind(GE)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPLT, label1);
				mv.visitInsn(ICONST_1);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_0);
				mv.visitLabel(label2);
			}else if(binaryExpression.getOp().isKind(EQUAL)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPNE, label1);
				mv.visitInsn(ICONST_1);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_0);
				mv.visitLabel(label2);
			}else if(binaryExpression.getOp().isKind(NOTEQUAL)){
				Label label1 = new Label();
				Label label2 = new Label();
				mv.visitJumpInsn(IF_ICMPNE, label1);
				mv.visitInsn(ICONST_0);
				mv.visitJumpInsn(GOTO, label2);
				mv.visitLabel(label1);
				mv.visitInsn(ICONST_1);
				mv.visitLabel(label2);
			}
		}
		else if(binaryExpression.getE0().get()==Type.TypeName.IMAGE||binaryExpression.getE1().get()==Type.TypeName.IMAGE){
			if(binaryExpression.getE1().get()==Type.TypeName.IMAGE&&binaryExpression.getE0().get()!=Type.TypeName.IMAGE){
				mv.visitInsn(SWAP);
			}
			if(binaryExpression.getOp().isKind(PLUS)){
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "add", "(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
			}else if(binaryExpression.getOp().isKind(MINUS)){
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "sub", "(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
			}else if(binaryExpression.getOp().isKind(TIMES)){
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "mul", "(Ljava/awt/image/BufferedImage;I)Ljava/awt/image/BufferedImage;", false);
			}else if(binaryExpression.getOp().isKind(DIV)){
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "div", "(Ljava/awt/image/BufferedImage;I)Ljava/awt/image/BufferedImage;", false);
			}else if(binaryExpression.getOp().isKind(MOD)){
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "mod", "(Ljava/awt/image/BufferedImage;I)Ljava/awt/image/BufferedImage;", false);
			}
		}
		return null;
	}

	@Override
	public Object visitBlock(Block block, Object arg) throws Exception {
		//TODO  Implement this
		Label endBlock = new Label();
		Label startBlock = new Label();
		dectable.enterScope();
		mv.visitLabel(startBlock);
		for(Dec dec:block.getDecs()){
			if(dec.get()==Type.TypeName.FRAME){
				frame.put(dec, false);
			}
			dec.visit(this, arg);
		}
		for(Statement statement:block.getStatements()){
			statement.visit(this, arg);
		}
		mv.visitLabel(endBlock);
		dectable.leaveScope();
		for(Dec dec:block.getDecs()){
			if(dec.get()==Type.TypeName.INTEGER)
			    mv.visitLocalVariable(dec.getIdent().getText(), "I", null, startBlock, endBlock, dec.getslot());
			else if(dec.get()==Type.TypeName.BOOLEAN)
				mv.visitLocalVariable(dec.getIdent().getText(), "Z", null, startBlock, endBlock, dec.getslot());
			else if(dec.get()==Type.TypeName.FILE)
				mv.visitLocalVariable(dec.getIdent().getText(), "Ljava/io/File;", null, startBlock, endBlock, dec.getslot());
			else if(dec.get()==Type.TypeName.URL)
				mv.visitLocalVariable(dec.getIdent().getText(), "Ljava/net/URL;", null, startBlock, endBlock, dec.getslot());
//			CodeGenUtils.genPrint(GRADE, mv, "\ndec: " + dec.getIdent().text+" the slot number is "+dec.getSlotNum());
		}
		for(int i=0; i<block.getDecs().size(); i++){
			slot_count--;
		}
		return null;
	}

	@Override
	public Object visitBooleanLitExpression(BooleanLitExpression booleanLitExpression, Object arg) throws Exception {
		//TODO Implement this
		if(booleanLitExpression.getValue()){
			mv.visitInsn(ICONST_1);
		}else{
			mv.visitInsn(ICONST_0);
		}
		return null;
	}

	@Override
	public Object visitConstantExpression(ConstantExpression constantExpression, Object arg) {
//		assert false : "not yet implemented";
		if(constantExpression.getFirstToken().isKind(KW_SCREENHEIGHT)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFrame", "getScreenHeight", "()I", false);
		}else if(constantExpression.getFirstToken().isKind(KW_SCREENWIDTH)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFrame", "getScreenWidth", "()I", false);
		}
		return null;
	}

	@Override
	public Object visitDec(Dec declaration, Object arg) throws Exception {
		//TODO Implement this
		slot_count++;
		declaration.setslot(slot_count);
		dectable.insert(declaration.getIdent().getText(), declaration);
		return null;
	}

	@Override
	public Object visitFilterOpChain(FilterOpChain filterOpChain, Object arg) throws Exception {
	//	assert false : "not yet implemented";
		filterOpChain.getArg().visit(this, arg);
		mv.visitInsn(ACONST_NULL);
		if(filterOpChain.getFirstToken().isKind(OP_BLUR)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFilterOps", "blurOp", "(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
		}else if(filterOpChain.getFirstToken().isKind(OP_GRAY)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFilterOps", "grayOp", "(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
		}else if(filterOpChain.getFirstToken().isKind(OP_CONVOLVE)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFilterOps", "convolveOp", "(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
		}
		return null;
	}

	@Override
	public Object visitFrameOpChain(FrameOpChain frameOpChain, Object arg) throws Exception {
	//	assert false : "not yet implemented";
		if(frameOpChain.getFirstToken().isKind(KW_SHOW)){
			frameOpChain.getArg().visit(this, arg);
			mv.visitMethodInsn(INVOKEVIRTUAL, "cop5556sp17/PLPRuntimeFrame", "showImage", "()Lcop5556sp17/PLPRuntimeFrame;", false);
		}else if(frameOpChain.getFirstToken().isKind(KW_HIDE)){
			frameOpChain.getArg().visit(this, arg);
			mv.visitMethodInsn(INVOKEVIRTUAL, "cop5556sp17/PLPRuntimeFrame", "hideImage", "()Lcop5556sp17/PLPRuntimeFrame;", false);
		}else if(frameOpChain.getFirstToken().isKind(KW_MOVE)){
			frameOpChain.getArg().visit(this, arg); 
			mv.visitMethodInsn(INVOKEVIRTUAL, "cop5556sp17/PLPRuntimeFrame", "moveFrame", "(II)Lcop5556sp17/PLPRuntimeFrame;", false);
		}else if(frameOpChain.getFirstToken().isKind(KW_XLOC)){
			frameOpChain.getArg().visit(this, arg);
			mv.visitMethodInsn(INVOKEVIRTUAL, "cop5556sp17/PLPRuntimeFrame", "getXVal", "()I", false);
		}else if(frameOpChain.getFirstToken().isKind(KW_YLOC)){
			frameOpChain.getArg().visit(this, arg);
			mv.visitMethodInsn(INVOKEVIRTUAL, "cop5556sp17/PLPRuntimeFrame", "getYVal", "()I", false);
		}
		return null;
	}

	@Override
	public Object visitIdentChain(IdentChain identChain, Object arg) throws Exception {
	//	assert false : "not yet implemented";
		String str=(String)arg;
		if(str.equals("left")){
			if(dectable.lookup(identChain.getFirstToken().getText())!=null){
				if(identChain.get()==Type.TypeName.INTEGER){
					mv.visitVarInsn(ILOAD, dectable.lookup(identChain.getFirstToken().getText()).getslot());
				}else{
					mv.visitVarInsn(ALOAD, dectable.lookup(identChain.getFirstToken().getText()).getslot());
				}
			}else if(paramtable.lookup(identChain.getFirstToken().getText())!=null){
				mv.visitVarInsn(ALOAD, 0);
				if (identChain.get().isType(TypeName.INTEGER)) {
					mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "I");
				} else if (identChain.get().isType(TypeName.BOOLEAN)) {
					mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "Z");
				}
				else if (identChain.get().isType(TypeName.FILE)) {
					mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(),"Ljava/io/File;");
				}
				else if (identChain.get().isType(TypeName.URL)) {
					mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "Ljava/net/URL;");
				}
			}else{
				throw new Exception("can't find ident");
			}

		
		}else if(str.equals("right")){
			if(identChain.get()==Type.TypeName.INTEGER||identChain.get()==Type.TypeName.IMAGE){
				mv.visitInsn(DUP);
				if(dectable.lookup(identChain.getFirstToken().getText())!=null){
					if(identChain.get()==Type.TypeName.INTEGER){
						mv.visitVarInsn(ISTORE, dectable.lookup(identChain.getFirstToken().getText()).getslot());
					}else{
						mv.visitVarInsn(ASTORE, dectable.lookup(identChain.getFirstToken().getText()).getslot());
					}
				}else if(paramtable.lookup(identChain.getFirstToken().getText())!=null){
					mv.visitVarInsn(ALOAD, 0);
					mv.visitInsn(SWAP);
					if (identChain.get().isType(TypeName.INTEGER)) {
						mv.visitFieldInsn(PUTFIELD, className, identChain.getFirstToken().getText(), "I");
					} else if (identChain.get().isType(TypeName.BOOLEAN)) {
						mv.visitFieldInsn(PUTFIELD, className, identChain.getFirstToken().getText(), "Z");
					}
					else if (identChain.get().isType(TypeName.FILE)) {
						mv.visitFieldInsn(PUTFIELD, className, identChain.getFirstToken().getText(),"Ljava/io/File;");
					}
					else if (identChain.get().isType(TypeName.URL)) {
						mv.visitFieldInsn(PUTFIELD, className, identChain.getFirstToken().getText(), "Ljava/net/URL;");
					}
				}else{
					throw new Exception("can't find ident");
				}
			}else if(identChain.get()==Type.TypeName.FILE){
				if(paramtable.lookup(identChain.getFirstToken().getText())!=null){
					mv.visitVarInsn(ALOAD, 0);
					if (identChain.get().isType(TypeName.INTEGER)) {
						mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "I");
					} else if (identChain.get().isType(TypeName.BOOLEAN)) {
						mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "Z");
					}
					else if (identChain.get().isType(TypeName.FILE)) {
						mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(),"Ljava/io/File;");
					}
					else if (identChain.get().isType(TypeName.URL)) {
						mv.visitFieldInsn(GETFIELD, className, identChain.getFirstToken().getText(), "Ljava/net/URL;");
					}
				}else{
					throw new Exception("can't find ident");
				}
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageIO", "write", "(Ljava/awt/image/BufferedImage;Ljava/io/File;)Ljava/awt/image/BufferedImage;", false);
				mv.visitInsn(POP);
			}else if(identChain.get()==Type.TypeName.FRAME){
				if(dectable.lookup(identChain.getFirstToken().getText())!=null){
					//System.out.println(identChain.getFirstToken().getText());
					if(frame.get(dectable.lookup(identChain.getFirstToken().getText()))){
						mv.visitVarInsn(ALOAD, dectable.lookup(identChain.getFirstToken().getText()).getslot());
					}else{
						mv.visitInsn(ACONST_NULL);
						frame.put(dectable.lookup(identChain.getFirstToken().getText()),true);
					}
				}else{
					throw new Exception("can't find ident");
				}
				mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeFrame", "createOrSetFrame", "(Ljava/awt/image/BufferedImage;Lcop5556sp17/PLPRuntimeFrame;)Lcop5556sp17/PLPRuntimeFrame;", false);
				mv.visitInsn(DUP);
				mv.visitVarInsn(ASTORE,dectable.lookup(identChain.getFirstToken().getText()).getslot());
			}
		}
		return null;
	}

	@Override
	public Object visitIdentExpression(IdentExpression identExpression, Object arg) throws Exception {
		//TODO Implement this
	//	System.out.println(identExpression.getText());
	    if(paramtable.lookup(identExpression.getFirstToken().getText())!=null){
			mv.visitVarInsn(ALOAD, 0);
			if (identExpression.getdec().get().isType(TypeName.INTEGER)) {
				mv.visitFieldInsn(GETFIELD, className, identExpression.getdec().getIdent().getText(), "I");
			} else if (identExpression.getdec().get().isType(TypeName.BOOLEAN)) {
				mv.visitFieldInsn(GETFIELD, className, identExpression.getdec().getIdent().getText(), "Z");
			}
			else if(identExpression.getdec().get()==Type.TypeName.FILE){
				mv.visitFieldInsn(GETFIELD, className, identExpression.getdec().getIdent().getText(),"Ljava/io/File;");
			}
			else if(identExpression.getdec().get()==Type.TypeName.URL){
				mv.visitFieldInsn(GETFIELD, className, identExpression.getdec().getIdent().getText(), "Ljava/net/URL;");
			}
		}else if(dectable.lookup(identExpression.getFirstToken().getText())!=null){
			if(dectable.lookup(identExpression.getFirstToken().getText()).get()==Type.TypeName.IMAGE){
				mv.visitVarInsn(ALOAD, identExpression.getdec().getslot());
			}
			else if (dectable.lookup(identExpression.getFirstToken().getText()).get()==Type.TypeName.FRAME){
				mv.visitVarInsn(ALOAD, identExpression.getdec().getslot());
			}
			else{
				mv.visitVarInsn(ILOAD, identExpression.getdec().getslot());
			}
		}
	    else{
			throw new Exception("can't find ident");
		}
		return null;
	}

	@Override
	public Object visitIdentLValue(IdentLValue identX, Object arg) throws Exception {
		//TODO Implement this
		if(dectable.lookup(identX.getText())!=null){			
			if(dectable.lookup(identX.getText()).get().isType(Type.TypeName.IMAGE)){
			//	mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "copyImage", "(Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;", false);
				mv.visitVarInsn(ASTORE, identX.getdec().getslot());
			}
			else if (dectable.lookup(identX.getText()).get().isType(Type.TypeName.FRAME))
			{
				mv.visitVarInsn(ASTORE, identX.getdec().getslot());
			}
			else{
				mv.visitVarInsn(ISTORE, identX.getdec().getslot());
			}
		}else if(paramtable.lookup(identX.getText())!=null){
			mv.visitVarInsn(ALOAD, 0);
			mv.visitInsn(SWAP);
			if (identX.getdec().get().isType(TypeName.INTEGER)) {
				mv.visitFieldInsn(PUTFIELD, className, identX.getText(), "I");
			} else if (identX.getdec().get().isType(TypeName.BOOLEAN)) {
				mv.visitFieldInsn(PUTFIELD, className, identX.getText(), "Z");
			}
			else if(identX.getdec().get()==Type.TypeName.FILE){
				mv.visitFieldInsn(PUTFIELD, className, identX.getText(),"Ljava/io/File;");
			}
			else if(identX.getdec().get()==Type.TypeName.URL){
				mv.visitFieldInsn(PUTFIELD, className, identX.getText(), "Ljava/net/URL;");
			}
		}else{
			throw new Exception("can't find ident");
		}
		return null;

	}

	@Override
	public Object visitIfStatement(IfStatement ifStatement, Object arg) throws Exception {
		//TODO Implement this
		Label GUARD = new Label();
		ifStatement.getE().visit(this, arg);
		mv.visitJumpInsn(IFEQ, GUARD);
		ifStatement.getB().visit(this, arg);
		mv.visitLabel(GUARD);
		return null;
	}

	@Override
	public Object visitImageOpChain(ImageOpChain imageOpChain, Object arg) throws Exception {
//		assert false : "not yet implemented";
		imageOpChain.getArg().visit(this, arg);
		if(imageOpChain.getFirstToken().isKind(OP_WIDTH)){
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/awt/image/BufferedImage", "getWidth", "()I", false);
		}else if(imageOpChain.getFirstToken().isKind(OP_HEIGHT)){
			mv.visitMethodInsn(INVOKEVIRTUAL, "java/awt/image/BufferedImage", "getHeight", "()I", false);
		}else if(imageOpChain.getFirstToken().isKind(KW_SCALE)){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageOps", "scale", "(Ljava/awt/image/BufferedImage;I)Ljava/awt/image/BufferedImage;", false);
		}
		return null;
	}

	@Override
	public Object visitIntLitExpression(IntLitExpression intLitExpression, Object arg) throws Exception {
		//TODO Implement this
		mv.visitLdcInsn(Integer.parseInt(intLitExpression.getFirstToken().getText()));
		return null;
	}


	@Override
	public Object visitParamDec(ParamDec paramDec, Object arg) throws Exception {
		//TODO Implement this
		//For assignment 5, only needs to handle integers and booleans
		MethodVisitor mv = (MethodVisitor)arg;
		mv.visitVarInsn(ALOAD, 0);
		if (paramDec.get()==Type.TypeName.FILE)
		{
			mv.visitTypeInsn(NEW, "java/io/File");
			mv.visitInsn(DUP);
		}
		mv.visitVarInsn(ALOAD, 1);
		mv.visitLdcInsn(paramDec.getslot());
		if (paramDec.get()!=Type.TypeName.URL)
			mv.visitInsn(AALOAD);
		if(paramDec.get()==Type.TypeName.INTEGER){
			mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "parseInt", "(Ljava/lang/String;)I", false);
			mv.visitFieldInsn(PUTFIELD, className, paramDec.getIdent().getText(), "I");
		}else if(paramDec.get()==Type.TypeName.BOOLEAN){
			mv.visitMethodInsn(INVOKESTATIC, "java/lang/Boolean", "parseBoolean", "(Ljava/lang/String;)Z", false);
			mv.visitFieldInsn(PUTFIELD, className, paramDec.getIdent().getText(), "Z");
		}
		else if(paramDec.get()==Type.TypeName.FILE){
			mv.visitMethodInsn(INVOKESPECIAL, "java/io/File", "<init>", "(Ljava/lang/String;)V", false);
			mv.visitFieldInsn(PUTFIELD, className, paramDec.getIdent().getText(),"Ljava/io/File;");
		}
		else if(paramDec.get()==Type.TypeName.URL){
			mv.visitMethodInsn(INVOKESTATIC, "cop5556sp17/PLPRuntimeImageIO", "getURL", "([Ljava/lang/String;I)Ljava/net/URL;", false);
			mv.visitFieldInsn(PUTFIELD, className, paramDec.getIdent().getText(), "Ljava/net/URL;");
		}
		/*if (paramDec.get().isType(TypeName.INTEGER)) {
			fv = cw.visitField(0, paramDec.getIdent().getText(), "I", null, null);
			fv.visitEnd();
		} else if (paramDec.get().isType(TypeName.BOOLEAN)) {
			fv = cw.visitField(0, paramDec.getIdent().getText(), "Z", null, null);
			fv.visitEnd();
		}*/
		return null;

	}

	@Override
	public Object visitSleepStatement(SleepStatement sleepStatement, Object arg) throws Exception {
//		assert false : "not yet implemented";
	    sleepStatement.getE().visit(this, arg);
	    mv.visitInsn(I2L);
	    mv.visitMethodInsn(INVOKESTATIC,"java/lang/Thread","sleep","(J)V",false);
		return null;
	}

	@Override
	public Object visitTuple(Tuple tuple, Object arg) throws Exception {
//		assert false : "not yet implemented";
		for (Expression e:tuple.getExprList())
			e.visit(this, arg);
		return null;
	}

	@Override
	public Object visitWhileStatement(WhileStatement whileStatement, Object arg) throws Exception {
		//TODO Implement this
		Label GUARD = new Label();
		Label BODY = new Label();
		mv.visitJumpInsn(GOTO, GUARD);
		mv.visitLabel(BODY);
		whileStatement.getB().visit(this, arg);
		mv.visitLabel(GUARD);
		whileStatement.getE().visit(this, arg);
		mv.visitJumpInsn(IFNE, BODY);
		return null;
	}

}
