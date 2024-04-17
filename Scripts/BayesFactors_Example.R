#' Compute Bayes Factors for the Thought Experiment presented in the Workshop
#' 
#' Option 1
#' 1) Compute the Prior Odds of beeing a Genius
#' 2) Compute the Posterior Odds after a positive test
#' 3) Compute the Ratio between Prior and Posterior Odds
PriorOdds <- .002/(1-.002)
PosteriorOdds <- .284 / (1 - .284)
PosteriorOdds/PriorOdds

# We can do the same for conduncting another independent test using the Posterior Odds adter
# the first test
Post2 <- (.284 * .99) / (.284*.99 + .716 * .005)
PostOdds2 <- Post2 / (1 - Post2)

# When we calculate the Bayes Factor for updating our odds once more it stays constant
PostOdds2/PosteriorOdds

#' Option 2
#' For this example we do now the likelihood for getting a postive result given the two
#' outcomes. So, we can directly compute the Bayes Factor from the ratio of the Sensitivity
#' divided by (1- Specificity)
.99/(1-.995)
