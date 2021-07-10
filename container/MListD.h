//
// Created by François Fayard on 08/07/2021.
//

#ifndef MAGNOLIA_MLISTD_H
#define MAGNOLIA_MLISTD_H

#include "stdlib.h"

struct NListD_s {
    double value;
    struct NListD_s* next;
};
typedef struct NListD_s NListD;

struct ListD_s {
    NListD* _head;
};
typedef struct ListD_s ListD;

ListD* newListD();
ListD* initListD(ListD* mem);
ListD* copyListD(ListD* other);

NListD* beginListD(ListD* self);
NListD* endListD(ListD* self);
void prependListD(ListD* self, double x);
void appendListD(ListD* self, double x);

NListD* _backListD(ListD* self);

void deleteListD(ListD* self);
void releaseListD(ListD* self);

ListD* newListD() {
    ListD* mem = malloc(sizeof(ListD));
    return initListD(mem);
}

ListD* initListD(ListD* mem) {
    mem->_head = NULL;
    return mem;
}

NListD* beginListD(ListD* self) {
    return self->_head;
}

NListD* endListD(ListD* self) {
    return NULL;
}

NListD* nextListD(ListD* self, NListD* node) {
    return node->next;
}

void prependListD(ListD* self, double x) {
    NListD* node = malloc(sizeof(NListD));
    node->value = x;
    node->next = self->_head;
    self->_head = node;
}

void appendListD(ListD* self, double x) {
    NListD* back = _backListD(self);
    NListD* node = malloc(sizeof(NListD));
    back->next = node;
    node->value = x;
    node->next = NULL;
}

NListD* _backListD(ListD* self) {
    NListD* node = self->_head;
    while (node->next) {
        node = node->next;
    }
    return node;
}

void deleteListD(ListD* self) {
    releaseListD(self);
    free(self);
}

void releaseListD(ListD* self) {
    NListD* node = self->_head;
    while (node) {
        NListD* next_node = node->next;
        free(node);
        node = next_node;
    }
}

#endif //MAGNOLIA_MLISTD_H