//
// Created by François Fayard on 10/07/2021.
//

#ifndef MAGNOLIA_MTREED_H
#define MAGNOLIA_MTREED_H

#include "stdlib.h"

struct NTree_s {
    double value;
    struct NListD_s* left;
    struct NListD_s* right;
};
typedef struct NTreeD_s NTreeD;

struct TreeD_s {
    NTreeD_s* _root;
};
typedef struct TreeD_s TreeD;



#endif //MAGNOLIA_MTREED_H
