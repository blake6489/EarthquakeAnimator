
#include <fstream>
#include <cstdlib>
#include <vector>
#include <string>
using std::string;
#include <iostream>
using std::cout;
using std::endl;
using namespace std;


class quake{
public:
//Year,Month,Day,Time(hhmmss.mm)UTC,Latitude,Longitude,Magnitude,Depth
quake(string s){
int p1=0;
int p2=s.find(",",p1);
int y=atoi(s.substr(0,p2).c_str());

p1=p2+1;
p2=s.find(",",p1);
int m=atoi(s.substr(p1,p2).c_str());

p1=p2+1;
p2=s.find(",",p1);
int d=atoi(s.substr(p1,p2).c_str());

p1=p2+1;
p2=s.find(",",p1);
int pd=(s.substr(p1,p2)).find(".",p1);
float t=0;
if(pd!=0){
cout<<((s.substr(pd+1,p2).c_str()))<<endl;
	t=atoi(s.substr(p1,pd).c_str())+(float)(atoi(s.substr(pd+1,p2).c_str()))/100.0;
}else{
	t=atoi(s.substr(p1,p2).c_str());
}

p1=p2+1;
p2=s.find(",",p1);
pd=(s.substr(p1,p2)).find(".",p1);
float lat=0;
if(pd!=0){
	lat=atoi(s.substr(p1,pd).c_str())+atoi(s.substr(pd,p2).c_str())/100;
}else{
	lat=atoi(s.substr(p1,p2).c_str());
}

p1=p2+1;
p2=s.find(",",p1);
pd=(s.substr(p1,p2)).find(".",p1);
float lng=0;
if(pd!=0){
	lng=atoi(s.substr(p1,pd).c_str())+atoi(s.substr(pd,p2).c_str())/100;
}else{
	lng=atoi(s.substr(p1,p2).c_str());
}

p1=p2+1;
p2=s.find("\n",p1);
pd=(s.substr(p1,p2)).find(".",p1);
float mag=0;
if(pd!=0){
	mag=atoi(s.substr(p1,pd).c_str())+atoi(s.substr(pd,p2).c_str())/10;
}else{
	mag=atoi(s.substr(p1,p2).c_str());
}

cout<<y<<","<<m<<","<<d<<","<<t<<","<<lat<<","<<lng<<","<<mag<<","<<depth<<endl;

}

int y;
int m;
int d;
int t;

int lat;
int lng;
int mag;
int depth;

};

//returns string of file
/*void fileRead(string file)
{
	int limit=10000000;
	int n=0;
	string line;
	
	ifstream myfile (file.c_str());
	if (myfile.is_open())
	{
		while (! myfile.eof() && n<limit)
		{
			getline (myfile,line);
			
			quake t(line);
			data.push_back(t);
			
			++n;
		}
		myfile.close();
	}

	else cout << "Unable to open file:"<< file; 
	
	//return out;
}*/

main(){

	string file="/home/blake/Desktop/Code/earthquake/earthquakedataT.csv";
		
	vector<quake> data;
	
	int limit=10000000;
	int n=0;
	string line;
	
	ifstream myfile (file.c_str());
	if (myfile.is_open())
	{
		while (! myfile.eof() && n<limit)
		{
			getline (myfile,line);
			
			quake t(line);
			data.push_back(t);
			
			++n;
		}
		myfile.close();
	}

	else cout << "Unable to open file:"<< file; 
	




}



