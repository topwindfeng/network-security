package cop5556sp17;
import java.util.List;
import cop5556sp17.AST.ASTNode;
import cop5556sp17.AST.ASTVisitor;
import cop5556sp17.AST.Tuple;
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
import cop5556sp17.AST.Type.TypeName;
import cop5556sp17.Parser.SyntaxException;
import cop5556sp17.AST.WhileStatement;

import java.util.ArrayList;

import cop5556sp17.Scanner.Kind;
import cop5556sp17.Scanner.LinePos;
import cop5556sp17.Scanner.Token;
import static cop5556sp17.AST.Type.TypeName.*;
import static cop5556sp17.Scanner.Kind.ARROW;
import static cop5556sp17.Scanner.Kind.KW_HIDE;
import static cop5556sp17.Scanner.Kind.KW_MOVE;
import static cop5556sp17.Scanner.Kind.KW_SHOW;
import static cop5556sp17.Scanner.Kind.KW_XLOC;
import static cop5556sp17.Scanner.Kind.KW_YLOC;
import static cop5556sp17.Scanner.Kind.OP_BLUR;
import static cop5556sp17.Scanner.Kind.OP_CONVOLVE;
import static cop5556sp17.Scanner.Kind.OP_GRAY;
import static cop5556sp17.Scanner.Kind.OP_HEIGHT;
import static cop5556sp17.Scanner.Kind.OP_WIDTH;
import static cop5556sp17.Scanner.Kind.*;

public class TypeCheckVisitor implements ASTVisitor {

	@SuppressWarnings("serial")
	public static class TypeCheckException extends Exception {
		TypeCheckException(String message) {
			super(message);
		}
	}

	SymbolTable symtab = new SymbolTable();

	@Override
	public Object visitBinaryChain(BinaryChain binaryChain, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if (binaryChain.getE0().getClass()==IdentChain.class)
			visitIdentChain((IdentChain)binaryChain.getE0(), arg);
		else if (binaryChain.getE0().getClass()==FilterOpChain.class)
			visitFilterOpChain((FilterOpChain)binaryChain.getE0(), arg);
		else if (binaryChain.getE0().getClass()==FrameOpChain.class)
			visitFrameOpChain((FrameOpChain)binaryChain.getE0(), arg);
		else if (binaryChain.getE0().getClass()==ImageOpChain.class)
			visitImageOpChain((ImageOpChain)binaryChain.getE0(), arg);
		else if (binaryChain.getE0().getClass()==BinaryChain.class)
			visitBinaryChain((BinaryChain)binaryChain.getE0(), arg);
		
		if (binaryChain.getE1().getClass()==IdentChain.class)
			visitIdentChain((IdentChain)binaryChain.getE1(), arg);
		else if (binaryChain.getE1().getClass()==FilterOpChain.class)
			visitFilterOpChain((FilterOpChain)binaryChain.getE1(), arg);
		else if (binaryChain.getE1().getClass()==FrameOpChain.class)
			visitFrameOpChain((FrameOpChain)binaryChain.getE1(), arg);
		else if (binaryChain.getE1().getClass()==ImageOpChain.class)
			visitImageOpChain((ImageOpChain)binaryChain.getE1(), arg);
		
		
		if (binaryChain.getE0().get()==URL&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==IMAGE)
			binaryChain.set(IMAGE);
		else if (binaryChain.getE0().get()==FILE&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==IMAGE)
			binaryChain.set(IMAGE);
		else if (binaryChain.getE0().get()==FRAME&&binaryChain.getArrow().kind==ARROW&&(binaryChain.getE1().firstToken.kind==KW_XLOC||binaryChain.getE1().firstToken.kind==KW_YLOC)&&binaryChain.getE1() instanceof FrameOpChain)
			binaryChain.set(INTEGER);
		else if (binaryChain.getE0().get()==FRAME&&binaryChain.getArrow().kind==ARROW&&(binaryChain.getE1().firstToken.kind==KW_SHOW||binaryChain.getE1().firstToken.kind==KW_HIDE||binaryChain.getE1().firstToken.kind==KW_MOVE)&&binaryChain.getE1() instanceof FrameOpChain)
			binaryChain.set(FRAME);
		else if (binaryChain.getE0().get()==IMAGE&&binaryChain.getArrow().kind==ARROW&&(binaryChain.getE1().firstToken.kind==OP_WIDTH||binaryChain.getE1().firstToken.kind==OP_HEIGHT)&&binaryChain.getE1() instanceof ImageOpChain)
			binaryChain.set(INTEGER);
		else if (binaryChain.getE0().get()==IMAGE&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==FRAME)
			binaryChain.set(FRAME);
		else if (binaryChain.getE0().get()==IMAGE&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==FILE)
			binaryChain.set(NONE);
		else if (binaryChain.getE0().get()==IMAGE&&(binaryChain.getArrow().kind==ARROW||binaryChain.getArrow().kind==BARARROW)&&(binaryChain.getE1().firstToken.kind==OP_GRAY||binaryChain.getE1().firstToken.kind==OP_BLUR||binaryChain.getE1().firstToken.kind==OP_CONVOLVE)&&binaryChain.getE1() instanceof FilterOpChain)
			binaryChain.set(IMAGE);
		else if (binaryChain.getE0().get()==IMAGE&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().firstToken.kind==KW_SCALE&&binaryChain.getE1() instanceof ImageOpChain)
			binaryChain.set(IMAGE);
		else if (binaryChain.getE0().get()==IMAGE&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==IMAGE&&binaryChain.getE1() instanceof IdentChain)
			binaryChain.set(IMAGE);
		else if (binaryChain.getE0().get()==INTEGER&&binaryChain.getArrow().kind==ARROW&&binaryChain.getE1().get()==INTEGER&&binaryChain.getE1() instanceof IdentChain)
			binaryChain.set(INTEGER);
		else throw new TypeCheckException("illegal visitBinaryChain");
		return null;
	}

