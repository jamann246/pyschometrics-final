# this file is for the ingest and wrangling of the data needed 
# for the analysis of psychometric properties of the nhs survey

# variables i need to extract include:

# the scale (awareness, experience, efficacy, risk)
# dis_prep: Have you considered preparing for a disaster? 
# dis_soc: Thinking about preparing yourself for a disaster, which of the following best represents your degree of preparedness? 
# dis_exp: Have you or your family ever experienced the impacts of a disaster?
# dis_awareness: In the past year, what information have you read, seen, or heard about how to get better prepared for a disaster?
# dis_perception: Thinking about the area you live in, how likely would it be for a disaster to impact you?
# dis_stepshelp: How much would taking steps to prepare help you get through a disaster in your area?
# dis_confidence: How confident are you that you can take steps to prepare for a disaster in your area?


# expected correlated variables
# disability: Do you have a disability or a health condition that might affect your capacity to respond to an emergency situation (a mobility, hearing, vision, cognitive, or intellectual disability or physical, mental, or health condition)? (includes imputed values)
# care: Do you currently live with or have primary responsibility for assisting an elderly person or someone with a disability who requires assistance (a mobility, hearing, vision, cognitive, or intellectual disability or physical, mental, or health condition)?
# numadult: Including yourself, how many adults live in your household? 
# numchild: How many household members are children under the age of 18? 
# homeownership: Do you rent or own your home? (includes imputed values)
# income_agg: Calculated field - Which of the following describes your total household ANNUAL income before taxes? (including imputed values, collapsed into three categories)

# expected uncorrelated
# rurality: Calculated field - rurality designation based on ZIP code, county, and state
# age: what is your age (categories)

# criterion validation
# dis_prepactions: What have you done to prepare for a disaster or emergency in the last year?

# load the full dataset
nhs_raw <- readxl::read_excel(
  path = "./fema_national_household_survey_2023/fema_national_household_survey_2023_data_and_codebook.xlsx",
  sheet = "Core Survey",
  skip = 1
) |> 
  # dplyr::filter(sample == "National") |> 
  dplyr::select(
    # scale
    dis_prep, 
    dis_soc, 
    dis_exp,  # experience
    dis_perception, # risk perception
    dis_stepshelp, # efficacy
    dis_confidence,  # efficacy
    dplyr::starts_with('dis_awareness'), # awareness

    # criterion
    dplyr::starts_with("dis_prepactions"),

    # content
    disability, care, numadult, numchild, age,
    homeownership, income_agg, rurality
  ) |> 
  dplyr::mutate(
    dplyr::across(
      dplyr::everything(), 
      ~dplyr::if_else(.x == "Blank", NA, .x)
    )
  )


nhs <- nhs_raw |> 
  dplyr::mutate(
    dis_prep = 
      factor(
        dis_prep, 
        levels = c(
          "Don't know",
          "No",
          "Maybe",
          "Yes",
          "Yes, and I have taken steps to prepare",
          "Yes, and preparedness is part of my everyday life"
        ),
        ordered = TRUE
      ),
    dis_exp = 
      factor(
        dis_exp, 
        levels = c("Don't know","No","Yes"),
        ordered = TRUE
      ), 
    dis_soc = 
      factor(
        dis_soc, 
        levels = c(
          "Don't know", 
          "I am NOT prepared, and I do not intend to prepare in the next year", 
          "I am NOT prepared, but I intend to start preparing in the next year",
          "I am NOT prepared, but I intend to get prepared in the next six months",
          "I have been prepared for LESS than a year",
          "I have been prepared for MORE than a year and I continue preparing"
        ),
        ordered = TRUE
      ),
    dis_perception = 
      factor(
        dis_perception, 
        levels = c(
          "Don't know",
          "Unlikely",
          "Likely",
          "Very likely"
        ) ,
        ordered = TRUE
      ),
    dis_stepshelp = 
      factor(
        dis_stepshelp, 
        levels = c(
          "Don't know",
          "Not at all",
          "Very little",
          "Somewhat",
          "Quite a bit",
          "A great deal"
        ),
        ordered = TRUE
      ),
    dis_confidence = 
      factor(
        dis_confidence, 
        levels = c(
          "Don't know",
          "Not at all confident",
          "Slightly confident",
          "Somewhat confident",
          "Moderately confident",
          "Extremely confident"
        ),
        ordered = TRUE
      ),
      dis_awareness_effect = 
        factor(
          dis_awareness_effect, 
          levels = c(
            "Don't know",
            "No",
            "Yes"
          ),
          ordered = TRUE 
        ),    
    dis_awareness_count = rowSums(
      !is.na(
        nhs_raw[, c(
          'dis_awareness_a','dis_awareness_b','dis_awareness_c','dis_awareness_d',
          'dis_awareness_e','dis_awareness_f','dis_awareness_g','dis_awareness_h',
          'dis_awareness_i','dis_awareness_j','dis_awareness_k','dis_awareness_l',
          'dis_awareness_m','dis_awareness_n'
        )]
      )
    ),
    dis_prepactions_count = rowSums(
      !is.na(
        nhs_raw[, c(
          "dis_prepactions_a","dis_prepactions_b","dis_prepactions_c","dis_prepactions_d",        
          "dis_prepactions_e", "dis_prepactions_f","dis_prepactions_g","dis_prepactions_h",   
          "dis_prepactions_i","dis_prepactions_j","dis_prepactions_k","dis_prepactions_l",       
          "dis_prepactions_m","dis_prepactions_n"
        )]
      )
    ),
    disability = dplyr::if_else(
      disability == "Disability",
      1, 0
    ),
    care = dplyr::if_else(
      care == "Yes",
      1, 0
    ),
    homeownership = dplyr::if_else(
      homeownership == "Own",
      1, 0
    ),
    income_agg = factor(
      income_agg, 
      levels = c("Less than $50k","$50,000 to $99,999","$100K +")
    ),
    rurality = dplyr::if_else(
      rurality == "Rural", 
      1, 0
    ),
    age = substr(age, 1,1)
  ) |> 
  dplyr::select(
    dis_prep, dis_soc, dis_exp, dis_perception, dis_stepshelp, 
    dis_confidence, dis_awareness_effect, dis_awareness_count,
    dis_prepactions_count,
    disability, care, numchild, numadult, homeownership,
    income_agg, rurality, age
  ) |> 
  dplyr::mutate(
    dplyr::across(dplyr::everything(), as.numeric),
    dis_awareness_effect = dplyr::if_else(is.na(dis_awareness_effect), 0, dis_awareness_effect)
  )

# storing the wrangled dataset
write.csv(nhs, "nhs-clean.csv")
