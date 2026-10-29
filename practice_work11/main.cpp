#include <iostream>
#include <x86intrin.h>

using namespace std;

int main() {
    int A, B, C;
    int roots = 0;

    cout << "Введите коэффициенты A, B, C: ";
    if (!(cin >> A >> B >> C)) return 1;
    unsigned long long start = __rdtsc(); 

    asm (
        "imull %[b], %[b]\n\t"  // B = B * B
        "imull $4, %[a]\n\t"   // A = A * 4
        "imull %[c], %[a]\n\t"  // A = A * C
        "subl %[a], %[b]"       // B = B - A (результат D теперь в B)
        : [b] "+r" (B), [a] "+r" (A) 
        : [c] "r" (C)
    );
    
    int D = B; // Переносим посчитанный дискриминант в D

    if (D > 0) {
        roots = 2;
    } else if (D == 0) {
        roots = 1;
    } else {
        roots = 0;
    }

    // ЗАМЕР ВРЕМЕНИ КОНЕЦ
    unsigned long long end = __rdtsc(); 

    cout << "Количество действительных корней (ASM): " << roots << endl;
    cout << "Тактов процессора: " << (end - start) << endl;

    return 0;
}
