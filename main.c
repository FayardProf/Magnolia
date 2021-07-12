#include "stdio.h"
#include "math.h"

#include "Magnolia.h"

int main() {
    String* s = newCharsS("Hello, my name in Francois Fayard.");
    ArrayS* a = newAs();
    appendCopyAs(a, s);
    appendCopyAs(a, s);
    appendCopyAs(a, s);
    deleteS(s);
    deleteAs(a);

    return 0;
}