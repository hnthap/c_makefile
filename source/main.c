#include <stdio.h>
#include "hello.h"

int main(int argc, char **argv) {
    int i;

    const char sentence[] =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
        "eiusmod tempor incididunt ut labore et dolore magna aliqua.";

    printf("Number of arguments: %d\n", argc - 1);
    for (i = 1; i < argc; i++) {
        printf("\tArgument %d: '%s'\n", i, argv[i]);
    }
    printf("Sentence: '%s'\n", sentence);
    printf("Length: %llu\n", StringLength(sentence, 100));
    printf("Length: %llu\n", StringLength(sentence, 200));

    return 0;
}