# this file is being used to conduct a reliability analysis of the target scale

# loading data
scale <- read.csv("nhs-clean.csv") |> 
  dplyr::select(
    dis_prep, 
    dis_soc, 
    dis_exp, 
    dis_perception,
    dis_stepshelp, 
    dis_confidence, 
    dis_awareness_effect, 
    dis_awareness_count
  )

# calculating cronbach's alpha
alpha_results <- psych::alpha(                           
  as.data.frame(scale),              
  check.keys = TRUE,                                     
  max = 100
)

alpha_results

