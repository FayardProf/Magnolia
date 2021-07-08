#include <stdio.h>
#include "magnolia.h"
#include "math.h"

void f(struct array_d* v) {
    for (int i = 0; i < size_array_d(v); ++i) {
        v->at[i] = sin(v->at[i]);
    }
}

int main() {
    int n = 5;
    struct array_d* v = new_empty_array_d();
    for (int i = 0; i < n; ++i) {
        append_array_d(v, i * 1.0e-2);
    }
    f(v);
    struct array_d* w = copy_array_d(v);
    while (size_array_d(w) > 0) {
        printf("%f\n", pop_array_d(w));
    }
    delete_array_d(v);
    delete_array_d(w);

    struct slist_d* l = new_slist_d();
    for (int i = 0; i < n; ++i) {
        prepend_slist_d(l, i + 0.5);
    }
    delete_slist_d(l);

    return 0;
}