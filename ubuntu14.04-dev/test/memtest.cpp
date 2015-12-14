#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
    for(int i = 0; i < 20; i++){
         char *p = (char*) malloc(1024*1024);
         if(p == NULL) {
             printf("alloc faild\n");
             return -1;
          }
         memset(p, 'a', 1024*1024);
         printf("%d MB\n", i+1);
    }
}


