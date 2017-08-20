package cop5556sp17.AST;

import cop5556sp17.Scanner.Token;

public class IdentExpression extends Expression {
    Dec dec;
	
	public IdentExpression(Token firstToken) {
		super(firstToken);
	}

	@Override
	public String toString() {
		return "IdentExpression [firstToken=" + firstToken + "]";
	}

	public String getText() {
		return firstToken.getText();
	}
	
	@Override
	public Object visit(ASTVisitor v, Object arg) throws Exception {
		return v.visitIdentExpression(this, arg);
	}
	
	public void setdec(Dec dec)
	{
		this.dec=dec;
	}

	public Dec getdec()
	{
		return this.dec;
	}
}
