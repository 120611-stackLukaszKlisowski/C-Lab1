#include <stdio.h>

int main(void) {
    char char_a = 20;
    char char_b = 6;
    short short_a = 20;
    short short_b = 6;
    int int_a = 20;
    int int_b = 6;
    long long_a = 20;
    long long_b = 6;
    long long llong_a = 20;
    long long llong_b = 6;
    float float_a = 20;
    float float_b = 6;
    double double_a = 20;
    double double_b = 6;
    unsigned char uchar_a = 20;
    unsigned char uchar_b = 6;
    
    printf("char add: %d\n", char_a + char_b);
    printf("char sub: %d\n", char_a - char_b);
    printf("char mul: %d\n", char_a * char_b);
    printf("char div: %d\n", char_a / char_b);
    printf("char mod: %d\n", char_a % char_b);

    printf("short add: %d\n", short_a + short_b);
    printf("short sub: %d\n", short_a - short_b);
    printf("short mul: %d\n", short_a * short_b);
    printf("short div: %d\n", short_a / short_b);
    printf("short mod: %d\n", short_a % short_b);

    printf("int add: %d\n", int_a + int_b);
    printf("int sub: %d\n", int_a - int_b);
    printf("int mul: %d\n", int_a * int_b);
    printf("int div: %d\n", int_a / int_b);
    printf("int mod: %d\n", int_a % int_b);

    printf("long add: %ld\n", long_a + long_b);
    printf("long sub: %ld\n", long_a - long_b);
    printf("long mul: %ld\n", long_a * long_b);
    printf("long div: %ld\n", long_a / long_b);
    printf("long mod: %ld\n", long_a % long_b);

    printf("long long add: %lld\n", llong_a + llong_b);
    printf("long long sub: %lld\n", llong_a - llong_b);
    printf("long long mul: %lld\n", llong_a * llong_b);
    printf("long long div: %lld\n", llong_a / llong_b);
    printf("long long mod: %lld\n", llong_a % llong_b);

    printf("float add:  %.6f\n", float_a + float_b);
    printf("float sub:  %.6f\n", float_a - float_b);
    printf("float mul:  %.6f\n", float_a * float_b);
    printf("float div:  %.6f\n", float_a / float_b);

    printf("double add: %.6f\n", double_a + double_b);
    printf("double sub: %.6f\n", double_a - double_b);
    printf("double mul: %.6f\n", double_a * double_b);
    printf("double div: %.6f\n", double_a / double_b);

    printf("unsigned char add: %u\n", uchar_a + uchar_b);
    printf("unsigned char sub: %u\n", uchar_a - uchar_b);
    printf("unsigned char mul: %u\n", uchar_a * uchar_b);
    printf("unsigned char div: %u\n", uchar_a / uchar_b);
    printf("unsigned char mod: %u\n", uchar_a % uchar_b);

    printf("%zu\n", sizeof(char));
    printf("%zu\n", sizeof(short));
    printf("%zu\n", sizeof(int));
    printf("%zu\n", sizeof(long));
    printf("%zu\n", sizeof(long long));
    printf("%zu\n", sizeof(float));
    printf("%zu\n", sizeof(double));
    printf("%zu\n", sizeof(unsigned char));

    return 0;
}
