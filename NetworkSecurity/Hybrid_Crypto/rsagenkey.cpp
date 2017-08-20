#include <cryptopp/randpool.h>   
#include <cryptopp/rsa.h>   
#include <cryptopp/hex.h>  
#include <cryptopp/files.h>   
#include <iostream>   
#include <fstream>

using namespace std;   
using namespace CryptoPP;   
  
#pragma comment(lib, "cryptlib.lib") 
void GenerateRSAKey(unsigned int keyLength, const char *privFilename, const char *pubFilename, const char *seed);   
RandomPool & GlobalRNG(); 

int main()   
{   
    char priKey[128] = {0};   
    char pubKey[128] = {0};   
    char seed[1024] = {0};
    
    char priKey2[128] = {0};   
    char pubKey2[128] = {0};   
    char seed2[1024] = {0};     
   
    strcpy(priKey, "rsa/pri1"); 
    strcpy(pubKey, "rsa/pub1");
    strcpy(seed, "rsa/seed1");   
    
    strcpy(priKey2, "rsa/pri2"); 
    strcpy(pubKey2, "rsa/pub2");
    strcpy(seed2, "rsa/seed2");  
    GenerateRSAKey(1024, priKey, pubKey, seed);   
    GenerateRSAKey(1024, priKey2, pubKey2, seed2); 
    return 0;
}

void GenerateRSAKey(unsigned int keyLength, const char *privFilename, const char *pubFilename, const char *seed)   
{   
       RandomPool randPool;   
       randPool.Put((byte *)seed, strlen(seed));   
  
       RSAES_OAEP_SHA_Decryptor priv(randPool, keyLength);   
       HexEncoder privFile(new FileSink(privFilename));   
       priv.DEREncode(privFile);   
       privFile.MessageEnd();   
  
       RSAES_OAEP_SHA_Encryptor pub(priv);   
       HexEncoder pubFile(new FileSink(pubFilename));   
       pub.DEREncode(pubFile);   
       pubFile.MessageEnd();   
}   


RandomPool & GlobalRNG()  
{  
       static RandomPool randomPool;  
       return randomPool;  
}  
