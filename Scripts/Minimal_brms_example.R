ToothGrowth = ToothGrowth
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

contrasts(ToothGrowth$supp) <- bayestestR::contr.equalprior
contrasts(ToothGrowth$dose) <- bayestestR::contr.equalprior

formula <- bf(len ~ 1 + supp + dose + supp:dose)
default_prior(formula, ToothGrowth)

brmsfit <- brm(formula, ToothGrowth,
               cores = 4, backend = "cmdstanr")

pp_check(brmsfit)
summary(brmsfit)
conditional_effects(brmsfit)

