#include <stdio.h>
#include "magnolia.h"

int main() {
    int n = 5;
    struct vector_d v = new_vector_d(0);
    for (int i = 0; i < n; ++i) {
        append_vector_d(&v, i + 0.5);
    }
    struct vector_d w = copy_vector_d(&v);
    double x = pop_vector_d(&v);

    delete_vector_d(&v);

    return 0;
}