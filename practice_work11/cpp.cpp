#include <iostream>
#include <x86intrin.h> //!!

using namespace std;

int main() {
    int A, B, C;
    int roots = 0;

    cout << "Введите коэффициенты A, B, C: ";
    if (!(cin >> A >> B >> C)) return 1;

    unsigned long long start = __rdtsc();  //начало

    int D = B * B - 4 * A * C;
    if (D > 0) {
        roots = 2;
    } else if (D == 0) {
        roots = 1;
    } else {
        roots = 0;
    }

    unsigned long long end = __rdtsc();    //конец

    cout << "Количество действительных корней (C++): " << roots << endl;
    cout << "Тактов процессора: " << (end - start) << endl;

    return 0;
}
