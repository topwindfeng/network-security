package cop5556sp17;
import java.util.List;
import java.util.ArrayList;

import cop5556sp17.Scanner.Kind;
import static cop5556sp17.Scanner.Kind.*;


import cop5556sp17.Scanner.Token;
import cop5556sp17.AST.*;

public class Parser {

	/**
	 * Exception to be thrown if a syntax error is detected in the input.
	 * You will want to provide a useful error message.
	 *
	 */
	@SuppressWarnings("serial")
	public static class SyntaxException extends Exception {
		public SyntaxException(String message) {
			super(message);
		}
	}
	
	/**
	 * Useful during development to ensure unimplemented routines are
	 * not accidentally called during development.  Delete it when 
	 * the Parser is finished.
	 *
	 */
	@SuppressWarnings("serial")	
	public static class UnimplementedFeatureException extends RuntimeException {
		public UnimplementedFeatureException() {
			super();
		}
	}

	Scanner scanner;
	Token t;

	Parser(Scanner scanner) {
		this.scanner = scanner;
		t = scanner.nextToken();
	}

	/**
	 * parse the input using tokens from the scanner.
	 * Check for EOF (i.e. no trailing junk) when finished
	 * 
	 * @throws SyntaxException
	 */
	ASTNode parse() throws SyntaxException {
		ASTNode an=program();
		matchEOF();
		return an;
	}

	Expression expression() throws SyntaxException {
		//TODO
		Token temp=t;
		Expression e1=term();
		while (t.kind==LT||t.kind==LE||t.kind==GT||t.kind==GE||t.kind==EQUAL||t.kind==NOTEQUAL) //weakOp
		{
			Token temp2=t;
			consume();
			BinaryExpression be=new BinaryExpression(temp,e1,temp2,term());
			e1=be;
		}
		return e1;
		//throw new UnimplementedFeatureException();
	}

	Expression term() throws SyntaxException {
		//TODO
		Token temp=t;
		Expression e1=elem();
		while(t.kind==PLUS||t.kind==MINUS||t.kind==OR)
		{
			Token temp2=t;
			consume();
			BinaryExpression be=new BinaryExpression(temp,e1,temp2,elem());
			e1=be;
		}
		return e1;
		//throw new UnimplementedFeatureException();
	}

	Expression elem() throws SyntaxException {
		//TODO
		Token temp=t;
		Expression e1=factor();
		while(t.kind==TIMES||t.kind==DIV||t.kind==AND||t.kind==MOD)
		{
			Token temp2=t;
			consume();
			BinaryExpression be=new BinaryExpression(temp,e1,temp2,factor());
			e1=be;
		}
		return e1;
		//throw new UnimplementedFeatureException();
	}

	Expression factor() throws SyntaxException {
		Token temp=t;
		Kind kind = t.kind;
		switch (kind) {
		case IDENT: {
			consume();
			IdentExpression ie=new IdentExpression(temp);
			return ie;
		}
		case INT_LIT: {
			consume();
			IntLitExpression ile=new IntLitExpression(temp);
			return ile;
		}
		case KW_TRUE:
		case KW_FALSE: {
			consume();
			BooleanLitExpression ble=new BooleanLitExpression(temp);
			return ble;
		}
		case KW_SCREENWIDTH:
		case KW_SCREENHEIGHT: {
			consume();
			ConstantExpression ce=new ConstantExpression(temp);
			return ce;
		}
		case LPAREN: {
			consume();
			Expression e=expression();
			match(RPAREN);
			return e;
		}
		default:
			//you will want to provide a more useful error message
			throw new SyntaxException("illegal factor");
		}
	}

