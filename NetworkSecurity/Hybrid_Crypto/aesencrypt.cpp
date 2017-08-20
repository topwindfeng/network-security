#include <iostream>
#include <iomanip>
using namespace std;
#include "cryptopp/modes.h"
#include "cryptopp/aes.h"
#include "cryptopp/filters.h"
#include <fstream>


int main(int argc, char* argv[]) {

    byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv[ CryptoPP::AES::BLOCKSIZE ];
	int key_size=sizeof(key);
	int iv_size=sizeof(iv);
	ofstream keyfile;
	keyfile.open("aes/aeskey_id.txt");
	for (int i=0;i<key_size;i++)
	{
		key[i]=(byte)(rand()%255);
		keyfile<<key[i]<<endl;
	}
	keyfile.close();
	ofstream ivfile;
	ivfile.open("aes/aesiv_id.txt");
	for (int i=0;i<iv_size;i++)
	{
		iv[i]=(byte)(rand()%255);
		ivfile<<iv[i]<<endl;
	}
	ivfile.close();
	
	
    //byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv[ CryptoPP::AES::BLOCKSIZE ];
    //memset( key, 0x00, CryptoPP::AES::DEFAULT_KEYLENGTH );
    //memset( iv, 0x00, CryptoPP::AES::BLOCKSIZE );
    
    //
    // String and Sink setup
    //
    ifstream infile;
    infile.open("patient_id");
    string plaintext="";
    string temp_plaintext;
    while (infile)
    {
        infile>>temp_plaintext;
        plaintext=plaintext+temp_plaintext;
        temp_plaintext="";
	}
    infile.close();
    string ciphertext;
    //  string decryptedtext;

    //
    // Dump Plain Text
    //
    cout << "Plain Text (" << plaintext.size() << " bytes)" << endl;
    cout << plaintext;
    cout << endl << endl;

    //
    // Create Cipher Text
    //
    CryptoPP::AES::Encryption aesEncryption(key, CryptoPP::AES::DEFAULT_KEYLENGTH);
    CryptoPP::CBC_Mode_ExternalCipher::Encryption cbcEncryption( aesEncryption, iv );

    CryptoPP::StreamTransformationFilter stfEncryptor(cbcEncryption, new CryptoPP::StringSink( ciphertext ) );
    stfEncryptor.Put( reinterpret_cast<const unsigned char*>( plaintext.c_str() ), plaintext.length() + 1 );
    stfEncryptor.MessageEnd();

    //
    // Dump Cipher Text
    //
    cout << "Cipher Text (" << ciphertext.size() << " bytes)" << endl;
    ofstream cipherfile;
    cipherfile.open("aes/aescipher_id.txt");
    for( int i = 0; i < ciphertext.size(); i++ ) {
        cipherfile<<ciphertext[i];
        cout << "0x" << hex << (0xFF & static_cast<byte>(ciphertext[i])) << " ";
    }

    cout << endl << endl;
    
    
    
    byte key2[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv2[ CryptoPP::AES::BLOCKSIZE ];
	int key2_size=sizeof(key2);
	int iv2_size=sizeof(iv2);
	ofstream keyfile2;
	keyfile2.open("aes/aeskey_data.txt");
	for (int i=0;i<key2_size;i++)
	{
		key2[i]=(byte)(rand()%255);
		keyfile2<<key2[i]<<endl;
	}
	keyfile2.close();
	ofstream ivfile2;
	ivfile2.open("aes/aesiv_data.txt");
	for (int i=0;i<iv2_size;i++)
	{
		iv2[i]=(byte)(rand()%255);
		ivfile2<<iv2[i]<<endl;
	}
	ivfile2.close();
	
	
    //byte key[ CryptoPP::AES::DEFAULT_KEYLENGTH ], iv[ CryptoPP::AES::BLOCKSIZE ];
    //memset( key, 0x00, CryptoPP::AES::DEFAULT_KEYLENGTH );
    //memset( iv, 0x00, CryptoPP::AES::BLOCKSIZE );
    
    //
    // String and Sink setup
    //
    ifstream infile2;
    infile2.open("patient_data");
    string plaintext2="";
    string temp_plaintext2;
    while (infile2)
    {
        infile2>>temp_plaintext2;
        plaintext2=plaintext2+"\n"+temp_plaintext2;
        temp_plaintext2="";
	}
    infile2.close();
    string ciphertext2;
    //  string decryptedtext;

    //
    // Dump Plain Text
    //
    cout << "Plain Text (" << plaintext2.size() << " bytes)" << endl;
    cout << plaintext2;
    cout << endl << endl;

    //
    // Create Cipher Text
    //
    CryptoPP::AES::Encryption aesEncryption2(key2, CryptoPP::AES::DEFAULT_KEYLENGTH);
    CryptoPP::CBC_Mode_ExternalCipher::Encryption cbcEncryption2( aesEncryption2, iv2 );

    CryptoPP::StreamTransformationFilter stfEncryptor2(cbcEncryption2, new CryptoPP::StringSink( ciphertext2 ) );
    stfEncryptor2.Put( reinterpret_cast<const unsigned char*>( plaintext2.c_str() ), plaintext2.length() + 1 );
    stfEncryptor2.MessageEnd();


    //
    // Dump Cipher Text
    //
    cout << "Cipher Text (" << ciphertext2.size() << " bytes)" << endl;
    ofstream cipherfile2;
    cipherfile2.open("aes/aescipher_data.txt");
    for( int i = 0; i < ciphertext2.size(); i++ ) {
        cipherfile2<<ciphertext2[i];
        cout << "0x" << hex << (0xFF & static_cast<byte>(ciphertext2[i])) << " ";
    }

    cout << endl << endl;
    
    
    
    
    

    return 0;
}
