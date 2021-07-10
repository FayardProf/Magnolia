//
// Created by François Fayard on 08/07/2021.
//

#ifndef MAGNOLIA_LISTD_H
#define MAGNOLIA_LISTD_H

#include "stdlib.h"
#include "string.h"
#include "stdint.h"

struct NListD {
    double value;
    struct NListD* next;
};

struct ListD {
    struct NListD* _head;
};

struct ListD* newListD();
struct ListD* copyListD(struct ListD* other);

void prependListD(struct ListD* self, double x);

void deleteListD(struct ListD* self);

struct ListD* newListD() {
    struct ListD* ans = malloc(sizeof(struct ListD));
    ans->_head = NULL;
    return ans;
}

void prependListD(struct ListD* self, double x) {
    struct NListD* node = malloc(sizeof(struct NListD));
    node->value = x;
    node->next = self->_head;
    self->_head = node;
}

void deleteListD(struct ListD* self) {
    struct NListD* node = self->_head;
    while (node) {
        struct NListD* next_node = node->next;
        free(node);
        node = next_node;
    }
    free(self);
}

#endif //MAGNOLIA_LISTD_H