	Block block() throws SyntaxException {
		//TODO
		Token temp=t;
		ArrayList<Dec> lst=new ArrayList();
		ArrayList<Statement> lst2=new ArrayList();
		if (t.kind==LBRACE)
		{
			consume();
			while (t.kind==KW_INTEGER||t.kind==KW_BOOLEAN||t.kind==KW_IMAGE||t.kind==KW_FRAME||t.kind==OP_SLEEP||t.kind==KW_WHILE||t.kind==KW_IF||t.kind==IDENT||t.kind==OP_BLUR||t.kind==OP_GRAY||t.kind==OP_CONVOLVE||t.kind==KW_SHOW||t.kind==KW_HIDE||t.kind==KW_MOVE||t.kind==KW_XLOC||t.kind==KW_YLOC||t.kind==OP_WIDTH||t.kind==OP_HEIGHT||t.kind==KW_SCALE)
			{
			switch(t.kind){
			case KW_INTEGER:case KW_BOOLEAN:case KW_IMAGE:case KW_FRAME:
			{
				lst.add(dec());
			}break;
			case OP_SLEEP:case KW_WHILE:case KW_IF:case IDENT:case OP_BLUR:case OP_GRAY:case OP_CONVOLVE:case KW_SHOW:case KW_HIDE:case KW_MOVE:case KW_XLOC:case KW_YLOC:case OP_WIDTH:case OP_HEIGHT:case KW_SCALE:
			{
				lst2.add(statement());
			}break;
			}
			}
			match(RBRACE);
		}
		else throw new SyntaxException("illegal block");
		Block b=new Block(temp,lst,lst2);
		return b;
		//throw new UnimplementedFeatureException();
	}

	Program program() throws SyntaxException {
		//TODO
		Token temp=t;
		ArrayList<ParamDec> lst=new ArrayList();
		Program p;
		if (t.kind==IDENT)
		{
			consume();
			switch(t.kind)
			{
			case LBRACE:
			{
			   p=new Program(temp,lst,block());
			   return p;
			}
			case KW_URL:case KW_FILE:case KW_INTEGER:case KW_BOOLEAN:
			{
				lst.add(paramDec());
				while (t.kind==COMMA)
				{
					consume();
					lst.add(paramDec());
				}
				p=new Program(temp,lst,block());
				return p;
			}
			default: throw new SyntaxException("illegal program");
			}
		}
		else throw new SyntaxException("illegal program");
		//throw new UnimplementedFeatureException();
	}

	ParamDec paramDec() throws SyntaxException {
		//TODO
		Token temp=t;
		Token temp2;
		ParamDec pd;
		switch (t.kind)
		{
		case KW_URL:case KW_FILE:case KW_INTEGER:case KW_BOOLEAN:
		{
			consume();
			if (t.kind==IDENT)
			{
				temp2=t;
				consume();
			}
			else
				throw new SyntaxException("illegal paramdec");
			pd=new ParamDec(temp,temp2);
			return pd;
		}
		default: throw new SyntaxException("illegal paramdec");
		}
		//throw new UnimplementedFeatureException();
	}

	Dec dec() throws SyntaxException {
		//TODO
		Token temp=t;
		Token temp2;
		switch (t.kind)
		{
		case KW_INTEGER:case KW_BOOLEAN:case KW_IMAGE:case KW_FRAME:
		{
			consume();
			if (t.kind==IDENT)
			{
				temp2=t;
				consume();
			}
			else
				throw new SyntaxException("illegal dec");
		}break;
		default: throw new SyntaxException("illegal dec");
		}
		Dec d=new Dec(temp,temp2);
		return d;
		//throw new UnimplementedFeatureException();
	}

	Statement statement() throws SyntaxException {
		//TODO
		Token temp=t;
		switch(t.kind)
		{
		case OP_SLEEP:
		{
			consume();
			SleepStatement ss=new SleepStatement(temp,expression());
			match(SEMI);
			return ss;
		}
		case KW_WHILE:
		{
			consume();
			match(LPAREN);
			Expression e=expression();
			match(RPAREN);
			WhileStatement ws=new WhileStatement(temp,e,block());
			return ws;
		}
		case KW_IF:
		{
			consume();
			match(LPAREN);
			Expression e=expression();
			match(RPAREN);
			IfStatement is=new IfStatement(temp,e,block());
			return is;
		}
		case IDENT:
		{
			Token temp2=t;
			ChainElem c1=chainElem();
			if (t.kind==ASSIGN)
			{
				consume();
				IdentLValue ilv=new IdentLValue(temp2);
			    AssignmentStatement as=new AssignmentStatement(temp,ilv,expression());
			    match(SEMI);
			    return as;
			}
			else
			{
				BinaryChain bc;
				Token temp3=t;
				if (t.kind==ARROW||t.kind==BARARROW)
				{
					temp3=t;
					consume();
				}
				else
					throw new SyntaxException("illegal chain");
				ChainElem c2=chainElem();
				bc=new BinaryChain(temp2,c1,temp3,c2);
				while (t.kind==ARROW||t.kind==BARARROW)
				{
					temp3=t;
					consume();
					bc=new BinaryChain(temp2,bc,temp3,chainElem());
				}
				match(SEMI);
				return bc;
			}
		}
		case OP_BLUR:case OP_GRAY:case OP_CONVOLVE:case KW_SHOW:case KW_HIDE:case KW_MOVE:case KW_XLOC:case KW_YLOC:case OP_WIDTH:case OP_HEIGHT:case KW_SCALE:
		{
			Chain c=chain();
			match(SEMI);
			return c;
		}
		default: throw new SyntaxException("illegal statement");
		}
		//throw new UnimplementedFeatureException();
	}

