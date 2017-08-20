package cop5556sp17;

import static cop5556sp17.Scanner.Kind.*;
import cop5556sp17.Scanner.Kind;
import static org.junit.Assert.assertEquals;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import cop5556sp17.Scanner.IllegalCharException;
import cop5556sp17.Scanner.IllegalNumberException;

public class ScannerTest {

	@Rule
    public ExpectedException thrown = ExpectedException.none();


	
	@Test
	public void testEmpty() throws IllegalCharException, IllegalNumberException {
		String input = "";
		Scanner scanner = new Scanner(input);
		scanner.scan();
	}

	@Test
	public void testSemiConcat() throws IllegalCharException, IllegalNumberException {
		//input string
		String input = ";;;";
		//create and initialize the scanner
		Scanner scanner = new Scanner(input);
		scanner.scan();
		//get the first token and check its kind, position, and contents
		Scanner.Token token = scanner.nextToken();
		assertEquals(SEMI, token.kind);
		assertEquals(0, token.pos);
		String text = SEMI.getText();
		assertEquals(text.length(), token.length);
		assertEquals(text, token.getText());
		//get the next token and check its kind, position, and contents
		Scanner.Token token1 = scanner.nextToken();
		assertEquals(SEMI, token1.kind);
		assertEquals(1, token1.pos);
		assertEquals(text.length(), token1.length);
		assertEquals(text, token1.getText());
		Scanner.Token token2 = scanner.nextToken();
		assertEquals(SEMI, token2.kind);
		assertEquals(2, token2.pos);
		assertEquals(text.length(), token2.length);
		assertEquals(text, token2.getText());
		//check that the scanner has inserted an EOF token at the end
		Scanner.Token token3 = scanner.nextToken();
		assertEquals(Scanner.Kind.EOF,token3.kind);
	}
	
	
	/**
	 * This test illustrates how to check that the Scanner detects errors properly. 
	 * In this test, the input contains an int literal with a value that exceeds the range of an int.
	 * The scanner should detect this and throw and IllegalNumberException.
	 * 
	 * @throws IllegalCharException
	 * @throws IllegalNumberException
	 */
	
