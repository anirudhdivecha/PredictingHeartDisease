#include <R.h>
#include <Rmath.h>
#include <math.h>
#include <stdio.h>

void alt2(int *n, double *y)
{
      int i;
      double x[*n];
      x[0] = 1.0;
      y[0] = 0;
      for(i = 1; i < *n; i++) {
          // x[i] = x[i-1] + 1.0 / ((i+1.0)*(i+1.0));
          /* or x[i] = x[i-1] + 1.0 / pow(i+1.0,2.0); */ 
          y[i] = y[i-1] + (pow(-1, i + 1) / i);
      }
}

void gkr(double *x, double *y, int *n, double *b, double *g, int *m)
{
    int i,j;
    double sum = 0.0;
    double diff;
    for(i = 0; i < *m; i++)
    {
        printf("i: %d\n", i);

        sum = 0.0;
        for(j=0; j < *n; j++)
        {
            diff = pow(x[j] - g[i], 2);
            // printf("The value of the diff is: %f\n", diff);
            sum += exp((-1 * diff) / (2 * pow(*b, 2)));
        }
        // printf("The value of the variable is: %f\n", sum / *n);
        
        y[i] = sum / (*n * sqrt(2 * M_PI * pow(*b, 2)));
    }

    // for (int i = 0; i < 5; i++) {
    //     printf("%.2f ", y[i]);
    // }

    // return *y;
}

void paretoint(double *xmax, double *c, double *p, double *result)
{
    double inc, x, t;
    double n = 1000000;
    inc = (*xmax) / n;
    x = 0;
    t = 0; // since f(x) = 0
    for(int i=1; i < n; i++)
    {
	    x += inc; 
	    t += ((*p - 1) * pow(*c, *p - 1) * pow(x + *c, -*p));
    }
    *result = t * inc;
}

// int main() 
// {
    
//     double x[] = {1, 34, 4, 5};
//     double y[] = {0, 0, 0, 0, 0};
//     int n = 4;
//     double band = 0.6;
//     double g[] = {6, 8, 9, 5, 3};
//     int m = 5;
//     // gkr(x, y, &n, &band, g, &m);
//     // printf("Hello, World!\n");
//     // for (int i = 0; i < 5; i++) {
//     //     printf("%.2f ", y[i]);
//     // }
//     // printf("The value of the variable is: %f\n", *h);


//     // Return 0 to indicate successful execution
//     return 0;
// }


