#' Exercise: Coding a simple Bayesian Experiment
#' 
#' A shop for magicians' supplies sells fair and trick coins. 
#' The trick coins can either be biased towards showing tails or heads in 80% of the flips. 
#' A friend got you a coin from this shop but did not tell you if it was a fair or one of the trick coins.
#' So now you will have to find out for yourself…
#' 
#' In the end we want to know how many coin flips we need to find out which coin we have.

# Step-by-step ---------------------------------------------------------------------------

# define all possible outcomes
outcomes <- c(0.2, 0.5, 0.8)

# specify a prior giving equal probability to all possible outcomes
prior <- rep(1/length(outcomes),times = length(outcomes))
prior <- c(2/10,4/10,4/10)

# randomly sample one of the possible outcomes
true_prob <- 0.2 # sample(outcomes, size = 1)

# define the number of flips in each updating step
flips2step <- 5

# generate one coin flip for each iteration
data <- rbinom(1, size = flips2step, prob = true_prob)

# calculate the likelihood of your data give all outcomes
likelihood <- dbinom(data, size = flips2step, prob = outcomes)

# for the first flip we need to update our priors
posterior <- prior * likelihood / sum(prior * likelihood)

# print the posterior to the console
posterior

# generate one coin flip for each iteration
data <- rbinom(1, size = flips2step, prob = true_prob)

# calculate the likelihood of your data give all outcomes
likelihood <- dbinom(data, size = flips2step, prob = outcomes)

# for the first flip we need to update our priors
posterior2 <- posterior * likelihood / sum(posterior * likelihood)

# print the updated posterior to the console
posterior2
