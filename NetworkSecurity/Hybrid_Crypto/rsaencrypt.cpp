#include <cryptopp/randpool.h>   
#include <cryptopp/rsa.h>   
#include <cryptopp/hex.h>  
#include <cryptopp/files.h>   
#include <iostream>   
#include <fstream>
  
using namespace std;   
using namespace CryptoPP;   
  
#pragma comment(lib, "cryptlib.lib")   
  
  
string RSAEncryptString(const char *pubFilename, const char *seed, const char *message);    
RandomPool & GlobalRNG();   
   
int main()   
{    
	
	string state;
	ifstream statefile;
	statefile.open("state.txt");
	statefile>>state;
	statefile.close();
	if (state=="1")
	{
    char pubKey[128] = {0};   
    char seed[1024] = {0};   
   
   
    strcpy(pubKey, "rsa/pub1");
    strcpy(seed, "rsa/seed1");     
  
    char message[1024] = {0}; 
    ifstream infile;
    infile.open("aes/aeskey_data.txt");
    int count=0;
    while(infile)
	{
		infile>>message[count];
		count++;
	}
	infile.close();
      
    string encryptedText = RSAEncryptString(pubKey, seed, message); 
    cout<<"Encrypted Text:\t"<<encryptedText<<endl<<endl;  
    
    ofstream outfile;
    outfile.open("rsa/rsakey_data1.txt"); 
    outfile<<encryptedText;
	outfile.close(); 
	
	
	
	infile.open("aes/aeskey_id.txt");
    count=0;
    while(infile)
	{
		infile>>message[count];
		count++;
	}
	infile.close();
      
    encryptedText = RSAEncryptString(pubKey, seed, message); 
    cout<<"Encrypted Text:\t"<<encryptedText<<endl<<endl;  
    outfile.open("rsa/rsakey_id1.txt"); 
    outfile<<encryptedText;
	outfile.close(); 
	
	
    infile.open("aes/aesiv_id.txt");
    count=0;
    while(infile)
	{
		infile>>message[count];
		count++;
	}
	infile.close();
      
    encryptedText = RSAEncryptString(pubKey, seed, message); 
    cout<<"Encrypted Text:\t"<<encryptedText<<endl<<endl;  
    outfile.open("rsa/rsaiv_id1.txt"); 
    outfile<<encryptedText;
	outfile.close(); 
	
	
    infile.open("aes/aesiv_data.txt");
    count=0;
    while(infile)
	{
		infile>>message[count];
		count++;
	}
	infile.close();
      
    encryptedText = RSAEncryptString(pubKey, seed, message); 
    cout<<"Encrypted Text:\t"<<encryptedText<<endl<<endl;  
    outfile.open("rsa/rsaiv_data1.txt"); 
    outfile<<encryptedText;
	outfile.close(); 
    }
	else if (state=="2")
	{
	
	
	
	
	char pubKey2[128] = {0};   
    char seed2[1024] = {0};   
   
   
    strcpy(pubKey2, "rsa/pub2");
    strcpy(seed2, "rsa/seed2");     
  
    char message2[1024] = {0}; 
    ifstream infile2;
    infile2.open("aes/aeskey_data.txt");
    count=0;
    while(infile2)
	{
		infile2>>message2[count];
		count++;
	}
	infile2.close();
      
    string encryptedText2 = RSAEncryptString(pubKey2, seed2, message2); 
    cout<<"Encrypted Text:\t"<<encryptedText2<<endl<<endl;  
    
    ofstream outfile2;
    outfile2.open("rsa/rsakey_data2.txt"); 
    outfile2<<encryptedText2;
	outfile2.close();  
	 
  
    message2[1024] = {0}; 
    infile2.open("aes/aesiv_data.txt");
    count=0;
    while(infile2)
	{
		infile2>>message2[count];
		count++;
	}
	infile2.close();
      
    encryptedText2 = RSAEncryptString(pubKey2, seed2, message2); 
    cout<<"Encrypted Text:\t"<<encryptedText2<<endl<<endl;  
    
    outfile2.open("rsa/rsaiv_data2.txt"); 
    outfile2<<encryptedText2;
	outfile2.close(); 
    }
	
    return 0;  
    
    
}   


string RSAEncryptString(const char *pubFilename, const char *seed, const char *message)  
{  
       FileSource pubFile(pubFilename, true, new HexDecoder);  
       RSAES_OAEP_SHA_Encryptor pub(pubFile);  
  
       RandomPool randPool;  
       randPool.Put((byte *)seed, strlen(seed));  
  
       string result;  
       StringSource(message, true, new PK_EncryptorFilter(randPool, pub, new HexEncoder(new StringSink(result))));  
       return result;  
}  


RandomPool & GlobalRNG()  
{  
       static RandomPool randomPool;  
       return randomPool;  
}  
