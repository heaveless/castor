#include <stdlib.h>

#define MAX_SIZE 10

typedef struct {
    void *items[MAX_SIZE];
    int top;
} Stack;

void initialize(Stack *stack) {
    stack->top = -1;
}

int isEmpty(Stack *stack) {
    return stack->top == -1;
}

int isFull(Stack *stack) {
    return stack->top == MAX_SIZE - 1;
}

void push(Stack *stack, void *value) {
    if (isFull(stack)) return;

    stack->items[++stack->top] = value;
}

void *pop(Stack *stack) {
    if (isEmpty(stack)) return NULL;

    return stack->items[stack->top--];
}

void *peek(Stack *stack) {
    if (isEmpty(stack)) return NULL;

    return stack->items[stack->top];
}