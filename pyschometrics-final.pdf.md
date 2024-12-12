---
title: "Psychometric Analysis of the National Household Survey on Disaster Preparedness Affinity"
author: "Jordan Amann"
format: 
    pdf:
        documentclass: scrartcl
        pdf-engine: lualatex
        fontfamily: times
        linestretch: 2
        keep-md: true
        keep-tex: true
        bibliography: references.bib
        reference-location: section
        bibliographystyle: apa
        abstract-title: "Abstract"
        geometry:
            - top=1in
            - bottom=1in
            - left=1in
            - right=1in
abstract: |
    Natural disasters pose significant risks to physical and mental health as well as financial stability. Household-level preparedness can be life-saving, yet there is limited psychometric analysis of tools measuring disaster preparedness affinity. This study analyzes the psychometric properties of the 2023 National Household Survey (NHS), conducted by FEMA, which includes items designed to measure preparedness affinity. Key findings indicate good reliability and criterion validity, but limited construct validity. Exploratory factor analysis supports a single-factor or two-factor model representing preparedness affinity. Further refinement of the scale is recommended to improve its psychometric robustness.
---



## Introduction

The United Nations Office for Disaster Risk Reduction defines disasters as a serious disruption of the functioning of a community or a society at any scale due to hazardous events interacting with conditions of exposure, vulnerability and capacity, leading to one or more of the following: human, material, economic and environmental losses and impacts [@undrr_disaster_terminology]. Noteably, as global climate change progresses, it will increase the probability of extreme and hazardous weather events [@keim2008]. A critical component of mitigating the human, material, and economic cost of disasters is increasing government, community, and individual preparedness. As such, understanding the degree of individual preparedness and its driving factors is essential.

The Federal Emergency Management Agency (FEMA) has conducted an annual National Household Survey (NHS) to measure household disaster preparedness actions and attitudes since 2013. In the public release of the 2023 results from the survey four concepts, made up of 7 items included in the survey, were identified as contributing to disaster preparedness affinity: awareness of information, disaster experience, preparedness efficacy, and disaster risk perception [@fema2023nhs]. These items have not been formally defined as a scale to measure individual preparedness affinity, but it is worth exploring the psychometric qualities of them as a scale due to the scale and resources behind the larger survey they are delivered in. This study aims to assess the internal consistency and reliability of these NHS items related to disaster preparedness affinity, evaluate the criterion validity of these items based on self-reported preparedness actions, assess construct validity using economic and household demographic data, and explore the latent structure of the preparedness affinity construct using exploratory factor analysis.

## Methods

#### Sampling

The 2023 NHS was a cross-sectional survey that targeted adults aged 18 and older who were U.S. residents, with a total of 7,604 complete responses. It was distributed online via invite, and was administered confidentially. Populations at higher risk for specific hazards (7%, n=525) and underrepresented groups, including American Indian, Alaska Native, Native Hawaiian, and Pacific Islanders (7%, n=517) were over-sampled. Additional demographic characteristics such as age, gender, race, ethnicity, and income were monitored while the survey was live and compared to soft quotas which were created using U.S. Census Bureau data from the 2021 Five-Year American Community Survey and the 2020 Decennial Census of Island Are. Seven percent (n=525) of participants completed the survey in Spanish, all other participants completed the survey in English. All responses included in this analysis were complete; however, some demographic variables were imputed by FEMA, including education, gender, race, disability, home-ownership, income and ethnicity. Across all of these variables, the average change from imputation was 0.51%.

#### Measurement

Preparedness affinity was measured using a subset of items from the NHS, which were identified by FEMA as being relevant driving factors of this construct. The specific items can be found in @tbl-items.

#### Reliability and Validity

Psychometric analysis was conducted to evaluate reliability using Cronbach’s alpha for internal consistency, criterion validity by correlating the preparedness affinity scale with self-reported preparedness actions, and construct validity through correlations with demographic variables such as income, disability status, household size, home-ownership, age, and rural status.

#### Exploratory Factor Analysis

Exploratory Factor Analysis using Principal Axis Factoring was used to assess the latent structure, with scree plots and eigenvalues guiding the selection of one-, two-, and four-factor models.

## Results

The preparedness affinity scale achieved a Cronbach’s alpha of 0.75, indicating good internal consistency. Preparedness affinity demonstrated a moderately strong correlation (r = 0.67) with the total number of preparedness actions taken, supporting good criterion validity. However, no substantial evidence of convergent construct validity was found, as correlations with demographic variables were negligible (r \< 0.2), suggesting limited alignment with external constructs. Exploratory Factor Analysis indicated that a single-factor model explained 36% of the variance with strong factor loadings across all items. A two-factor model explained 43% of the variance with reduced complexity and was interpreted as “Disaster Awareness” and “Risk Perception” with Cronbach’s alphas of 0.67 and 0.68, respectively. The four-factor model failed to produce distinct factors, with overlapping loadings and Cronbach’s alphas as low as 0.46 for individual factors.

## Discussion

The NHS preparedness affinity items demonstrated strong reliability and acceptable criterion validity but lacked robust construct validity. Factor analysis suggests that the preparedness affinity construct may be best represented by a single factor, although a two-factor model also provides a meaningful interpretation. The scale’s reliability decreases when disaggregated into multiple factors, indicating redundancy among the hypothesized components. Comprehensive sampling ensured representation of high-risk populations, and initial evidence supports the use of NHS items as a psychometric instrument for preparedness affinity.

## Limitations

The cross-sectional design of the NHS precluded assessment of test-retest reliability, and construct validity analysis was limited by the available demographic variables.

## Conclusion

The 2023 NHS provides a promising foundation for measuring disaster preparedness affinity. However, further refinement is needed to enhance its validity and applicability in broader contexts. Future research should develop and validate a more comprehensive model of preparedness affinity, include additional measures for content and construct validity, and conduct longitudinal studies to evaluate test-retest reliability.

References

Appendix

|                |                                                                                                                       |
|-------------------------|----------------------------------------------|
| Label          | Question                                                                                                              |
| dis_prep       | Have you considered preparing for a disaster?                                                                         |
| dis_soc        | Thinking about preparing yourself for a disaster, which of the following best represents your degree of preparedness? |
| dis_exp        | Have you or your family ever experienced the impacts of a disaster?                                                   |
| dis_awareness  | In the past year, what information have you read, seen, or heard about how to get better prepared for a disaster?     |
| dis_perception | Thinking about the area you live in, how likely would it be for a disaster to impact you?                             |
| dis_stepshelp  | How much would taking steps to prepare help you get through a disaster in your area?                                  |
| dis_confidence | How confident are you that you can take steps to prepare for a disaster in your area?                                 |

: Preparedness Affinity Items {#tbl-items}