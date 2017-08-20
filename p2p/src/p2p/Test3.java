package p2p;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;

import p2p.Host;

public class Test3 {
	
	 public static void main(String[] args) throws IOException {
		 	Host Host = new Host();
	 		args = new String [1];
	 		args[0] = "1003";
			Host.main(args); 
	    }
}
