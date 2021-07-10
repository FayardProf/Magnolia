#include <stdio.h>
#include "magnolia.h"
#include "math.h"

void sin_of_array(struct ArrayD* v) {
    for (int i = 0; i < sizeArrayD(v); ++i) {
        v->at[i] = sin(v->at[i]);
    }
}

int main() {
    int n = 5;
    struct ArrayD* v = newArrayD();
    for (int i = 0; i < n; ++i) {
        appendArrayD(v, i * 1.0e-2);
    }
    sin_of_array(v);
    for (int i = 0; i < sizeArrayD(v); ++i) {
        printf("%f\n", v->at[i]);
    }
    deleteArrayD(v);

    struct ListD* l = newListD();
    for (int i = 0; i < n; ++i) {
        prependListD(l, i * 1.0e-2);
    }
    deleteListD(l);

    return 0;
}