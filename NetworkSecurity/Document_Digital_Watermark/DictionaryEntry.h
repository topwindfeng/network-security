#pragma once
#include <string>
#include<string.h>

using namespace std;

class DictionaryEntry
{
public:
	int ID;
	char* source;
	char* target;
	DictionaryEntry();
	~DictionaryEntry();
};