	@Test
	public void testIntOverflowError() throws IllegalCharException, IllegalNumberException{
		String input = "99999999999999999";
		Scanner scanner = new Scanner(input);
		thrown.expect(IllegalNumberException.class);
		scanner.scan();
	}

//TODO  more tests
	@Test
	public void testMultilineInput() throws IllegalCharException, IllegalNumberException {
		//input string
		String input = "integer i1<- 233;\n move i1 -> xloc 3333;";
		//create and initialize the scanner
		Scanner scanner = new Scanner(input);
		scanner.scan();
		//get the first token and check its kind, position, and contents
		Scanner.Token token = scanner.nextToken();
		assertEquals(KW_INTEGER, token.kind);
		assertEquals(0, token.pos);
		String text = KW_INTEGER.getText();
		assertEquals(text.length(), token.length);
		assertEquals(text, token.getText());
		//get the next token and check its kind, position, and contents
		Scanner.Token token1 = scanner.nextToken();
		assertEquals(IDENT, token1.kind);
		//assertEquals(1, token1.pos);
		text = "i1";
		assertEquals(text.length(), token1.length);
		assertEquals(text, token1.getText());
		
		Scanner.Token token2 = scanner.nextToken();
		assertEquals(ASSIGN, token2.kind);
		//assertEquals(2, token2.pos);
		text = ASSIGN.getText();
		assertEquals(text.length(), token2.length);
		assertEquals(text, token2.getText());
		
		Scanner.Token token3 = scanner.nextToken();
		assertEquals(INT_LIT, token3.kind);
		//assertEquals(3, token3.pos);
		text = "233";
		assertEquals(text.length(), token3.length);
		assertEquals(text, token3.getText());
		assertEquals(233, token3.intVal());
		
		Scanner.Token token4 = scanner.nextToken();
		assertEquals(SEMI, token4.kind);
		//assertEquals(4, token4.pos);
		text = SEMI.getText();
		assertEquals(text.length(), token4.length);
		assertEquals(text, token4.getText());
		
		Scanner.Token token5 = scanner.nextToken();
		assertEquals(KW_MOVE, token5.kind);
		//assertEquals(5, token5.pos);
		text = KW_MOVE.getText();
		assertEquals(text.length(), token5.length);
		assertEquals(text, token5.getText());
		assertEquals(token5.getLinePos().line, 1);
		assertEquals(token5.getLinePos().posInLine, 1);
		
		Scanner.Token token6 = scanner.nextToken();
		assertEquals(IDENT, token6.kind);
		//assertEquals(6, token6.pos);
		text = "i1";
		assertEquals(text.length(), token6.length);
		assertEquals(text, token6.getText());
		
		Scanner.Token token7 = scanner.nextToken();
		assertEquals(ARROW, token7.kind);
		//assertEquals(7, token7.pos);
		text = ARROW.getText();
		assertEquals(text.length(), token7.length);
		assertEquals(text, token7.getText());
		
		Scanner.Token token8 = scanner.nextToken();
		assertEquals(KW_XLOC, token8.kind);
		//assertEquals(8, token8.pos);
		text = KW_XLOC.getText();
		assertEquals(text.length(), token8.length);
		assertEquals(text, token8.getText());
		
		Scanner.Token token9 = scanner.nextToken();
		assertEquals(INT_LIT, token9.kind);
		//assertEquals(9, token9.pos);
		text = "3333";
		assertEquals(text.length(), token9.length);
		assertEquals(text, token9.getText());
		assertEquals(3333, token9.intVal());
		
		Scanner.Token token10 = scanner.nextToken();
		assertEquals(SEMI, token10.kind);
		//assertEquals(10, token10.pos);
		text = SEMI.getText();
		assertEquals(text.length(), token10.length);
		assertEquals(text, token10.getText());
		
		//check that the scanner has inserted an EOF token at the end
		Scanner.Token token11 = scanner.nextToken();
		assertEquals(Scanner.Kind.EOF,token11.kind);
	}
	
