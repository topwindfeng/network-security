#include <cryptopp/randpool.h>   
#include <cryptopp/rsa.h>   
#include <cryptopp/hex.h>  
#include <cryptopp/files.h>   
#include <iostream>
#include <fstream>   
  
using namespace std;   
using namespace CryptoPP;   
  
#pragma comment(lib, "cryptlib.lib")   
  
string RSADecryptString(const char *privFilename, const char *ciphertext);   
RandomPool & GlobalRNG();   
  

int main()   
{ 
	string state;
	ifstream statefile;
	statefile.open("state.txt");
	statefile>>state;
	statefile.close();
	if (state==1)
	{  
    char priKey[128] = {0}; 
    string encryptedText="";
    string temptext="";
    strcpy(priKey, "rsa/pri1"); 
    ifstream infile;
    infile.open("rsa/rsaiv_data1.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    string decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    ofstream outfile;
    outfile.open("physician1/iv_data.txt");
    outfile<<decryptedText;
    outfile.close();
    
    
    encryptedText="";
    temptext="";
    strcpy(priKey, "rsa/pri1"); 
    infile.open("rsa/rsakey_data1.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    outfile.open("physician1/key_data.txt");
    outfile<<decryptedText;
    outfile.close();
    
    
    encryptedText="";
    temptext="";
    strcpy(priKey, "rsa/pri1"); 
    infile.open("rsa/rsaiv_id1.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    outfile.open("physician1/iv_id.txt");
    outfile<<decryptedText;
    outfile.close();
    
    
    encryptedText="";
    temptext="";
    strcpy(priKey, "rsa/pri1"); 
    infile.open("rsa/rsakey_id1.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    outfile.open("physician1/key_id.txt");
    outfile<<decryptedText;
    outfile.close();
    }
    else if (state==2)
    {
	char priKey[128] = {0}; 
    string encryptedText="";
    string temptext="";
    strcpy(priKey, "rsa/pri2"); 
    ifstream infile;
    infile.open("rsa/rsaiv_data2.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    string decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    ofstream outfile;
    outfile.open("physician2/iv_data.txt");
    outfile<<decryptedText;
    outfile.close();
    
    
    encryptedText="";
    temptext="";
    strcpy(priKey, "rsa/pri2"); 
    infile.open("rsa/rsakey_data2.txt");
    while (infile)
    {
		infile>>temptext;
		encryptedText=encryptedText+temptext; 
		temptext="";
	}
    infile.close();
    decryptedText = RSADecryptString(priKey, encryptedText.c_str()); 
    cout<<"Decrypted Text:\t"<<decryptedText<<endl<<endl;  
    
    outfile.open("physician2/key_data.txt");
    outfile<<decryptedText;
    outfile.close();
	}
    
    
        
    return 0;  
}   
  
 

   
string RSADecryptString(const char *privFilename, const char *ciphertext)  
{  
       FileSource privFile(privFilename, true, new HexDecoder);  
       RSAES_OAEP_SHA_Decryptor priv(privFile);  
  
       string result;  
       StringSource(ciphertext, true, new HexDecoder(new PK_DecryptorFilter(GlobalRNG(), priv, new StringSink(result))));  
       return result;  
  
}  
  
RandomPool & GlobalRNG()  
{  
       static RandomPool randomPool;  
       return randomPool;  
}  
