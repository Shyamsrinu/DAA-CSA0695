#include <stdio.h>
#include <limits.h>
#include <stdbool.h>

#define N 4 

int tsp(int graph[N][N], int dp[1 << N][N], int mask, int pos) {
    if (mask == (1 << N) - 1) {
        return graph[pos][0]; // Return to starting point
    }

    if (dp[mask][pos] != -1) {
        return dp[mask][pos];
    }

    int ans = INT_MAX;
    for (int city = 0; city < N; city++) {
        if (!(mask & (1 << city))) {
            int newAns = graph[pos][city] + tsp(graph, dp, mask | (1 << city), city);
            ans = (ans < newAns) ? ans : newAns;
        }
    }

    return dp[mask][pos] = ans;
}

int main() {
	printf("SHYAMALA (192211641\n"); 
    int graph[N][N] = {
        {0, 10, 15, 20},
        {10, 0, 35, 25},
        {15, 35, 0, 30},
        {20, 25, 30, 0}
    };

    int dp[1 << N][N];
    for (int i = 0; i < (1 << N); i++) {
        for (int j = 0; j < N; j++) {
            dp[i][j] = -1;
        }
    }

    int result = tsp(graph, dp, 1, 0); // Start from city 0 with mask = 1 (city 0 visited)

    printf("Minimum cost of traveling through all cities is %d\n", result);

    return 0;
}
