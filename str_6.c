#include <stdio.h>
 
char str[2000000];
 
void search_sequence(int size, int n) {
    int counter = 1;
    for (int i = 1; i < size; ++i) {
        if (str[i] < str[i - 1]) {
            counter++;
        } else {
            counter = 1;
        }
        if (counter == n) {
            printf("start index %d ", i - counter + 1);
            for (int j = i - counter + 1; j < i + counter; ++j) {
                printf("%c", str[j]);
            }
            return;
        }
    }
}
 
int main(int argc, char* argv[]) {
    char c;
    int size = 0;
    int n;
    scanf("%d", &n);
    if (n < 2) {
        printf("Incorrect input n\n");
        return 0;
    }
    do {
        c = fgetc(stdin);
        str[size++] = c;
    } while (c != '\n' && size < 2000000);
    if (c != -1 && size >= 2000000) {
        printf("Incorrect input string size\n");
        return 0;
    }
    search_sequence(size, n);
    return 0;
}