	@Test
    public void testGeneral() throws IllegalCharException, IllegalNumberException{
        String input = "i <- 0;\nwhile(i < 10){\n\nif(%";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(IDENT, token.kind);
        assertEquals(0, token.pos);
        String text = "i";
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        assertEquals(0, token.getLinePos().line);
        assertEquals(0, token.getLinePos().posInLine);
        
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(ASSIGN, token1.kind);
        assertEquals(2, token1.pos);
        String text1 = ASSIGN.getText();
        assertEquals(text1.length(), token1.length);
        assertEquals(text1, token1.getText());
        assertEquals(0, token1.getLinePos().line);
        assertEquals(2, token1.getLinePos().posInLine);
        
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(INT_LIT, token2.kind);
        assertEquals(5, token2.pos);
        String text2 = "0";
        assertEquals(text2.length(), token2.length);
        assertEquals(text2, token2.getText());
        assertEquals(0, token2.getLinePos().line);
        assertEquals(5, token2.getLinePos().posInLine);
        
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(SEMI, token3.kind);
        assertEquals(6, token3.pos);
        String text3 = SEMI.getText();
        assertEquals(text3.length(), token3.length);
        assertEquals(text3, token3.getText());
        assertEquals(0, token3.getLinePos().line);
        assertEquals(6, token3.getLinePos().posInLine);
        
        Scanner.Token token4 = scanner.nextToken();
        assertEquals(KW_WHILE, token4.kind);
        assertEquals(8, token4.pos);
        String text4 = KW_WHILE.getText();
        assertEquals(text4.length(), token4.length);
        assertEquals(text4, token4.getText());
        assertEquals(1, token4.getLinePos().line);
        assertEquals(0, token4.getLinePos().posInLine);
        
        Scanner.Token token5 = scanner.nextToken();
        assertEquals(LPAREN, token5.kind);
        assertEquals(13, token5.pos);
        String text5 = LPAREN.getText();
        assertEquals(text5.length(), token5.length);
        assertEquals(text5, token5.getText());
        assertEquals(1, token5.getLinePos().line);
        assertEquals(5, token5.getLinePos().posInLine);
        
        Scanner.Token token6 = scanner.nextToken();
        assertEquals(IDENT, token6.kind);
        assertEquals(14, token6.pos);
        String text6 = "i";
        assertEquals(text6.length(), token6.length);
        assertEquals(text6, token6.getText());
        assertEquals(1, token6.getLinePos().line);
        assertEquals(6, token6.getLinePos().posInLine);
        
        Scanner.Token token7 = scanner.nextToken();
        assertEquals(LT, token7.kind);
        assertEquals(16, token7.pos);
        String text7 = LT.getText();
        assertEquals(text7.length(), token7.length);
        assertEquals(text7, token7.getText());
        assertEquals(1, token7.getLinePos().line);
        assertEquals(8, token7.getLinePos().posInLine);
        
        Scanner.Token token8 = scanner.nextToken();
        assertEquals(INT_LIT, token8.kind);
        assertEquals(18, token8.pos);
        String text8 = "10";
        assertEquals(text8.length(), token8.length);
        assertEquals(text8, token8.getText());
        assertEquals(1, token8.getLinePos().line);
        assertEquals(10, token8.getLinePos().posInLine);
        
        Scanner.Token token9 = scanner.nextToken();
        assertEquals(RPAREN, token9.kind);
        assertEquals(20, token9.pos);
        String text9 = RPAREN.getText();
        assertEquals(text9.length(), token9.length);
        assertEquals(text9, token9.getText());
        assertEquals(1, token9.getLinePos().line);
        assertEquals(12, token9.getLinePos().posInLine);
        
        Scanner.Token token10 = scanner.nextToken();
        assertEquals(LBRACE, token10.kind);
        assertEquals(21, token10.pos);
        String text10 = LBRACE.getText();
        assertEquals(text10.length(), token10.length);
        assertEquals(text10, token10.getText());
        assertEquals(1, token10.getLinePos().line);
        assertEquals(13, token10.getLinePos().posInLine);
        
        
        Scanner.Token token11 = scanner.nextToken();
        assertEquals(KW_IF, token11.kind);
        assertEquals(24, token11.pos);
        String text11 = KW_IF.getText();
        assertEquals(text11.length(), token11.length);
        assertEquals(text11, token11.getText());
        assertEquals(3, token11.getLinePos().line);
        assertEquals(0, token11.getLinePos().posInLine);
        
        Scanner.Token token12 = scanner.nextToken();
        assertEquals(LPAREN, token12.kind);
        assertEquals(26, token12.pos);
        String text12 = LPAREN.getText();
        assertEquals(text12.length(), token12.length);
        assertEquals(text12, token12.getText());
        assertEquals(3, token12.getLinePos().line);
        assertEquals(2, token12.getLinePos().posInLine);
        
        Scanner.Token token13 = scanner.nextToken();
        assertEquals(MOD, token13.kind);
        assertEquals(27, token13.pos);
        String text13 = MOD.getText();
        assertEquals(text13.length(), token13.length);
        assertEquals(text13, token13.getText());
        assertEquals(3, token13.getLinePos().line);
        assertEquals(3, token13.getLinePos().posInLine);
        
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token tokeneof = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,tokeneof.kind);
        //assertEquals(3, scanner.getLinePos(token13).line);
        //assertEquals(3, scanner.getLinePos(token13).posInLine);
    }
	
	public void testGetLinePos() throws IllegalCharException, IllegalNumberException{
        String input = "this is a string literal\non two lines/*\n*/c";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(IDENT, token.kind);
        assertEquals(0, token.pos);
        String text = "this";
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        assertEquals(0, token.getLinePos().line);
        assertEquals(0, token.getLinePos().posInLine);
        
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(IDENT, token1.kind);
        assertEquals(5, token1.pos);
        String text1 = "is";
        assertEquals(text1.length(), token1.length);
        assertEquals(text1, token1.getText());
        assertEquals(0, token1.getLinePos().line);
        assertEquals(5, token1.getLinePos().posInLine);
        
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(IDENT, token2.kind);
        assertEquals(8, token2.pos);
        String text2 = "a";
        assertEquals(text2.length(), token2.length);
        assertEquals(text2, token2.getText());
        assertEquals(0, token2.getLinePos().line);
        assertEquals(8, token2.getLinePos().posInLine);
        
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(IDENT, token3.kind);
        assertEquals(10, token3.pos);
        String text3 = "string";
        assertEquals(text3.length(), token3.length);
        assertEquals(text3, token3.getText());
        assertEquals(0, token3.getLinePos().line);
        assertEquals(10, token3.getLinePos().posInLine);
        
        Scanner.Token token4 = scanner.nextToken();
        assertEquals(IDENT, token4.kind);
        assertEquals(17, token4.pos);
        String text4 = "literal";
        assertEquals(text4.length(), token4.length);
        assertEquals(text4, token4.getText());
        assertEquals(0, token4.getLinePos().line);
        assertEquals(17, token4.getLinePos().posInLine);
        
        Scanner.Token token5 = scanner.nextToken();
        assertEquals(IDENT, token5.kind);
        assertEquals(25, token5.pos);
        String text5 = "on";
        assertEquals(text5.length(), token5.length);
        assertEquals(text5, token5.getText());
        assertEquals(1, token5.getLinePos().line);
        assertEquals(0, token5.getLinePos().posInLine);
        
        Scanner.Token token6 = scanner.nextToken();
        assertEquals(IDENT, token6.kind);
        assertEquals(28, token6.pos);
        String text6 = "two";
        assertEquals(text6.length(), token6.length);
        assertEquals(text6, token6.getText());
        assertEquals(1, token6.getLinePos().line);
        assertEquals(3, token6.getLinePos().posInLine);
        
        Scanner.Token token7 = scanner.nextToken();
        assertEquals(IDENT, token7.kind);
        assertEquals(32, token7.pos);
        String text7 = "lines";
        assertEquals(text7.length(), token7.length);
        assertEquals(text7, token7.getText());
        assertEquals(1, token7.getLinePos().line);
        assertEquals(7, token7.getLinePos().posInLine);
        
        Scanner.Token token8 = scanner.nextToken();
        assertEquals(IDENT, token8.kind);
        assertEquals(42, token8.pos);
        String text8 = "c";
        assertEquals(text8.length(), token8.length);
        assertEquals(text8, token8.getText());
        assertEquals(2, token8.getLinePos().line);
        assertEquals(2, token8.getLinePos().posInLine);
        
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token tokeneof = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,tokeneof.kind);    
    }
	
	//@Test
    public void testIDENT() throws IllegalCharException, IllegalNumberException{
        String input = "integerintegerin integer";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(IDENT, token.kind);
        assertEquals(0, token.pos);
        String text = "integerintegerin";
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_INTEGER, token1.kind);
        assertEquals(17, token1.pos);
        String text1 = KW_INTEGER.getText();
        assertEquals(text1.length(), token1.length);
        assertEquals(text1, token1.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token3.kind);    
    }
    
    //@Test
    public void testKW_INTEGER() throws IllegalCharException, IllegalNumberException{
        String input = "integer integer";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(KW_INTEGER, token.kind);
        assertEquals(0, token.pos);
        String text = KW_INTEGER.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_INTEGER, token1.kind);
        assertEquals(8, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token3.kind);    
    }
    
    //@Test
    public void testKW_BOOLEAN() throws IllegalCharException, IllegalNumberException{
        String input = "boolean boolean boolean           ";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(KW_BOOLEAN, token.kind);
        assertEquals(0, token.pos);
        String text = KW_BOOLEAN.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        //get the next token and check its kind, position, and contents
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_BOOLEAN, token1.kind);
        assertEquals(8, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(KW_BOOLEAN, token2.kind);
        assertEquals(16, token2.pos);
        assertEquals(text.length(), token2.length);
        assertEquals(text, token2.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token3.kind);    
    }
        
    //@Test
    public void testKW_IMAGE() throws IllegalCharException, IllegalNumberException{
        String input = " image  image image           ";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(KW_IMAGE, token.kind);
        assertEquals(1, token.pos);
        String text = KW_IMAGE.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        //get the next token and check its kind, position, and contents
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_IMAGE, token1.kind);
        assertEquals(8, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(KW_IMAGE, token2.kind);
        assertEquals(14, token2.pos);
        assertEquals(text.length(), token2.length);
        assertEquals(text, token2.getText());

        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token3.kind);    
    }
    
    //@Test
    public void testKW_URL() throws IllegalCharException, IllegalNumberException{
        String input = "url url url\r url";// 
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(KW_URL, token.kind);
        assertEquals(0, token.pos);
        String text = KW_URL.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        //get the next token and check its kind, position, and contents
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_URL, token1.kind);
        assertEquals(4, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(KW_URL, token2.kind);
        assertEquals(8, token2.pos);
        assertEquals(text.length(), token2.length);
        assertEquals(text, token2.getText());
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(KW_URL, token3.kind);
        assertEquals(13, token3.pos);
        assertEquals(text.length(), token3.length);
        assertEquals(text, token3.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token4 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token4.kind);    
    }
    
    //@Test
    public void testKW_FILE() throws IllegalCharException, IllegalNumberException{
        String input = "file file file\r file\n";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(KW_FILE, token.kind);
        assertEquals(0, token.pos);
        String text = KW_FILE.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        //get the next token and check its kind, position, and contents
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(KW_FILE, token1.kind);
        assertEquals(5, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(KW_FILE, token2.kind);
        assertEquals(10, token2.pos);
        assertEquals(text.length(), token2.length);
        assertEquals(text, token2.getText());
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(KW_FILE, token3.kind);
        assertEquals(16, token3.pos);
        assertEquals(text.length(), token3.length);
        assertEquals(text, token3.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token4 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token4.kind);    
    }
    
    //@Test
    public void testEqual() throws IllegalCharException, IllegalNumberException{
        String input = "======";
        //create and initialize the scanner
        Scanner scanner = new Scanner(input);
        scanner.scan();
        //get the first token and check its kind, position, and contents
        Scanner.Token token = scanner.nextToken();
        assertEquals(EQUAL, token.kind);
        assertEquals(0, token.pos);
        String text = EQUAL.getText();
        assertEquals(text.length(), token.length);
        assertEquals(text, token.getText());
        //get the next token and check its kind, position, and contents
        Scanner.Token token1 = scanner.nextToken();
        assertEquals(EQUAL, token1.kind);
        assertEquals(2, token1.pos);
        assertEquals(text.length(), token1.length);
        assertEquals(text, token1.getText());
        Scanner.Token token2 = scanner.nextToken();
        assertEquals(EQUAL, token2.kind);
        assertEquals(4, token2.pos);
        assertEquals(text.length(), token2.length);
        assertEquals(text, token2.getText());
        //check that the scanner has inserted an EOF token at the end
        Scanner.Token token3 = scanner.nextToken();
        assertEquals(Scanner.Kind.EOF,token3.kind);    
    }
	
    
    
    @Test
    public void test4() throws IllegalCharException, IllegalNumberException {
      //input string
      String input = "!=+()&asad\nnzz{/<=while|->;";
      //create and initialize the scanner
      Scanner scanner = new Scanner(input);
      scanner.scan();
      //get the first token and check its kind, position, and contents
      Scanner.Token token = scanner.nextToken();
      assertEquals(Kind.NOTEQUAL, token.kind);
      assertEquals(0, token.pos);
      String text = Kind.NOTEQUAL.getText();
      assertEquals(text.length(), token.length);
      assertEquals(text, token.getText());
      //get the next token and check its kind, position, and contents
      Scanner.Token token1 = scanner.nextToken();
      assertEquals(Kind.PLUS, token1.kind);
      assertEquals(2, token1.pos);
//      assertEquals(text.length(), token1.length);
//      assertEquals(text, token1.getText());
      Scanner.Token token2 = scanner.nextToken();
      assertEquals(Kind.LPAREN, token2.kind);
      assertEquals(3, token2.pos);
//      assertEquals(text.length(), token2.length);
//      assertEquals(text, token2.getText());
      Scanner.Token token3 = scanner.nextToken();
      assertEquals(Kind.RPAREN, token3.kind);
      assertEquals(4, token3.pos);
//      assertEquals(text.length(), token3.length);
//      assertEquals(text, token3.getText());
      Scanner.Token token4 = scanner.nextToken();
      assertEquals(Kind.AND, token4.kind);
      assertEquals(5, token4.pos);
//      assertEquals(text.length(), token4.length);
//      assertEquals(text, token4.getText());
      Scanner.Token token6 = scanner.nextToken();
      assertEquals(Kind.IDENT, token6.kind);
      assertEquals(6, token6.pos);
//      assertEquals(text.length(), token6.length);
//      assertEquals(text, token6.getText());
      Scanner.Token token7 = scanner.nextToken();
      assertEquals(Kind.IDENT, token7.kind);
      assertEquals(11, token7.pos);
//      assertEquals(text.length(), token7.length);
//      assertEquals(text, token7.getText());

      Scanner.Token token9 = scanner.nextToken();
      assertEquals(Kind.LBRACE, token9.kind);
      assertEquals(14, token9.pos);
//      assertEquals(text.length(), token9.length);
//      assertEquals(text, token9.getText());
      Scanner.Token token10 = scanner.nextToken();
      assertEquals(Kind.DIV, token10.kind);
      assertEquals(15, token10.pos);
//      assertEquals(text.length(), token10.length);
//      assertEquals(text, token10.getText());
      Scanner.Token token11 = scanner.nextToken();
      assertEquals(Kind.LE, token11.kind);
      assertEquals(16, token11.pos);
//      assertEquals(text.length(), token11.length);
//      assertEquals(text, token11.getText());
      Scanner.Token token12 = scanner.nextToken();
      assertEquals(Kind.KW_WHILE, token12.kind);
      assertEquals(18, token12.pos);
//      assertEquals(text.length(), token12.length);
//      assertEquals(text, token12.getText());
      Scanner.Token token13 = scanner.nextToken();
      assertEquals(Kind.BARARROW, token13.kind);
      assertEquals(23, token13.pos);
//      assertEquals(text.length(), token13.length);
//      assertEquals(text, token13.getText());
      Scanner.Token token14 = scanner.nextToken();
      assertEquals(Kind.SEMI, token14.kind);
      assertEquals(26, token14.pos);
//      assertEquals(text.length(), token14.length);
//      assertEquals(text, token14.getText());
      //check that the scanner has inserted an EOF token at the end
      Scanner.Token token15 = scanner.nextToken();
      assertEquals(Scanner.Kind.EOF,token15.kind);
     }
    
    @Test
    public void testEqualConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "====";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(EQUAL, token.kind);
    assertEquals(0, token.pos);
    String text = EQUAL.getText();
    assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(EQUAL, token1.kind);
    assertEquals(2, token1.pos);
    assertEquals(text.length(), token1.length);
    assertEquals(text, token1.getText());
    //check that the scanner has inserted an EOF token at the end
    Scanner.Token token3 = scanner.nextToken();
    assertEquals(Scanner.Kind.EOF,token3.kind);
    }
    @Test
    public void testSingleEqualConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "===";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    thrown.expect(IllegalCharException.class);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(EQUAL, token.kind);
    assertEquals(0, token.pos);
    String text = EQUAL.getText();
    assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    }

    @Test
    public void testIdentConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "abc D$_1 $12 ! {";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    //thrown.expect(IllegalCharException.class);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(IDENT, token.kind);
    assertEquals(0, token.pos);
    String text1 = NOT.getText();
    String text2 = LBRACE.getText();
    //assertEquals(text.length(), token.length);
    assertEquals("abc", token.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(IDENT, token1.kind);
    assertEquals(4, token1.pos);
    //assertEquals(text.length(), token1.length);
    assertEquals("D$_1", token1.getText());
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(IDENT, token2.kind);
    assertEquals(9, token2.pos);
    //assertEquals(text.length(), token2.length);
    assertEquals("$12", token2.getText());
    Scanner.Token token3 = scanner.nextToken();
    assertEquals(NOT, token3.kind);
    assertEquals(13, token3.pos);
    //assertEquals(text.length(), token3.length);
    assertEquals(text1, token3.getText());
    Scanner.Token token4 = scanner.nextToken();
    assertEquals(LBRACE, token4.kind);
    assertEquals(15, token4.pos);
    //assertEquals(text.length(), token4.length);
    assertEquals(text2, token4.getText());
    //check that the scanner has inserted an EOF token at the end
    Scanner.Token token5 = scanner.nextToken();
    assertEquals(Scanner.Kind.EOF,token5.kind);
    }
    @Test
    public void testEscapeStringConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "a\n Dfgh $12\txyz \r\nufo ishere";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    //thrown.expect(IllegalCharException.class);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(IDENT, token.kind);	
    assertEquals(0, token.pos);
    String text = "a";
    //assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(IDENT, token1.kind);
    assertEquals(3, token1.pos);
    //assertEquals(text.length(), token1.length);
    assertEquals("Dfgh", token1.getText());
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(IDENT, token2.kind);
    assertEquals(8, token2.pos);
    //assertEquals(text.length(), token2.length);
    assertEquals("$12", token2.getText());
    Scanner.Token token3 = scanner.nextToken();
    assertEquals(IDENT, token3.kind);
    assertEquals(12, token3.pos);
    //assertEquals(text.length(), token3.length);
    assertEquals("xyz", token3.getText());
    Scanner.Token token4 = scanner.nextToken();
    assertEquals(IDENT, token4.kind);
    assertEquals(18, token4.pos);
    //assertEquals(text.length(), token4.length);
    assertEquals("ufo", token4.getText());
    Scanner.Token token5 = scanner.nextToken();
    assertEquals(IDENT, token5.kind);
    assertEquals(22, token5.pos);
    //assertEquals(text.length(), token5.length);
    assertEquals("ishere", token5.getText());
    //check that the scanner has inserted an EOF token at the end
    Scanner.Token token6 = scanner.nextToken();
    assertEquals(Scanner.Kind.EOF,token6.kind);
    }


    @Test
    public void testKeyWordConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "intergerrrr integer widtH height";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(IDENT, token.kind);
    assertEquals(0, token.pos);
    assertEquals(11, token.length);
    assertEquals("intergerrrr", token.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(KW_INTEGER, token1.kind);
    assertEquals(12, token1.pos);
    String text1 = KW_INTEGER.getText();
    assertEquals(text1.length(), token1.length);
    assertEquals(text1, token1.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(IDENT, token2.kind);
    assertEquals(20, token2.pos);
    assertEquals(5, token2.length);
    assertEquals("widtH", token2.getText());
    //get the next token and check its kind, position, and contents
    Scanner.Token token3 = scanner.nextToken();
    assertEquals(OP_HEIGHT, token3.kind);
    assertEquals(26, token3.pos);
    String text3 = OP_HEIGHT.getText();
    assertEquals(text3.length(), token3.length);
    assertEquals(text3, token3.getText());
    //check that the scanner has inserted an EOF token at the end
    Scanner.Token token4 = scanner.nextToken();
    assertEquals(Scanner.Kind.EOF,token4.kind);
    }
    @Test
    public void testOther() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = " ~";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    thrown.expect(IllegalCharException.class);
    scanner.scan();
    }


    @Test
    public void testNotEqualConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "!= !+";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(NOTEQUAL, token.kind);
    assertEquals(0, token.pos);
    String text = NOTEQUAL.getText();
    assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(NOT, token1.kind);
    assertEquals(3, token1.pos);
    String text1 = NOT.getText();
    assertEquals(text1.length(), token1.length);
    assertEquals(text1, token1.getText());
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(PLUS, token2.kind);
    assertEquals(4, token2.pos);
    String text2 = PLUS.getText();
    assertEquals(text2.length(), token2.length);
    assertEquals(text2, token2.getText());
    }
    
    @Test
    public void testGeGtConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "> >= ";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(GT, token.kind);
    assertEquals(0, token.pos);
    String text = GT.getText();
    assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(GE, token1.kind);
    assertEquals(2, token1.pos);
    String text1 = GE.getText();
    assertEquals(text1.length(), token1.length);
    assertEquals(text1, token1.getText());
    }
    
    @Test
    public void testMinusArrowConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "->- >";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(ARROW, token.kind);
    assertEquals(0, token.pos);
    String text = ARROW.getText();
    assertEquals(text.length(), token.length);
    assertEquals(text, token.getText());
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(MINUS, token1.kind);
    assertEquals(2, token1.pos);
    String text1 = MINUS.getText();
    assertEquals(text1.length(), token1.length);
    assertEquals(text1, token1.getText());
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(GT, token2.kind);
    assertEquals(4, token2.pos);
    String text2 = GT.getText();
    assertEquals(text2.length(), token2.length);
    assertEquals(text2, token2.getText());
    }
    @Test
    public void testCommentConcat() throws IllegalCharException, IllegalNumberException {
    //input string
    String input = "a *//***456***///*11*/";
    //create and initialize the scanner
    Scanner scanner = new Scanner(input);
    scanner.scan();
    //get the first token and check its kind, position, and contents
    Scanner.Token token = scanner.nextToken();
    assertEquals(IDENT, token.kind);
    assertEquals(0, token.pos);
    //assertEquals(text.length(), token.length);
    assertEquals("a", token.getText());
    Scanner.Token token1 = scanner.nextToken();
    assertEquals(TIMES, token1.kind);
    assertEquals(2, token1.pos);
    String text1 = TIMES.getText();
    assertEquals(text1.length(), token1.length);
    assertEquals(text1, token1.getText());
    Scanner.Token token2 = scanner.nextToken();
    assertEquals(DIV, token2.kind);
    assertEquals(3, token2.pos);
    String text2 = DIV.getText();
    assertEquals(text2.length(), token2.length);
    assertEquals(text2, token2.getText());
    Scanner.Token token3 = scanner.nextToken();
    assertEquals(DIV, token3.kind);
    assertEquals(15, token3.pos);
    String text3 = DIV.getText();
    assertEquals(text3.length(), token3.length);
    assertEquals(text3, token3.getText());
    Scanner.Token token4 = scanner.nextToken();
    assertEquals(Scanner.Kind.EOF,token4.kind);
    String text4 = EOF.getText();
    //assertEquals(text4.length(), token4.length);
    assertEquals(text4, token4.getText());
    }
}