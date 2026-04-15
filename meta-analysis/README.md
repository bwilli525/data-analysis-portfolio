# Meta‑Analysis: Social Presence and User Experience with AI Agents

This folder contains the R script and data for the meta‑analysis reported in:

**Williams, B. A. (2025). The influence of perceived anthropomorphism and social presence on AI interface user experience: A systematic review.**  
*International Journal of Human–Computer Interaction*. https://doi.org/10.1080/10447318.2025.2575897

## Files

- `ai_social_presence_meta.csv` – Extracted effect sizes (r) with study, AI format, sample size, and construct (social presence or anthropomorphism).
- `meta_analysis.R` – R script using `metafor` to run random‑effects meta‑analysis, subgroup analysis, and publication bias tests.

## Methods

- Effect sizes: Pearson’s r (converted to Fisher’s z).
- Model: Random‑effects (REML).
- Subgroup moderator: AI format (Multimodal = Avatar + Service Robot vs. Text/Voice = others).
- Heterogeneity: I² statistic.
- Publication bias: Funnel plot and Egger’s regression test.

## How to Run

1. Install R and the `metafor`, `ggplot2`, and `dplyr` packages.
2. Download both files to the same folder.
3. Run `meta_analysis.R` line by line.

## Key Findings (based on social presence effects only, k=18)

- Overall effect of social presence on user experience: **r = 0.49** (95% CI [0.38, 0.58]).
- High heterogeneity (I² = 97.5%).
- No significant difference between Multimodal (Avatar, r=0.61) and Text/Voice (r=0.48) formats (p = 0.57), consistent with the paper’s description of “marginal” differences.
- No evidence of publication bias (Egger’s test p = 0.60).

## Notes

- This analysis includes only studies that measured **social presence**. The paper’s format comparisons also drew on anthropomorphism studies, which are not included here.
- The script is provided for reproducibility; results may differ slightly from the published paper due to differences in effect size selection.

## Citation

Williams, B. A. (2025). The influence of perceived anthropomorphism and social presence on AI interface user experience: A systematic review. *International Journal of Human–Computer Interaction*. https://doi.org/10.1080/10447318.2025.2575897
