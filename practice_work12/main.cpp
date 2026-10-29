#include <iostream>
#include <iomanip>
#include <cmath>
#include <cstdint>

using namespace std;

// Макрос для C++: просто считает формулу
#define CALC_CPP(x, y) ( \
    ((5 * pow((x), 3 + (y)) - 2) / (10 - (x) * (y))) \
    / ((12 * (x) * (y)) / (3 * (x) + pow((y), 2 * (x)))) \
)

// Макрос для ASM: считает ту же формулу на регистрах процессора
#define CALC_ASM(x, y, res) do { \
    double _a = pow((x), 3 + (y)); \
    double _b = pow((y), 2 * (x)); \
    /* Объявляем константы явными переменными, чтобы компилятор легко скормил их ассемблеру через "m" */ \
    double _f5 = 5.0, _f2 = 2.0, _f10 = 10.0, _f12 = 12.0, _f3 = 3.0; \
    asm volatile( \
        "movsd %[five], %%xmm0\n\t"    /* xmm0 = 5.0 */ \
        "mulsd %[a], %%xmm0\n\t"       /* xmm0 = 5.0 * a */ \
        "subsd %[two], %%xmm0\n\t"     /* xmm0 = (5.0 * a) - 2.0 (числитель 1) */ \
        \
        "movsd %[x], %%xmm1\n\t"       /* xmm1 = x */ \
        "mulsd %[y], %%xmm1\n\t"       /* xmm1 = x * y */ \
        "movsd %[ten], %%xmm2\n\t"     /* xmm2 = 10.0 */ \
        "subsd %%xmm1, %%xmm2\n\t"     /* xmm2 = 10.0 - (x * y) (знаменатель 1) */ \
        "divsd %%xmm2, %%xmm0\n\t"     /* xmm0 = числитель 1 / знаменатель 1 (дробь 1) */ \
        \
        "mulsd %[twelve], %%xmm1\n\t"  /* xmm1 = (x * y) * 12.0 (числитель 2) */ \
        \
        "movsd %[three], %%xmm3\n\t"   /* xmm3 = 3.0 */ \
        "mulsd %[x], %%xmm3\n\t"       /* xmm3 = 3.0 * x */ \
        "addsd %[b], %%xmm3\n\t"       /* xmm3 = (3.0 * x) + b (знаменатель 2) */ \
        "divsd %%xmm3, %%xmm1\n\t"     /* xmm1 = числитель 2 / знаменатель 2 (дробь 2) */ \
        \
        "divsd %%xmm1, %%xmm0\n\t"     /* xmm0 = дробь 1 / дробь 2 (финал) */ \
        "movsd %%xmm0, %[r]\n\t"       /* Копируем результат в переменную res */ \
        : [r] "=m"(res) \
        : [x] "m"(x), [y] "m"(y), [a] "m"(_a), [b] "m"(_b), \
          [five] "m"(_f5), [two] "m"(_f2), [ten] "m"(_f10), \
          [twelve] "m"(_f12), [three] "m"(_f3) \
        : "xmm0", "xmm1", "xmm2", "xmm3", "memory" \
    ); \
} while(0)

// Функция берет текущий такт процессора
inline uint64_t ticks() {
    uint32_t lo, hi;
    /* volatile запрещает компилятору выбрасывать или перемещать этот кусок ассемблера */
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return (uint64_t(hi) << 32) | lo;
}

int main() {
    double x, y;
    cout << "Введите x и y: ";
    if (!(cin >> x >> y)) return 1;

    // Упрощенная проверка: защищаем программу от деления на 0
    if ((10 - x * y == 0) || (3 * x + pow(y, 2 * x) == 0) || (12 * x * y == 0)) {
        cout << "Ошибка: деление на ноль!\n";
        return 1;
    }

    double res_cpp = CALC_CPP(x, y);
    double res_asm; 
    CALC_ASM(x, y, res_asm);

    cout << fixed << setprecision(6);
    cout << "Результат C++: " << res_cpp << "\n";
    cout << "Результат ASM: " << res_asm << "\n\n";

    const int N = 1000000;
    
    /* volatile здесь гарантирует, что компилятор Честно выполнит цикл миллион раз. */
    volatile double sink;

    // Считаем время для C++
    uint64_t t1 = ticks();
    for (int i = 0; i < N; ++i) {
        sink = CALC_CPP(x, y);
    }
    uint64_t t2 = ticks();

    // Считаем время для ASM
    uint64_t t3 = ticks();
    for (int i = 0; i < N; ++i) {
        double r;
        CALC_ASM(x, y, r);
        sink = r;
    }
    uint64_t t4 = ticks();

    cout << "Тактов на один расчет:\n";
    cout << "C++: " << double(t2 - t1) / N << "\n";
    cout << "ASM: " << double(t4 - t3) / N << "\n";
}
