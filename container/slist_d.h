//
// Created by François Fayard on 08/07/2021.
//

#ifndef MAGNOLIA_SLIST_D_H
#define MAGNOLIA_SLIST_D_H

#include "stdlib.h"
#include "string.h"
#include "stdint.h"

struct slist_node_d {
    double value;
    struct slist_node_d* next;
};

struct slist_d {
    struct slist_node_d* head;
};

struct slist_d* new_slist_d();
struct slist_d* copy_slist_d(const struct slist_d* other);

void prepend_slist_d(struct slist_d* self, double x);

void delete_slist_d(struct slist_d* self);

struct slist_d* new_slist_d() {
    struct slist_d* ans = malloc(sizeof(struct slist_d));
    ans->head = NULL;
    return ans;
}

void prepend_slist_d(struct slist_d* self, double x) {
    struct slist_node_d* node = malloc(sizeof(struct slist_node_d));
    node->value = x;
    node->next = self->head;
    self->head = node;
}

void delete_slist_d(struct slist_d* self) {
    struct slist_node_d* node = self->head;
    while (node) {
        struct slist_node_d* next_node = node->next;
        free(node);
        node = next_node;
    }
    free(self);
}


#endif //MAGNOLIA_SLIST_D_H