#include <iostream>
#include <iomanip>
using namespace std;
#include "cryptopp/modes.h"
#include "cryptopp/aes.h"
#include "cryptopp/filters.h"
#include <fstream>


int main(int argc, char* argv[]) {
	string state;
	ifstream statefile;
	statefile.open("state.txt");
	statefile>>state;
	statefile.close();
	if (state=="1")
	{
	string ciphertext="";
	string decryptedtext="";
	string temptext;
	byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv[ CryptoPP::AES::BLOCKSIZE ];
	ifstream cipherfile;
	cipherfile.open("aes/aescipher_id.txt");
	while(cipherfile)
	{
		cipherfile>>temptext;
		ciphertext=ciphertext+temptext;
		temptext="";
	}
	cipherfile.close();
	
	ifstream keyfile;
	keyfile.open("physician1/key_id.txt");
	int i=0;
	while (keyfile)
	{
		keyfile>>key[i];
		i++;
	}
	keyfile.close();
	
    ifstream ivfile;
    ivfile.open("physician1/iv_id.txt");
    i=0;
	while (ivfile)
	{
		ivfile>>iv[i];
		i++;
	}
	ivfile.close();
	
	
	CryptoPP::AES::Decryption aesDecryption(key, CryptoPP::AES::DEFAULT_KEYLENGTH);
    CryptoPP::CBC_Mode_ExternalCipher::Decryption cbcDecryption( aesDecryption, iv );

    CryptoPP::StreamTransformationFilter stfDecryptor(cbcDecryption, new CryptoPP::StringSink( decryptedtext ) );
    stfDecryptor.Put( reinterpret_cast<const unsigned char*>( ciphertext.c_str() ), ciphertext.size() );
    stfDecryptor.MessageEnd();

    //
    // Dump Decrypted Text
    //
    cout << "Decrypted Text: " << endl;
    cout << decryptedtext;
    cout << endl << endl;
    ofstream outdata;
    outdata.open("physician1/patient_id.txt");
    for( int i = 0; i < decryptedtext.size()-1; i++ ) {
        outdata<<decryptedtext[i];
    }
    outdata.close();
    
    
    string ciphertext2="";
	string decryptedtext2="";
	string temptext2;
	byte key2[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv2[ CryptoPP::AES::BLOCKSIZE ];
	ifstream cipherfile2;
	cipherfile2.open("aes/aescipher_data.txt");
	while(cipherfile2)
	{
		cipherfile2>>temptext2;
		ciphertext2=ciphertext2+temptext2;
		temptext2="";
	}
	cipherfile2.close();
	
	ifstream keyfile2;
	keyfile2.open("physician1/key_data.txt");
	i=0;
	while (keyfile2)
	{
		keyfile2>>key2[i];
		i++;
	}
	keyfile2.close();
	
    ifstream ivfile2;
    ivfile2.open("physician1/iv_data.txt");
    i=0;
	while (ivfile2)
	{
		ivfile2>>iv2[i];
		i++;
	}
	ivfile2.close();
	
	
	CryptoPP::AES::Decryption aesDecryption2(key2, CryptoPP::AES::DEFAULT_KEYLENGTH);
    CryptoPP::CBC_Mode_ExternalCipher::Decryption cbcDecryption2( aesDecryption2, iv2 );

    CryptoPP::StreamTransformationFilter stfDecryptor2(cbcDecryption2, new CryptoPP::StringSink( decryptedtext2 ) );
    stfDecryptor2.Put( reinterpret_cast<const unsigned char*>( ciphertext2.c_str() ), ciphertext2.size() );
    stfDecryptor2.MessageEnd();

    //
    // Dump Decrypted Text
    //
    cout << "Decrypted Text: " << endl;
    cout << decryptedtext2;
    cout << endl << endl;
    outdata.open("physician1/patient_data.txt");
    for( int i = 0; i < decryptedtext2.size()-1; i++ ) {
        outdata<<decryptedtext2[i];
    }
    outdata.close();
    
    
    }
    else if (state=="2")
	{
	string ciphertext="";
	string decryptedtext="";
	string temptext;
	byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv[ CryptoPP::AES::BLOCKSIZE ];
	ifstream cipherfile;
	cipherfile.open("aes/aescipher_data.txt");
	while(cipherfile)
	{
		cipherfile>>temptext;
		ciphertext=ciphertext+temptext;
		temptext="";
	}
	cipherfile.close();
	
	ifstream keyfile;
	keyfile.open("physician2/key_data.txt");
	int i=0;
	while (keyfile)
	{
		keyfile>>key[i];
		i++;
	}
	keyfile.close();
	
    ifstream ivfile;
    ivfile.open("physician2/iv_data.txt");
    i=0;
	while (ivfile)
	{
		ivfile>>iv[i];
		i++;
	}
	ivfile.close();
	
	
	CryptoPP::AES::Decryption aesDecryption(key, CryptoPP::AES::DEFAULT_KEYLENGTH);
    CryptoPP::CBC_Mode_ExternalCipher::Decryption cbcDecryption( aesDecryption, iv );

    CryptoPP::StreamTransformationFilter stfDecryptor(cbcDecryption, new CryptoPP::StringSink( decryptedtext ) );
    stfDecryptor.Put( reinterpret_cast<const unsigned char*>( ciphertext.c_str() ), ciphertext.size() );
    stfDecryptor.MessageEnd();

    //
    // Dump Decrypted Text
    //
    cout << "Decrypted Text: " << endl;
    cout << decryptedtext;
    cout << endl << endl;
    ofstream outdata;
    outdata.open("physician2/patient_data.txt");
    for( int i = 0; i < decryptedtext.size()-1; i++ ) {
        outdata<<decryptedtext[i];
    }
    outdata.close();
    
    
    }
    
    
    return 0;
}
