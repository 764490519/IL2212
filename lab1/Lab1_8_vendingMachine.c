#include <stdio.h>
#include <stdbool.h>

int main()
{
    int remainCoins = 0;
    while (true)
    {
        bool bottle = false;
        bool Return = false;
        printf("Enter an input (10, 5, 0): ");
        int insertCoins;
        scanf("%d", &insertCoins);
        int coins = insertCoins + remainCoins;
        if (coins >= 10)
        {
            bottle = true;
            coins -= 10;
            if (coins >= 5)
            {
                Return = true;
                coins -= 5;
            }
        }
        remainCoins = coins;
        if (bottle && Return)
        {
            printf("Output: Bottle, Return\n");
        }
        else if (bottle)
        {
            printf("Output: Bottle\n");
        }
        else
        {
            printf("Output: Nothing\n");
        }
    }
    return 0;
}