	@Override
	public Object visitBinaryExpression(BinaryExpression binaryExpression, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if (binaryExpression.getE0().getClass()==IdentExpression.class)
			visitIdentExpression((IdentExpression)binaryExpression.getE0(),arg);
		else if (binaryExpression.getE0().getClass()==IntLitExpression.class)
			visitIntLitExpression((IntLitExpression)binaryExpression.getE0(),arg);
		else if (binaryExpression.getE0().getClass()==BooleanLitExpression.class)
			visitBooleanLitExpression((BooleanLitExpression)binaryExpression.getE0(),arg);
		else if (binaryExpression.getE0().getClass()==ConstantExpression.class)
			visitConstantExpression((ConstantExpression)binaryExpression.getE0(),arg);
		else if (binaryExpression.getE0().getClass()==BinaryExpression.class)
			visitBinaryExpression((BinaryExpression)binaryExpression.getE0(),arg);
		
		if (binaryExpression.getE1().getClass()==IdentExpression.class)
			visitIdentExpression((IdentExpression)binaryExpression.getE1(),arg);
		else if (binaryExpression.getE1().getClass()==IntLitExpression.class)
			visitIntLitExpression((IntLitExpression)binaryExpression.getE1(),arg);
		else if (binaryExpression.getE1().getClass()==BooleanLitExpression.class)
			visitBooleanLitExpression((BooleanLitExpression)binaryExpression.getE1(),arg);
		else if (binaryExpression.getE1().getClass()==ConstantExpression.class)
			visitConstantExpression((ConstantExpression)binaryExpression.getE1(),arg);
		else if (binaryExpression.getE1().getClass()==BinaryExpression.class)
			visitBinaryExpression((BinaryExpression)binaryExpression.getE1(),arg);
		
		//System.out.println(binaryExpression.getE0().get());
		//System.out.println(binaryExpression.getE1().get());
		//System.out.println(binaryExpression.getOp().kind);
		
		if (binaryExpression.getE0().get()==null||binaryExpression.getE1().get()==null)
			throw new TypeCheckException("illegal visitBinaryExpression");
		else if (binaryExpression.getE0().get()==INTEGER&&(binaryExpression.getOp().kind==PLUS||binaryExpression.getOp().kind==MINUS)&&binaryExpression.getE1().get()==INTEGER)
			binaryExpression.set(INTEGER);
		else if (binaryExpression.getE0().get()==IMAGE&&(binaryExpression.getOp().kind==PLUS||binaryExpression.getOp().kind==MINUS)&&binaryExpression.getE1().get()==IMAGE)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==INTEGER&&(binaryExpression.getOp().kind==TIMES||binaryExpression.getOp().kind==DIV)&&binaryExpression.getE1().get()==INTEGER)
			binaryExpression.set(INTEGER);
		else if (binaryExpression.getE0().get()==INTEGER&&binaryExpression.getOp().kind==TIMES&&binaryExpression.getE1().get()==IMAGE)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getOp().kind==TIMES&&binaryExpression.getE1().get()==INTEGER)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==INTEGER&&(binaryExpression.getOp().kind==LT||binaryExpression.getOp().kind==GT||binaryExpression.getOp().kind==LE||binaryExpression.getOp().kind==GE)&&binaryExpression.getE1().get()==INTEGER)
			binaryExpression.set(BOOLEAN);
		else if (binaryExpression.getE0().get()==BOOLEAN&&(binaryExpression.getOp().kind==LT||binaryExpression.getOp().kind==GT||binaryExpression.getOp().kind==LE||binaryExpression.getOp().kind==GE)&&binaryExpression.getE1().get()==BOOLEAN)
			binaryExpression.set(BOOLEAN);
		else if ((binaryExpression.getOp().kind==EQUAL||binaryExpression.getOp().kind==NOTEQUAL)&&binaryExpression.getE0().get().equals(binaryExpression.getE1().get()))
			binaryExpression.set(BOOLEAN);
		
		else if (binaryExpression.getE0().get()==BOOLEAN&&binaryExpression.getE1().get()==BOOLEAN&&(binaryExpression.getOp().kind==AND||binaryExpression.getOp().kind==OR))
			binaryExpression.set(BOOLEAN);
		else if (binaryExpression.getE0().get()==INTEGER&&binaryExpression.getE1().get()==INTEGER&&binaryExpression.getOp().kind==MOD)
			binaryExpression.set(INTEGER);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getE1().get()==INTEGER&&binaryExpression.getOp().kind==MOD)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getE1().get()==INTEGER&&binaryExpression.getOp().kind==DIV)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getE1().get()==INTEGER&&binaryExpression.getOp().kind==TIMES)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getE1().get()==IMAGE&&binaryExpression.getOp().kind==PLUS)
			binaryExpression.set(IMAGE);
		else if (binaryExpression.getE0().get()==IMAGE&&binaryExpression.getE1().get()==IMAGE&&binaryExpression.getOp().kind==MINUS)
			binaryExpression.set(IMAGE);
		else throw new TypeCheckException("illegal visitBinaryExpression");
		return null;
	}

	@Override
	public Object visitBlock(Block block, Object arg) throws Exception {
		// TODO Auto-generated method stub
		symtab.enterScope();
		int dec_len=block.getDecs().size(),st_len=block.getStatements().size();
		int count=0;
		while(count<dec_len)
		{
			visitDec(block.getDecs().get(count),arg);
			count++;
		}
		count=0;
		while(count<st_len)
		{
			
			if(block.getStatements().get(count).getClass()==SleepStatement.class)
			{
				visitSleepStatement((SleepStatement)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==WhileStatement.class)
			{
				visitWhileStatement((WhileStatement)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==IfStatement.class)
			{
				visitIfStatement((IfStatement)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==IdentChain.class)
			{
				visitIdentChain((IdentChain)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==FilterOpChain.class)
			{
				visitFilterOpChain((FilterOpChain)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==FrameOpChain.class)
			{
				visitFrameOpChain((FrameOpChain)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==ImageOpChain.class)
			{
				visitImageOpChain((ImageOpChain)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==BinaryChain.class)
			{
				visitBinaryChain((BinaryChain)block.getStatements().get(count),arg);
			}
			else if(block.getStatements().get(count).getClass()==AssignmentStatement.class)
			{
				visitAssignmentStatement((AssignmentStatement)block.getStatements().get(count),arg);
			}
			count++;
		}
		symtab.leaveScope();
		return null;
	}

	@Override
	public Object visitBooleanLitExpression(BooleanLitExpression booleanLitExpression, Object arg) throws Exception {
		// TODO Auto-generated method stub
		booleanLitExpression.set(BOOLEAN);
		return null;
	}

	@Override
	public Object visitFilterOpChain(FilterOpChain filterOpChain, Object arg) throws Exception {
		// TODO Auto-generated method stub
		visitTuple(filterOpChain.getArg(),arg);
		if (filterOpChain.getArg().getExprList().size()==0)
			filterOpChain.set(IMAGE);
		else throw new TypeCheckException("illegal visitFilterOpchain");
		return null;
	}

	@Override
	public Object visitFrameOpChain(FrameOpChain frameOpChain, Object arg) throws Exception {
		// TODO Auto-generated method stub
		visitTuple(frameOpChain.getArg(),arg);
		frameOpChain.setkind(frameOpChain.getFirstToken().kind);
		if (frameOpChain.getFirstToken().isKind(KW_SHOW)||frameOpChain.getFirstToken().isKind(KW_HIDE))
		{
			if (frameOpChain.getArg().getExprList().size()==0)
				frameOpChain.set(NONE);
		}
		else if (frameOpChain.getFirstToken().isKind(KW_XLOC)||frameOpChain.getFirstToken().isKind(KW_YLOC))
		{
			if (frameOpChain.getArg().getExprList().size()==0)
				frameOpChain.set(INTEGER);
		}
		else if (frameOpChain.getFirstToken().isKind(KW_MOVE))
		{
			if (frameOpChain.getArg().getExprList().size()==2)
				frameOpChain.set(NONE);
		}
		else throw new TypeCheckException("illegal visitFrameOpChain");
		return null;
	}

	@Override
	public Object visitIdentChain(IdentChain identChain, Object arg) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(identChain.getText());
		if(symtab.lookup(identChain.getText())!=null)
		{
			identChain.set(symtab.lookup(identChain.getText()).get());
		}
		else throw new TypeCheckException("illegal visitIdentChain");
		return null;
	}

	@Override
	public Object visitIdentExpression(IdentExpression identExpression, Object arg) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(identExpression.getText());
		if(symtab.lookup(identExpression.getText())!=null)
		{
			identExpression.set(symtab.lookup(identExpression.getText()).get());
			identExpression.setdec(symtab.lookup(identExpression.getText()));
			//System.out.println(identExpression.getText());
		}
		return null;
	}

	@Override
	public Object visitIfStatement(IfStatement ifStatement, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if(ifStatement.getE().getClass()==IdentExpression.class)
			visitIdentExpression((IdentExpression)ifStatement.getE(),arg);
		else if(ifStatement.getE().getClass()==IntLitExpression.class)
			visitIntLitExpression((IntLitExpression)ifStatement.getE(),arg);
		else if(ifStatement.getE().getClass()==BooleanLitExpression.class)
			visitBooleanLitExpression((BooleanLitExpression)ifStatement.getE(),arg);
		else if(ifStatement.getE().getClass()==ConstantExpression.class)
			visitConstantExpression((ConstantExpression)ifStatement.getE(),arg);
		else if(ifStatement.getE().getClass()==BinaryExpression.class)
			visitBinaryExpression((BinaryExpression)ifStatement.getE(),arg);
		
		visitBlock(ifStatement.getB(),arg);
		
		if (ifStatement.getE().get()!=BOOLEAN)
		   throw new TypeCheckException("illegal visitIfStatement");
		return null;
	}

	@Override
	public Object visitIntLitExpression(IntLitExpression intLitExpression, Object arg) throws Exception {
		// TODO Auto-generated method stub
		intLitExpression.set(INTEGER);
		return null;
	}

	@Override
	public Object visitSleepStatement(SleepStatement sleepStatement, Object arg) throws Exception {
		// TODO Auto-generated method stub
			if (sleepStatement.getE().getClass()==IdentExpression.class)
				visitIdentExpression((IdentExpression)sleepStatement.getE(), arg);
			else if (sleepStatement.getE().getClass()==IntLitExpression.class)
				visitIntLitExpression((IntLitExpression)sleepStatement.getE(), arg);
			else if (sleepStatement.getE().getClass()==BooleanLitExpression.class)
				visitBooleanLitExpression((BooleanLitExpression)sleepStatement.getE(), arg);
			else if (sleepStatement.getE().getClass()==ConstantExpression.class)
				visitConstantExpression((ConstantExpression)sleepStatement.getE(), arg);
			else if (sleepStatement.getE().getClass()==BinaryExpression.class)
				visitBinaryExpression((BinaryExpression)sleepStatement.getE(), arg);
		
		if (!sleepStatement.getE().get().equals(INTEGER))
			throw new TypeCheckException("illegal visitSleepStatement");
		return null;
	}

	@Override
	public Object visitWhileStatement(WhileStatement whileStatement, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if(whileStatement.getE().getClass()==IdentExpression.class)
			visitIdentExpression((IdentExpression)whileStatement.getE(),arg);
		else if(whileStatement.getE().getClass()==IntLitExpression.class)
			visitIntLitExpression((IntLitExpression)whileStatement.getE(),arg);
		else if(whileStatement.getE().getClass()==BooleanLitExpression.class)
			visitBooleanLitExpression((BooleanLitExpression)whileStatement.getE(),arg);
		else if(whileStatement.getE().getClass()==ConstantExpression.class)
			visitConstantExpression((ConstantExpression)whileStatement.getE(),arg);
		else if(whileStatement.getE().getClass()==BinaryExpression.class)
			visitBinaryExpression((BinaryExpression)whileStatement.getE(),arg);
		
		visitBlock(whileStatement.getB(),arg);
		
		if (whileStatement.getE().get()!=BOOLEAN)
			   throw new TypeCheckException("illegal visitWhileStatement");
		return null;
	}

	@Override
	public Object visitDec(Dec declaration, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if(!symtab.insert(declaration.getIdent().getText(), declaration))
			 throw new TypeCheckException("redeclaration");
		return null;
	}

	@Override
	public Object visitProgram(Program program, Object arg) throws Exception {
		// TODO Auto-generated method stub
		symtab.init_scopenum();
		int len=program.getParams().size(),count=0;
		while(count<len)
		{
		    visitParamDec(program.getParams().get(count),arg);
		    count++;
		}
		visitBlock(program.getB(),arg);
		return null;
	}

	@Override
	public Object visitAssignmentStatement(AssignmentStatement assignStatement, Object arg) throws Exception {
		// TODO Auto-generated method stub
			visitIdentLValue(assignStatement.getVar(),arg);
			if (assignStatement.getE().getClass()==IdentExpression.class)
				visitIdentExpression((IdentExpression)assignStatement.getE(), arg);
			else if (assignStatement.getE().getClass()==IntLitExpression.class)
				visitIntLitExpression((IntLitExpression)assignStatement.getE(), arg);
			else if (assignStatement.getE().getClass()==BooleanLitExpression.class)
				visitBooleanLitExpression((BooleanLitExpression)assignStatement.getE(), arg);
			else if (assignStatement.getE().getClass()==ConstantExpression.class)
				visitConstantExpression((ConstantExpression)assignStatement.getE(), arg);
			else if (assignStatement.getE().getClass()==BinaryExpression.class)
				visitBinaryExpression((BinaryExpression)assignStatement.getE(), arg);
			
			//System.out.println(assignStatement.getE().get());
			//System.out.println(assignStatement.getVar().getdec().toString());
			//System.out.println(assignStatement.getE().get());
			//System.out.println(assignStatement.getVar().getText());
			if (!assignStatement.getE().get().equals(assignStatement.getVar().getdec().get()))
				throw new TypeCheckException("illegal visitAssignmentStatement");
			return null;
	}

	@Override
	public Object visitIdentLValue(IdentLValue identX, Object arg) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(identX.getText());
		if(symtab.lookup(identX.getText())!=null)
		{
			identX.setdec(symtab.lookup(identX.getText()));
		}
		else throw new TypeCheckException("illegal visitIdentValue");
		return null;
	}

	@Override
	public Object visitParamDec(ParamDec paramDec, Object arg) throws Exception {
		// TODO Auto-generated method stub
		if (!symtab.insert(paramDec.getIdent().getText(), paramDec))
		   throw new TypeCheckException("redeclaration");
		return null;
	}

	@Override
	public Object visitConstantExpression(ConstantExpression constantExpression, Object arg) {
		// TODO Auto-generated method stub
		constantExpression.set(INTEGER);
		return null;
	}

	@Override
	public Object visitImageOpChain(ImageOpChain imageOpChain, Object arg) throws Exception {
		// TODO Auto-generated method stub
		visitTuple(imageOpChain.getArg(),arg);
		imageOpChain.setkind(imageOpChain.getFirstToken().kind);
		if(imageOpChain.getFirstToken().isKind(OP_WIDTH)||imageOpChain.getFirstToken().isKind(OP_HEIGHT))
		{
			if (imageOpChain.getArg().getExprList().size()==0)
				imageOpChain.set(INTEGER);		
		}
		else if (imageOpChain.getFirstToken().isKind(KW_SCALE))
		{
			if (imageOpChain.getArg().getExprList().size()==1)
				imageOpChain.set(IMAGE);
		}
		else throw new TypeCheckException("illegal visitImageOpChain");
		return null;
	}

	@Override
	public Object visitTuple(Tuple tuple, Object arg) throws Exception {
		// TODO Auto-generated method stub
		int len=tuple.getExprList().size(),count=0;
		while (count<len-1)
		{
			if (tuple.getExprList().get(count).getClass()==IdentExpression.class)
				visitIdentExpression((IdentExpression)tuple.getExprList().get(count),arg);
			else if (tuple.getExprList().get(count).getClass()==IntLitExpression.class)
				visitIntLitExpression((IntLitExpression)tuple.getExprList().get(count),arg);
			else if (tuple.getExprList().get(count).getClass()==BooleanLitExpression.class)
				visitBooleanLitExpression((BooleanLitExpression)tuple.getExprList().get(count),arg);
			else if (tuple.getExprList().get(count).getClass()==ConstantExpression.class)
				visitConstantExpression((ConstantExpression)tuple.getExprList().get(count),arg);
			else if (tuple.getExprList().get(count).getClass()==BinaryExpression.class)
				visitBinaryExpression((BinaryExpression)tuple.getExprList().get(count),arg);
			
			
			
			if (tuple.getExprList().get(count).get()!=INTEGER)
			{
				throw new TypeCheckException("illegal visitTuple");
			}
			count++;
		}
		return null;
	}


}
