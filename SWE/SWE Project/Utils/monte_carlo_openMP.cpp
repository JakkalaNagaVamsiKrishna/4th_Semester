// This is an optimised implementation of these 5 options which are widely used in Monte_Carlo simulations for guessing the stock price

// We are using the openMP (open Multi-Processing) library to do the parallel computation for optimal distribution of processor cores automatically

// This does not contain Antithetic variates 

#include <iostream> 
#include <vector> 
#include <cmath> 
#include <random> 
#include <algorithm>
#include <omp.h> // Header for openMP 
using namespace std;

enum OptionType { CALL, PUT, ASIAN_CALL, BARRIER_KNOCKOUT_CALL, LOOKBACK_CALL};

double simulateParallel(OptionType type, double S0, double K, double r, double sigma, double T, double H, int steps, int sims){
    double dt = T/steps;
    double total_payoff = 0.0 ;
    
    //This directive tells C++ to run the loop in parallel across all CPU cores.
    // 'reduction(+:total_payoff)' ensures that each core's sub-sum is safely added to the final total at the end without any memory conflicts 

    #pragma omp parallel reduction(+:total_payoff)
    {    
    // Each thread needs its own random number generator to avoid "race conditions"
        unsigned int seed = static_cast<unsigned int>(time(NULL)) ^ omp_get_thread_num();
        mt19937 gen(seed);
        normal_distribution<double> dist(0.0, 1.0);

        #pragma omp for
        for(int i=0; i < sims; i++){
            double St = S0;
            double running_sum = 0.0;
            double min_S = S0;
            bool knocked_out = false;

            for(int j = 0; j < steps; j++){
                double z = dist(gen);
                St *= exp((r-0.5* sigma * sigma) * dt + sigma * sqrt(dt)*z);

                // Track for path-dependent types 
                running_sum += St;
                if(St < min_S) min_S = St;
                if(St <= H) knocked_out = true; //For down and out barrier
            }

            double payoff = 0;
            switch(type){
                case CALL:
                    payoff = max(St-K, 0.0);
                    break;
                case PUT:
                    payoff = max(K-St, 0.0);
                    break;
                case ASIAN_CALL:
                    payoff = max((running_sum/steps)-K, 0.0);
                    break;
                case BARRIER_KNOCKOUT_CALL:
                    payoff = knocked_out ? 0.0 : max(St-K, 0.0);
                    break;
                case LOOKBACK_CALL:
                    payoff = max(St - min_S, 0.0); // Floating strike: Buy at min
                    break;
            }
        total_payoff += payoff;
        }
    }

    return (total_payoff/sims) * exp(-r * T);
}

int main(){
    double S = 100, K=100, r=0.05, sig = 0.2, T = 1.0, H = 80.0;
    int steps = 252, sims = 10000;

    std::cout << "Vanilla Call:    $" << simulateParallel(CALL, S, K, r, sig, T, H, steps, sims) << endl;
    std::cout << "Asian Call:      $" << simulateParallel(CALL, S, K, r, sig, T, H, steps, sims) << endl;
    std::cout << "Barrier (80) Out:$" << simulateParallel(CALL, S, K, r, sig, T, H, steps, sims) << endl;

    return 0;
}