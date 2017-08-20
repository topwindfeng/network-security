package cop5556sp17.AST;

import cop5556sp17.Scanner.Token;
import static cop5556sp17.AST.Type.*;

public abstract class Expression extends ASTNode {
	TypeName type;
	
	protected Expression(Token firstToken) {
		super(firstToken);
	}
	
	public void set(TypeName type)
	{
		this.type=type;
	}
	
	public TypeName get()
	{
		return this.type;
	}

	@Override
	abstract public Object visit(ASTVisitor v, Object arg) throws Exception;
    
}
