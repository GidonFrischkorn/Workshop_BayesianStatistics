# Load packages
pacman::p_load(here, brms, tidyverse)

# Load the ToothGrowth data set provided in R
ToothGrowth = ToothGrowth

# code the dose variable as factor
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

# specfiy that the two predictors supp & dose should use sum-to-zero contrasts
contrasts(ToothGrowth$supp) <- bayestestR::contr.sum
contrasts(ToothGrowth$dose) <- bayestestR::contr.sum

# specify a formula to predict the length of teeth by the type of supplement and its dose
formula <- bf(len ~ 1 + supp + dose + supp:dose)

# have a look at the priors I can specify for this model
default_prior(formula, ToothGrowth)

# specify a normal prior with sd = 5 for all regression weights
my_prior <- prior(normal(0,5), class = b)

# fit the model using the brm function
brmsfit <- brm(formula, ToothGrowth,
               cores = 4,
               prior = my_prior,
               sample_prior = TRUE,
               save_pars = save_pars(all = T))

# have a quick look at the results
pp_check(brmsfit)
summary(brmsfit)
conditional_effects(brmsfit)

# test if a parameter is different from a value of interest (e.g. 0)
results_hyp <- hypothesis(brmsfit, "dose1 = 0")
plot(results_hyp)
results_hyp$hypothesis$Evid.Ratio

# specify a reduced model without the interaction
formula2 <- bf(len ~ 1 + supp + dose)

# let's have a look at the priors again
default_prior(formula2, ToothGrowth)

# fit the model to the data
brmsfit2 <- brm(formula2, ToothGrowth,
               cores = 4,
               save_pars = save_pars(all = T))

# compare the two models to obtain evidence for or against the interaction
BF <- bayes_factor(brmsfit2,brmsfit, cores = 4, repetitions = 10)
1/BF
