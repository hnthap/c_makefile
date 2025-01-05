#include "hello.h"

size_t StringLength(const char *str, size_t maxlen) {
    size_t i;
    for (i = 0; i < maxlen; i++) {
        if (str[i] == '\0') {
            break;
        }
    }
    return i;
}
