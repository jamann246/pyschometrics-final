# this file will conduct checks for criterion and content validity of the scale

# loading data
nhs <- read.csv("nhs-clean.csv") |> 
  dplyr::mutate(
    preparedness_affinity = 
      dis_prep + 
      dis_soc + 
      dis_exp +  
      dis_perception + 
      dis_stepshelp + 
      dis_confidence + 
      dis_awareness_effect + 
      dis_awareness_count
  ) |> 
  dplyr::select(
    -c(X, 
      dis_prep, 
      dis_soc, 
      dis_exp, 
      dis_perception,
      dis_stepshelp, 
      dis_confidence, 
      dis_awareness_effect, 
      dis_awareness_count
    )
  )


# looking at everything at once
corrplot::corrplot(cor(nhs))
cor(nhs)[,c('preparedness_affinity')]

# criterion validity
# looking at concurrent validity 
criterion_test <- cor.test(nhs$preparedness_affinity, nhs$dis_prepactions_count)
criterion_validity = tibble::tibble(
  Type = "Criterion",
  Variable = "dis_prepactions_count",
  r = round(criterion_test$estimate, digits = 3),
  `P-Value` = round(criterion_test$p.value, digits = 3),
  Pass = ifelse(r >= 0.06, TRUE, FALSE)
)

# construct validity
# expected correlated variables (convergent)
# dis_prep: Have you considered preparing for a disaster? 
# dis_soc: Thinking about preparing yourself for a disaster, which of the following best represents your degree of preparedness? 
# disability: Do you have a disability or a health condition that might affect your capacity to respond to an emergency situation (a mobility, hearing, vision, cognitive, or intellectual disability or physical, mental, or health condition)? (includes imputed values)
# care: Do you currently live with or have primary responsibility for assisting an elderly person or someone with a disability who requires assistance (a mobility, hearing, vision, cognitive, or intellectual disability or physical, mental, or health condition)?
# numadult: Including yourself, how many adults live in your household? 
# numchild: How many household members are children under the age of 18? 
# homeownership: Do you rent or own your home? (includes imputed values)
# income_agg: Calculated field - Which of the following describes your total household ANNUAL income before taxes? (including imputed values, collapsed into three categories)
# rurality: Calculated field - rurality designation based on ZIP code, county, and state
# age: what is your age (categories)

convergent_variables <- colnames(nhs)[2:9]

convergent_validity <- purrr::map_df(
  convergent_variables, 
  \(i){
    test <- cor.test(nhs$preparedness_affinity, nhs[,i])
    tibble::tibble(
      Type = "Convergent",
      Variable = i,
      r = round(test$estimate, digits = 3),
      `P-Value` = round(test$p.value, digits = 3),
      `Pass` = ifelse(test$estimate >= 0.4 & test$estimate <= 0.5, TRUE, FALSE)
    )
  }
  )

validity <- dplyr::bind_rows(criterion_validity, convergent_validity)

write.csv(validity, "validity-results.csv")
