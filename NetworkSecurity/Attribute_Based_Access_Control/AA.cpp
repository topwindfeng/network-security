#include <iostream>
#include<fstream>
#include<cstdlib>
#include<string>

using namespace std;

struct Doctor{
   char name[20];
   int DocID;
   char password[16];
   int age;
   char sex;
   int authority;
   char workplace[20];
};

int main()
{
     ifstream inFileID;
     ifstream inFilePassword;
     ifstream inFileWorkplace;
     ofstream outFileAuthority;
     ofstream outFileID;
     int ID;
     int equalflag=0;
     string password;
     string wp;
     Doctor doc[3]={
     {"Alice",85919234,"password",23,'F',1,"UF"},
     {"Bob",87818979,"Bob1018",28,'M',2,"PSU"},
     {"Chris",65492156,"Chrishandsome",35,'M',3,"UCLA"}
    };
     inFileID.open("RequestID");
     inFilePassword.open("RequestPassword");
     inFileWorkplace.open("RequestWorkplace");

     if (inFileID.fail()){
             cerr << "Error Opening ID File"<<endl;
             exit(1);
     }

     if (inFilePassword.fail()){
             cerr << "Error Opening Password File"<<endl;
             exit(1);
     }

     if (inFileWorkplace.fail()){
             cerr << "Error Opening Workplace File"<<endl;
             exit(1);
     }
     inFileID>>ID;
     inFilePassword>>password;
     inFileWorkplace>>wp;

      for(int i=0;i<3;i++){
        if(ID==doc[i].DocID && password==doc[i].password && wp==doc[i].workplace){
             outFileAuthority.open("Authority");
             outFileAuthority<<doc[i].authority<<endl;
             outFileID.open("ID");
             outFileID<<doc[i].DocID<<endl;
             equalflag=1;
          }
    }
     if(equalflag==0){
     cout<<"The doctor is not registered"<<endl;

     }
   outFileAuthority.close();
   inFileID.close();
   inFilePassword.close();
   inFileWorkplace.close();
    return 0;
}
