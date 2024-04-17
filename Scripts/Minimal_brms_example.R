pacman::p_load(brms)

ToothGrowth = ToothGrowth
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

contrasts(ToothGrowth$supp) <- bayestestR::contr.equalprior
contrasts(ToothGrowth$dose) <- bayestestR::contr.equalprior

formula <- bf(len ~ 1 + supp + dose + supp:dose)
default_prior(formula, ToothGrowth)

my_prior <- prior(normal(0,5), class = b)

brmsfit <- brm(formula, ToothGrowth,
               cores = 4, backend = "cmdstanr",
               prior = my_prior,
               sample_prior = TRUE,
               save_pars = save_pars(all = T))

pp_check(brmsfit)
summary(brmsfit)
conditional_effects(brmsfit)

results_hyp <- hypothesis(brmsfit, "dose1 = 0")
plot(results_hyp)
results_hyp$hypothesis$Evid.Ratio

formula2 <- bf(len ~ 1 + supp + dose)
default_prior(formula2, ToothGrowth)

brmsfit2 <- brm(formula2, ToothGrowth,
               cores = 4, backend = "cmdstanr",
               save_pars = save_pars(all = T))

BF <- bayes_factor(brmsfit2,brmsfit, cores = 4, repetitions = 10)
1/BF
