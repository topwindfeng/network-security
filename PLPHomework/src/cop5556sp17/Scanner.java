package cop5556sp17;

import java.util.ArrayList;

import cop5556sp17.Scanner.Kind;

public class Scanner {
	
	/**
	 * Kind enum
	 */
	
	public static enum Kind {
		IDENT(""), INT_LIT(""), KW_INTEGER("integer"), KW_BOOLEAN("boolean"), 
		KW_IMAGE("image"), KW_URL("url"), KW_FILE("file"), KW_FRAME("frame"), 
		KW_WHILE("while"), KW_IF("if"), KW_TRUE("true"), KW_FALSE("false"), 
		SEMI(";"), COMMA(","), LPAREN("("), RPAREN(")"), LBRACE("{"), 
		RBRACE("}"), ARROW("->"), BARARROW("|->"), OR("|"), AND("&"), 
		EQUAL("=="), NOTEQUAL("!="), LT("<"), GT(">"), LE("<="), GE(">="), 
		PLUS("+"), MINUS("-"), TIMES("*"), DIV("/"), MOD("%"), NOT("!"), 
		ASSIGN("<-"), OP_BLUR("blur"), OP_GRAY("gray"), OP_CONVOLVE("convolve"), 
		KW_SCREENHEIGHT("screenheight"), KW_SCREENWIDTH("screenwidth"), 
		OP_WIDTH("width"), OP_HEIGHT("height"), KW_XLOC("xloc"), KW_YLOC("yloc"), 
		KW_HIDE("hide"), KW_SHOW("show"), KW_MOVE("move"), OP_SLEEP("sleep"), 
		KW_SCALE("scale"), EOF("eof");

		Kind(String text) {
			this.text = text;
		}

		final String text;

		String getText() {
			return text;
		}
	}
/**
 * Thrown by Scanner when an illegal character is encountered
 */
	@SuppressWarnings("serial")
	public static class IllegalCharException extends Exception {
		public IllegalCharException(String message) {
			super(message);
		}
	}
	
	/**
	 * Thrown by Scanner when an int literal is not a value that can be represented by an int.
	 */
	@SuppressWarnings("serial")
	public static class IllegalNumberException extends Exception {
	public IllegalNumberException(String message){
		super(message);
		}
	}
	

	/**
	 * Holds the line and position in the line of a token.
	 */
	static class LinePos {
		public final int line;
		public final int posInLine;
		
		public LinePos(int line, int posInLine) {
			super();
			this.line = line;
			this.posInLine = posInLine;
		}

		@Override
		public String toString() {
			return "LinePos [line=" + line + ", posInLine=" + posInLine + "]";
		}
	}
		

	

	public class Token {
		public final Kind kind;
		public final int pos;  //position in input array
		public final int length;  
		public final int line;
		public final int row;

		//returns the text of this Token
		public String getText() {
			//TODO IMPLEMENT THIS
			if (this.kind!=Kind.EOF)
			{
				String str=Scanner.this.chars.substring(pos, pos+length);
				return str;
			}
			else return "eof";
		}
		
		//returns a LinePos object representing the line and column of this Token
		LinePos getLinePos(){
			//TODO IMPLEMENT THIS
			LinePos lp=new LinePos(this.line,this.row);
			return lp;
		}

		Token(Kind kind, int pos, int length,int line, int row) {
			this.kind = kind;
			this.pos = pos;
			this.length = length;
			this.line=line;
			this.row=row;
		}

		/** 
		 * Precondition:  kind = Kind.INT_LIT,  the text can be represented with a Java int.
		 * Note that the validity of the input should have been checked when the Token was created.
		 * So the exception should never be thrown.
		 * 
		 * @return  int value of this token, which should represent an INT_LIT
		 * @throws NumberFormatException
		 */
		public int intVal() throws NumberFormatException{
			//TODO IMPLEMENT THIS
			String str=Scanner.this.chars.substring(pos, pos+length);
			int n=Integer.valueOf(str);
			return n;
		}

		public boolean isKind(Kind kind2) {
			// TODO Auto-generated method stub
			if (kind2==this.kind)
			    return true;
			else
				return false;
		}
		
