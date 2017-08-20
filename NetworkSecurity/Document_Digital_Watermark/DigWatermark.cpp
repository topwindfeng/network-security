#include <iostream>
#include <string>
#include <string.h>
#include <fstream>
#include <vector>
#include "IDentry.h"
#include "DictionaryEntry.h"
#include<stdio.h>
#include<stdlib.h>

using namespace std;

void helptxt();
void dectobin(int *, int);
void sdectobin(int *, int);
int bintodec(int *);
int sbintodec(int *);


int main(int argc, char * argv[]) {
	int op=0;
	int meth=0;
	int dID = 0;
	if (argc == 3)
	{
		if (strcmp(argv[1], "-emb") == 0)
		{
			op = 1;
		}
		else
		{
			if (strcmp(argv[1], "-det") == 0)
			{
				op = 2;
			}
			else
			{
				helptxt();
				//system("pause");
				return 0;
			}
		}
		if (strcmp(argv[2], "cod") == 0)
		{
			meth = 1;
		}
		else
		{
			if (strcmp(argv[2], "sem") == 0)
			{
				meth =2;
			}
			else
			{
				if (strcmp(argv[2], "hyb") == 0) 
				{
					meth = 3;
				}
				else
				{
					helptxt();
					//system("pause");
					return 0;
				}
				
			}
		}

	}
	else
	{
		helptxt();
		//system("pause");
		return 0;
	}
	vector<DictionaryEntry> dictionary;
	DictionaryEntry ndic;
	ndic.ID = 1;
	ndic.source = "mg";
	ndic.target = "Mg";
	dictionary.push_back(ndic);
	if (op == 1)
	{
		int binID[32] = { 0 };
		ifstream IDin("ID",ios::in);
		if (!IDin)
		{
			cout << "ID file doesn't exist." << endl << endl;
			//system("pause");
			return 0;
		}
		IDin >> dID;
		dectobin(binID, dID);
		cout << "Load ID file successfully!" << endl;
		IDin.close();
		ifstream Datain("Data", ios::in);
		if (!IDin)
		{
			cout << "Data file doesn't exist." << endl << endl;
			//system("pause");
			return 0;
		}
		cout << "Load Data file successfully!" << endl;
		fstream out;
		out.open("Data(Watermarked)", ios::out | ios::trunc);
		out.clear();
		if (meth == 1)
		{
			char nch;
			char ch1 = 0;
			char ch0 = ' ';
			int IDflag = 0;
			while (Datain.peek() != EOF)
			{
				nch = Datain.get();
				if (nch == ch0)
				{
					if (binID[IDflag] == 1)
					{
						out << ch1;
						//out << nch;
					}
					else
					{
						out << nch;
					}
					IDflag++;
					IDflag = IDflag % 32;
				}
				else
				{
 					out << nch;
				}
			}
			Datain.close();
			out.close();
			cout << "Embed watermark successfully!" << endl;


		}
		else
		{
			if (meth == 2)
			{
				char recline[100];
				char tline[256];
				int sID = 0;
				int bsID[4] = { 0 };
				int sflag = 0;
				bool exist = false;
				ifstream iIDrec;
				iIDrec.open("recID", ios::in);
				if (!iIDrec)
				{	
					sID = 0;
				}
				else
				{
					while (iIDrec.peek()!=EOF)
					{
						iIDrec.getline(recline, 100);
						if (dID==atoi(recline))
						{
							exist = true;
							break;
						}
						sID++;
					}
					iIDrec.close();
				}				
				sdectobin(bsID, sID);
				while (Datain.peek() != EOF)
				{
					Datain.getline(tline, 256);
					string nstr(tline);
					string::size_type pos = nstr.find(dictionary.at(0).source, 0);
					if (pos != string::npos)
					{
						if (bsID[sflag]==1)
						{
							nstr.replace(pos, strlen(dictionary.at(0).source), dictionary.at(0).target);
						}
						sflag++;
						if (sflag == 4)
						{
							sflag = 0;
						}
						
					}
					out << nstr<<endl;
				}
				if (exist != true)
				{
					fstream oIDrec;
					oIDrec.open("recID", ios::out | ios::app);
					if (oIDrec)
					{
						oIDrec << dID << endl;
					}
					oIDrec.close();

				}

				Datain.close();
				out.close();
				cout << "Embed watermark successfully!" << endl;


			}
		}
		//system("pause");

	}
	else
	{
		if (op == 2)
		{
			ifstream Datain("Data(Watermarked)", ios::in);
			cout << "Load watermarked data file successfully!" << endl;
			if (meth == 1)
			{
				vector<IDentry> IDArray;
				int bintemp[32] = { 0 };
				int bflag = 0;
				char nch;
				while (Datain.peek() != EOF)
				{
					nch = Datain.get();
					if (nch == 0)
					{
						bintemp[bflag] = 1;
						bflag++;
					}
					else
					{
						if (nch == ' ')
						{
							bintemp[bflag] = 0;
							bflag++;
						}
					}

					if (bflag == 32)
					{
						bflag = 0;
						int result = bintodec(bintemp);
						bool IDexist = false;
						int nID = 0;
						for (int i = 0; i < IDArray.size(); i++)
						{
							if (IDArray.at(i).ID == result)
							{
								IDexist = true;
								nID = i;
								break;
							}
						}
						if (IDexist == true)
						{
							IDArray.at(nID).count++;
						}
						else
						{
							IDentry nidentry;
							nidentry.ID = result;
							nidentry.count = 1;
							IDArray.push_back(nidentry);
						}
						for (int i = 0; i < 32; i++)
						{
							bintemp[i] = 0;
						}
					}
				}
				int maxcount = 0;
				int mid = 0;
				for (int i = 0; i < IDArray.size(); i++)
				{
					if (IDArray.at(i).count >maxcount)
					{
						maxcount = IDArray.at(i).count;
						mid = i;
					}
				}
				cout << "The doctor's ID is " << IDArray.at(mid).ID << endl;
				//system("pause");
				
			}
			if (meth == 2)
			{
				ifstream oDatain("Data", ios::in);
				vector<IDentry> IDArray;
				int bintemp[4] = {0};
				int bflag = 0;
				char nch[256];
				char och[256];
				if (!oDatain)
				{
					cout << "origin data no exist!" << endl;
				}
				while (oDatain.peek() != EOF)
				{
					oDatain.getline(och,256);
					Datain.getline(nch, 256);
					string ostr(och);
					string nstr(nch);
					string::size_type pos;
					pos = ostr.find(dictionary.at(0).source, 0);
					if (pos != string::npos)
					{
						string::size_type tpos = nstr.find(dictionary.at(0).target, 0);
						if (pos == tpos)
						{
							bintemp[bflag] = 1;
						}
						else
						{
							bintemp[bflag] = 0;
						}
						bflag++;
					}

					if (bflag == 4)
					{
						bflag = 0;
						int result = sbintodec(bintemp);
						bool IDexist = false;
						int nID = 0;
						for (int i = 0; i < IDArray.size(); i++)
						{
							if (IDArray.at(i).ID == result)
							{
								IDexist = true;
								nID = i;
								break;
							}
						}
						if (IDexist == true)
						{
							IDArray.at(nID).count++;
						}
						else
						{
							IDentry nidentry;
							nidentry.ID = result;
							nidentry.count = 1;
							IDArray.push_back(nidentry);
						}
						for (int i = 0; i < 4; i++)
						{
							bintemp[i] = 0;
						}
					}
				}
				int maxcount = 0;
				int mid = 0;
				for (int i = 0; i < IDArray.size(); i++)
				{
					if (IDArray.at(i).count > maxcount)
					{
						maxcount = IDArray.at(i).count;
						mid = i;
					}
				}
				char recline[100];
				int rcount = 0;
				int tID = 0;
				ifstream iIDrec;
				iIDrec.open("recID", ios::in);
				if (!iIDrec)
				{
					cout << "the file is not sent to any doctor yet!" << endl;
				}
				else
				{
					while (iIDrec.peek() != EOF)
					{
						iIDrec.getline(recline, 100);
						if (rcount == IDArray.at(mid).ID)
						{
							tID = atoi(recline);
							break;
						}
						rcount++;
					}
					iIDrec.close();
				}
				cout << "The doctor's ID is " << tID << endl;
				oDatain.close();
				//system("pause");
			}

			Datain.close();
		}
		else
		{
			helptxt();
			return 0;
		}
	}
}

void helptxt() {

	cout << "	./DigWatermark Operation Method" << endl << endl;
	cout << "	Operation - Either \"-emb\" or \"-det\" to specify embedding watermark or detecting watermark." << endl << endl;
	cout << "	Method - Either \"cod\" or \"sem\" to specify the method of watermark" << endl << endl;

}

void dectobin(int * result, int source) 
{
	for (int i = 0; i < 32; i++)
	{
		if (source % 2 == 1)
		{
			result[i] = 1;
		}
		else
		{
			result[i] = 0;
		}
		source = source / 2;
	}
}

void sdectobin(int * result, int source)
{
	for (int i = 0; i < 4; i++)
	{
		if (source % 2 == 1)
		{
			result[i] = 1;
		}
		else
		{
			result[i] = 0;
		}
		source = source / 2;
	}
}

int bintodec(int * source)
{
	int result = 0;
	for (int i = 31; i >= 0; i--)
	{
		result = result * 2;
		if (source[i] == 1)
		{
			result++;
		}
	}
	return result;
}

int sbintodec(int * source)
{
	int result = 0;
	for (int i = 3; i >= 0; i--)
	{
		result = result * 2;
		if (source[i] == 1)
		{
			result++;
		}
	}
	return result;
}