	Chain chain() throws SyntaxException {
		//TODO
		Token temp=t;
		Token temp2;
		BinaryChain bc;
		ChainElem c1=chainElem();
		if (t.kind==ARROW||t.kind==BARARROW)
		{
			temp2=t;
			consume();
		}
		else
			throw new SyntaxException("illegal chain");
		ChainElem c2=chainElem();
		bc=new BinaryChain(temp,c1,temp2,c2);
		while (t.kind==ARROW||t.kind==BARARROW)
		{
			temp2=t;
			consume();
			bc=new BinaryChain(temp,bc,temp2,chainElem());
		}
		return bc;
		//throw new UnimplementedFeatureException();
	}

	ChainElem chainElem() throws SyntaxException {
		//TODO
		Token temp=t;
		switch (t.kind){
		case OP_BLUR:case OP_GRAY:case OP_CONVOLVE:
		{
			Token temp2=t;
			consume();
			FilterOpChain foc=new FilterOpChain(temp,arg());
			return foc;
		}
		case KW_SHOW:case KW_HIDE:case KW_MOVE:case KW_XLOC:case KW_YLOC:
		{
			Token temp2=t;
			consume();
			FrameOpChain foc=new FrameOpChain(temp,arg());
			return foc;
		}
		case OP_WIDTH:case OP_HEIGHT:case KW_SCALE:
		{
			Token temp2=t;
			consume();
			ImageOpChain ioc=new ImageOpChain(temp,arg());
			return ioc;
		}
		case IDENT:
		{
			consume();
			IdentChain ic=new IdentChain(temp);
			return ic;
		}
		default:throw new SyntaxException("illegal chainElem");
		}
	}

	
	Tuple arg() throws SyntaxException {
		//TODO
		Token temp=t;
		List<Expression> lst=new ArrayList();
		if (t.kind==LPAREN)
		{
			consume();
			lst.add(expression());
			while (t.kind==COMMA)
			{
				consume();
				lst.add(expression());
			}
			match(RPAREN);
		}
		Tuple tup=new Tuple(temp,lst);
		return tup;
		//throw new UnimplementedFeatureException();
	}
	
	
	
	


	/**
	 * Checks whether the current token is the EOF token. If not, a
	 * SyntaxException is thrown.
	 * 
	 * @return
	 * @throws SyntaxException
	 */
	private Token matchEOF() throws SyntaxException {
		if (t.isKind(EOF)) {
			return t;
		}
		throw new SyntaxException("expected EOF");
	}

	/**
	 * Checks if the current token has the given kind. If so, the current token
	 * is consumed and returned. If not, a SyntaxException is thrown.
	 * 
	 * Precondition: kind != EOF
	 * 
	 * @param kind
	 * @return
	 * @throws SyntaxException
	 */
	private Token match(Kind kind) throws SyntaxException {
		if (t.isKind(kind)) {
			return consume();
		}
		throw new SyntaxException("saw " + t.kind + "expected " + kind);
	}

	/**
	 * Checks if the current token has one of the given kinds. If so, the
	 * current token is consumed and returned. If not, a SyntaxException is
	 * thrown.
	 * 
	 * * Precondition: for all given kinds, kind != EOF
	 * 
	 * @param kinds
	 *            list of kinds, matches any one
	 * @return
	 * @throws SyntaxException
	 */
	private Token match(Kind... kinds) throws SyntaxException {
		// TODO. Optional but handy
		return null; //replace this statement
	}

	/**
	 * Gets the next token and returns the consumed token.
	 * 
	 * Precondition: t.kind != EOF
	 * 
	 * @return
	 * 
	 */
	private Token consume() throws SyntaxException {
		Token tmp = t;
		t = scanner.nextToken();
		return tmp;
	}

}
