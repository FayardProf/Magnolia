#include "stdio.h"
#include "math.h"

#include "Magnolia.h"

void sin_of_array(ArrayD* v) {
    for (int i = 0; i < sizeArrayD(v); ++i) {
        v->at[i] = sin(v->at[i]);
    }
}

int main() {
    int n = 5;
    ArrayD* v = newArrayD();
    for (int i = 0; i < n; ++i) {
        appendArrayD(v, i * 1.0e-2);
    }
    sin_of_array(v);
    for (int i = 0; i < sizeArrayD(v); ++i) {
        printf("%f\n", v->at[i]);
    }
    deleteArrayD(v);

    printf("\n");

    ListD* l = newListD();
    for (int i = 0; i < n; ++i) {
        prependListD(l, i * 1.0e-2);
    }
    appendListD(l, 36);
    for (NListD* it = beginListD(l); it != endListD(l); it = it->next) {
        printf("%f\n", it->value);
    }
    deleteListD(l);

    String* s = newStringCString("Hello my name is Francois Fayard. This is a nice little library..");
    appendCharString(s, 'A');
    appendCStringString(s, "haha");
    insertCStringString(s, 0, "GNR");
    bool ans = startsWithCStringString(s, "GNR");
    bool ans2= endsWithCStringString(s, "Ahaha");
    printf("%s\n", asCStringString(s));
    deleteString(s);

    return 0;
}