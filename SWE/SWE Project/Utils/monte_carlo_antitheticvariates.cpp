// This is an optimised implementation of these 5 options which are widely used in Monte_Carlo simulations for guessing the stock price

// We are using the openMP (open Multi-Processing) library to do the parallel computation for optimal distribution of processor cores automatically

// We are using the antithetic variates for reducing the variance of noise and increasing the accuracy of the prediction


// Antithetic variates is a variace reduction technique used to  make Monte Carlo Simulations more "stable" and accurate with fewer trials.
// For every path we calculate using a sequence of random numbers {z1, z2, z3, ..., zn} 
// we immediately calculate a "mirror" path using {-z1, -z2, -z3, ... -zn}.


#include <iostream> 
#include <vector> 
#include <cmath> 
#include <random> 
#include <algorithm>
#include <omp.h> // Header for openMP 
using namespace std;

enum OptionType { CALL, PUT, ASIAN_CALL, BARRIER_KNOCKOUT_CALL, LOOKBACK_CALL};

double simulateAntithetic(OptionType type, double S0, double K, double r, double sigma, double T, double H, int steps, int sims){
    double dt = T/steps;
    double total_payoff = 0.0 ;
    
    //We only need to run half the simulations because each loop generates TWO paths 
    int half_sims = sims / 2;


    //This directive tells C++ to run the loop in parallel across all CPU cores.
    // 'reduction(+:total_payoff)' ensures that each core's sub-sum is safely added to the final total at the end without any memory conflicts 

    #pragma omp parallel reduction(+:total_payoff)
    {    
    // Each thread needs its own random number generator to avoid "race conditions"
        unsigned int seed = static_cast<unsigned int>(time(NULL)) ^ omp_get_thread_num();
        mt19937 gen(seed);
        normal_distribution<double> dist(0.0, 1.0);

        #pragma omp for
        for(int i=0; i < half_sims; i++){
            double St1 = S0;
            double St2 = S0;
            double min_S1 = S0;
            double min_S2 = S0;
            double sum1 = 0.0, sum2 = 0.0;
            bool out1 = false, out2 = false;

            for(int j = 0; j < steps; j++){
                double z = dist(gen);
                double drift = (r-0.5* sigma * sigma) * dt ;
                double diffusion = sigma * sqrt(dt);

                // Path1 uses +z 
                St1 *= exp(drift + diffusion * z);
                // Path2 uses -z
                St2 *= exp(drift + diffusion * (-z));

                sum1 += St1; sum2 += St2;

                min_S1 = min(St1, min_S1);
                min_S2 = min(St2, min_S2);

                if(St1 <= H) out1 = true;
                if(St2 <= H) out2 = true;
            }

            //Calculate Payoffs for both and average the, 
            double p1 = 0.0, p2 = 0.0;
            switch(type){
                case CALL:
                    p1 = max(St1-K, 0.0);
                    p2 = max(St2-K, 0.0);
                    break;
                case PUT:
                    p1 = max(K-St1, 0.0);
                    p2 = max(K-St2, 0.0);
                    break;
                case ASIAN_CALL:
                    p1 = max((sum1/steps)-K, 0.0);
                    p2 = max((sum2/steps)-K, 0.0);
                    break;
                case BARRIER_KNOCKOUT_CALL:
                    p1 = out1 ? 0.0 : max(St1-K, 0.0);
                    p2 = out2 ? 0.0 : max(St2-K, 0.0);
                    break;
                case LOOKBACK_CALL:
                    // Floating strike: Buy at min
                    p1 = max(St1-min_S1, 0.0);
                    p2 = max(St2-min_S2, 0.0);
                    break;
            }
        total_payoff += (p1 + p2)/2.0;
        }
    }
    return (total_payoff/half_sims) * exp(-r * T);
}

int main(){
    double S = 100, K=100, r=0.05, sig = 0.2, T = 1.0, H = 80.0;
    int steps = 252, sims = 10000;

    std::cout << "Vanilla Call:    $" << simulateAntithetic(CALL, S, K, r, sig, T, H, steps, sims) << endl;
    std::cout << "Asian Call:      $" << simulateAntithetic(CALL, S, K, r, sig, T, H, steps, sims) << endl;
    std::cout << "Barrier (80) Out:$" << simulateAntithetic(CALL, S, K, r, sig, T, H, steps, sims) << endl;

    return 0;
}