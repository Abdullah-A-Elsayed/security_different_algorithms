#include <iostream>
#include <string>
using namespace std;
int main(){
    long long N,M,P;
    cin >> N >> P >> M;
    N%=M;
    
    string P_bin = "";
    long long t = P;
    while (t>0){
        P_bin = to_string(t%2)+P_bin;
        t = t >> 1;
    }

    long long R = 1;
    for (int i=0 ; i< P_bin.length(); i++){
        R = (R*R) % M;
        if (P_bin[i] == '1'){
            R = (R*N)%M;
        }
    }
    cout << R <<endl;
    return 0;
}