		 @Override
		  public int hashCode() {
		   final int prime = 31;
		   int result = 1;
		   result = prime * result + getOuterType().hashCode();
		   result = prime * result + ((kind == null) ? 0 : kind.hashCode());
		   result = prime * result + length;
		   result = prime * result + pos;
		   return result;
		  }

		  @Override
		  public boolean equals(Object obj) {
		   if (this == obj) {
		    return true;
		   }
		   if (obj == null) {
		    return false;
		   }
		   if (!(obj instanceof Token)) {
		    return false;
		   }
		   Token other = (Token) obj;
		   if (!getOuterType().equals(other.getOuterType())) {
		    return false;
		   }
		   if (kind != other.kind) {
		    return false;
		   }
		   if (length != other.length) {
		    return false;
		   }
		   if (pos != other.pos) {
		    return false;
		   }
		   return true;
		  }

		 

		  private Scanner getOuterType() {
		   return Scanner.this;
		  }
		
		
		
		
	}

	 


	Scanner(String chars) {
		this.chars = chars;
		tokens = new ArrayList<Token>();


	}


	
	/**
	 * Initializes Scanner object by traversing chars and adding tokens to tokens list.
	 * 
	 * @return this scanner
	 * @throws IllegalCharException
	 * @throws IllegalNumberException
	 */
	public Scanner scan() throws IllegalCharException, IllegalNumberException {
		int line=0;
		int row=0;
		int pos = 0; 
		int start=0;
		//TODO IMPLEMENT THIS!!!!
		char[] ch=this.chars.toCharArray();
		int len=ch.length;
//		System.out.print(ch[0]+"\r\n");
		while (pos<len)
		{
			//System.out.println(pos);
//			System.out.print(pos+"\r\n");
			switch(ch[pos])
			{
			    // ident
			    case 'A':case 'B':case 'C':case 'D':case 'E':case 'F':case 'G': case 'H':case 'I':case 'J':
			    case 'K':case 'L':case 'M':case 'N':case 'O':case 'P':case 'Q':case 'R':case 'S':case 'T':
			    case 'U':case 'V':case 'W':case 'X':case 'Y':case 'Z':case 'a':case 'b':case 'c':case 'd':
			    case 'e':case 'f':case 'g': case 'h':case 'i':case 'j':
			    case 'k':case 'l':case 'm':case 'n':case 'o':case 'p':case 'q':case 'r':case 's':case 't':
			    case 'u':case 'v':case 'w':case 'x':case 'y':case 'z':case '$':case '_':
			    {
//			    	System.out.print(start+"\r\n");
			    	start=pos;
			    	pos++;
			    	while (pos<len&&((ch[pos]>=65&&ch[pos]<=90)||(ch[pos]>=97&&ch[pos]<=122)||(ch[pos]>=48&&ch[pos]<=57)||ch[pos]=='$'||ch[pos]=='_'))
			    	{
			    		pos++;
			    	}
			    	String temp_str=this.chars.substring(start,pos);
			    	switch(temp_str)
			    	{
			    	    case "integer": tokens.add(new Token(Kind.KW_INTEGER,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "boolean": tokens.add(new Token(Kind.KW_BOOLEAN,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "image": tokens.add(new Token(Kind.KW_IMAGE,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "url": tokens.add(new Token(Kind.KW_URL,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "file": tokens.add(new Token(Kind.KW_FILE,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "frame": tokens.add(new Token(Kind.KW_FRAME,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "while": tokens.add(new Token(Kind.KW_WHILE,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "if": tokens.add(new Token(Kind.KW_IF,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "true": tokens.add(new Token(Kind.KW_TRUE,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "false": tokens.add(new Token(Kind.KW_FALSE,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "blur": tokens.add(new Token(Kind.OP_BLUR,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "gray": tokens.add(new Token(Kind.OP_GRAY,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "convolve": tokens.add(new Token(Kind.OP_CONVOLVE,start,pos-start,line,row)); row+=(pos-start);break;
			    	    case "screenheight": tokens.add(new Token(Kind.KW_SCREENHEIGHT,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "screenwidth": tokens.add(new Token(Kind.KW_SCREENWIDTH,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "width": tokens.add(new Token(Kind.OP_WIDTH,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "height": tokens.add(new Token(Kind.OP_HEIGHT,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "xloc": tokens.add(new Token(Kind.KW_XLOC,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "yloc": tokens.add(new Token(Kind.KW_YLOC,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "hide": tokens.add(new Token(Kind.KW_HIDE,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "show": tokens.add(new Token(Kind.KW_SHOW,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "move": tokens.add(new Token(Kind.KW_MOVE,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "sleep": tokens.add(new Token(Kind.OP_SLEEP,start,pos-start,line,row));row+=(pos-start); break;
			    	    case "scale": tokens.add(new Token(Kind.KW_SCALE,start,pos-start,line,row));row+=(pos-start); break;
			    	   // case "eof": tokens.add(new Token(Kind.EOF,start,pos-start,line,row));row+=(pos-start); break;
			    	    default: tokens.add(new Token(Kind.IDENT,start,pos-start,line,row));row+=(pos-start);
			    	}
			        break;
			    }
			    //num
			    case '0': 
			    {
			    	pos++;
			    	tokens.add(new Token(Kind.INT_LIT,pos-1,1,line,row));
			    	row++;
			        break;
			    }
			    case '1':case '2':case '3':case '4':case '5':case '6':case '7':case '8':case '9':
			    {
			    	start=pos;
			    	pos++;
			    	while (pos<len&&ch[pos]>=48&&ch[pos]<=57)
			    	{
			    		pos++;
			    	}
			    	if (pos-start>10)
			    	{
			    		row+=(pos-start);
			    		//System.out.println("Exceeding Number Range");
			    		throw new IllegalNumberException("Exceeding Number Range");
			    	}
			    	else if (pos-start==10)
			    	{
			    		String temp_str=this.chars.substring(start,pos-1);
			    	    int temp_int=Integer.valueOf(temp_str);
			    	    if (temp_int>214748364)
			    	    {
			    	    	row+=(pos-start);
			    	    	//System.out.println("Exceeding Number Range");
				    		throw new IllegalNumberException("Exceeding Number Range");
			    	    }
			    	    else if (temp_int<214748364)
			    	    {
			    	    	tokens.add(new Token(Kind.INT_LIT,start,pos-start,line,row));row+=(pos-start);
			    	    }
			    	    else
			    	    {
			    	    	temp_str=this.chars.substring(pos-1,pos);
			    	    	temp_int=Integer.valueOf(temp_str);
			    	    	if (temp_int>7)
			    	    	{
			    	    		row+=(pos-start);
			    	    		//System.out.println("Exceeding Number Range");
					    		throw new IllegalNumberException("Exceeding Number Range");
			    	    	}
			    	    	else
			    	    		tokens.add(new Token(Kind.INT_LIT,start,pos-start,line,row));row+=(pos-start);
			    	    }
			    	}
			    	else
			    	{tokens.add(new Token(Kind.INT_LIT,start,pos-start,line,row));row+=(pos-start);}
			    	break;
			    }
			    case ';': tokens.add(new Token(Kind.SEMI,pos,1,line,row)); pos++;row++; break;
			    case ',': tokens.add(new Token(Kind.COMMA,pos,1,line,row)); pos++;row++; break;
			    case '(': tokens.add(new Token(Kind.LPAREN,pos,1,line,row)); pos++;row++; break;
			    case ')': tokens.add(new Token(Kind.RPAREN,pos,1,line,row)); pos++;row++; break;
			    case '{': tokens.add(new Token(Kind.LBRACE,pos,1,line,row)); pos++;row++; break;
			    case '}': tokens.add(new Token(Kind.RBRACE,pos,1,line,row)); pos++;row++; break;
			    case '&': tokens.add(new Token(Kind.AND,pos,1,line,row)); pos++;row++; break;
			    case '!': 
			    	if ((pos+1)<len&&ch[pos+1]=='=') {tokens.add(new Token(Kind.NOTEQUAL,pos,2,line,row)); pos+=2;row+=2;}
			    	else {tokens.add(new Token(Kind.NOT,pos,1,line,row)); pos++;row++;} break;		
			    case '%': tokens.add(new Token(Kind.MOD,pos,1,line,row)); pos++;row++; break;
			    case '/': 
			    	if ((pos+1)<len&&ch[pos+1]=='*')
			    	{
			    		start=pos;
			    		pos+=2;
			    		while (pos+1<len&&(ch[pos]!='*'||ch[pos+1]!='/'))
			    		{
			    			pos++;
			    		}
			    		if (pos+1<len)
			    		{
			    			pos+=2;
			    		    //tokens.add(new Token(Kind.IDENT,start,pos-start,line,row));
			    		}
			    		else 
			    		{
			    		    throw new IllegalCharException("No Right Comment");
			    		}
			    		row+=(pos-start);
			    	}
			    	else {tokens.add(new Token(Kind.DIV,pos,1,line,row)); pos++;row++;} break;		
			    case '*': tokens.add(new Token(Kind.TIMES,pos,1,line,row)); pos++;row++; break;
			    case '+': tokens.add(new Token(Kind.PLUS,pos,1,line,row)); pos++;row++; break;
			    case '-': 
			    	if ((pos+1)<len&&ch[pos+1]=='>') {tokens.add(new Token(Kind.ARROW,pos,2,line,row)); pos+=2;row+=2;}
			    	else {tokens.add(new Token(Kind.MINUS,pos,1,line,row)); pos++;row++;} break;		
			    case '=': 
			    	if ((pos+1)<len&&ch[pos+1]=='=')
			              {tokens.add(new Token(Kind.EQUAL,pos,2,line,row)); pos+=2;row+=2;}
			        else
			              {pos++; row++; throw new IllegalCharException("Only one '='");} break;
			    case '<': 
			    	if ((pos+1)<len&&ch[pos+1]=='=') {tokens.add(new Token(Kind.LE,pos,2,line,row)); pos+=2;row+=2;}
			    	else if ((pos+1)<len&&ch[pos+1]=='-'){tokens.add(new Token(Kind.ASSIGN,pos,2,line,row)); pos+=2;row+=2;}
			    	else {tokens.add(new Token(Kind.LT,pos,1,line,row)); pos++;row++;} break;
			    case '>': 
			    	if ((pos+1)<len&&ch[pos+1]=='=') {tokens.add(new Token(Kind.GE,pos,2,line,row)); pos+=2;row+=2;}
			    	else {tokens.add(new Token(Kind.GT,pos,1,line,row)); pos++;row++;} break;	
			    case '|': 
			    	if ((pos+1)<len&&ch[pos+1]=='-'&&ch[pos+2]=='>') {tokens.add(new Token(Kind.BARARROW,pos,3,line,row)); pos+=3;row+=3;}
			    	else {tokens.add(new Token(Kind.OR,pos,1,line,row)); pos++;row++;} break;
			    case ' ': pos++;row++; break;
			    case '\n': pos++;row=0; line++;break;
			    case '\t': pos++;row++; break;
			    case '\r' :pos++;row++; break;
			    default: throw new IllegalCharException("Illegal Char") ;
			}
		}
		tokens.add(new Token(Kind.EOF,pos,1,line,row));
		//System.out.print(tokens.get(2).intVal());
		//tokens.add(new Token(Kind.EOF,pos,0));
		return this;  
	}



	final ArrayList<Token> tokens;
	final String chars;
	int tokenNum;

	/*
	 * Return the next token in the token list and update the state so that
	 * the next call will return the Token..  
	 */
	public Token nextToken() {
		if (tokenNum >= tokens.size())
			return null;
		return tokens.get(tokenNum++);
	}
	
	/*
	 * Return the next token in the token list without updating the state.
	 * (So the following call to next will return the same token.)
	 */
	public Token peek(){
		if (tokenNum >= tokens.size())
			return null;
		return tokens.get(tokenNum);		
	}

	

	/**
	 * Returns a LinePos object containing the line and position in line of the 
	 * given token.  
	 * 
	 * Line numbers start counting at 0
	 * 
	 * @param t
	 * @return
	 */
	public LinePos getLinePos(Token t) {
		//TODO IMPLEMENT THIS
		LinePos lp=new LinePos(t.line,t.row);
		return lp;
	}


	
}
