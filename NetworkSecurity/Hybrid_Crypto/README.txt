Hybrid Cryptography

After seeing the process of Hybrid Cryptography for our project in pdf, lets see how it is implemented during experiment.

1.Install library for crypto++, run the following commands:
sudo su
apt-get install libcrypto++-dev libcrypto++-doc libcrypto++-utils

2.Use command cd to the folder Hybrid_Crypto and do the following operations:

Firstly, we will see that inside the folders for physican1,physican2,aes,rsa are all empty.

Initialize:

Encrypt patient's information with RSA,Run
./aesencrypt
This will generate ciphertext and aeskey and aesiv both for the patient_id and patient_data. And we open the folder "aes" again and we can see the generated files.

For first class and second class physician, we generate them different public private key,Run
./rsagenkey
This will generate the public private key pair for physician in first class and physician in second class(here we say it is physician1 and physician2). And the genrated pair are pri1&pub1 and pri2&pub2. We open the folder "rsa" again and we can see the generated files.

Request:
When multiple AA gives us the information the state of physician(1 or 2, store in state.txt, and prof you can change it to 1 or 2 to see different results), we decide to gives all the patient informaion or limited information.
Run
./rsaencrypt
Based on the state, we can encrypt the aes key and iv using public key. And open the folder "rsa" again and we can see the encrypted files.

Then the the ciphertext for information and ciphertext for aes key and iv have been sent to the physician. Physician can firstly use his own private key to decrypt the ciphertext for aes key.
Run
./rsadecrypt
Open folder "physician1" or "physician2", we can see the decrypted iv and key of AES.

Run
./aesdecrypt
Open folder "physician1" or "physician2", we can see the information of patient being generated.




If prof you want to change the code, then need to make the cpp again by using the command g++ -g3 -ggdb -O0 -Wall -Wextra -Wno-unused -o outputname inputname.cpp -lcryptopp -lpthread