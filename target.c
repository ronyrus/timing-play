#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define P(...) do { \
    printf(__VA_ARGS__); \
    fflush(stdout); \
} while (0)

#define DEFAULT_PASSWORD "verysecretpassword"
#define PASSWORD_MAX_LEX 30

int main(int argc, char *argv[])
{
    char buf[PASSWORD_MAX_LEX + 1];

    while (1)
    {
        P("what is the password?:\n");
        if (scanf("%30s", buf) != 1)
        {
            P("something wrong with the input, bye bye\n");
            return EXIT_FAILURE;
        }
        if (memcmp(buf, DEFAULT_PASSWORD, strlen(DEFAULT_PASSWORD)))
            P("wrong password, try again!\n");
        else
        {
            P("the password is correct, congrads!\n");
            break;
        }
    }

    return EXIT_SUCCESS;
}
