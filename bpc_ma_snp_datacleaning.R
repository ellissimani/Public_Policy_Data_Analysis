ma <- read.csv("MA data by State.csv", header = TRUE)

ma_state = aggregate(ma$Enrolled, list(state = ma$State), na.rm = TRUE, FUN = sum)
ma_state_type = aggregate(ma$Enrolled, list(type = ma$Plan.Type, state = ma$State), na.rm = TRUE, FUN = sum)









### SNP 
snp <- read.csv("snp_state.csv", header = TRUE)

snp$Plan.Enrollment <- as.numeric(gsub(",", "", snp$Plan.Enrollment)) 

snp_state = aggregate(snp$Plan.Enrollment, list(state = snp$State.s.), na.rm = TRUE, FUN = sum)


snp_type = aggregate(snp$Plan.Enrollment, list(special = snp$Plan.Type ), na.rm = TRUE, FUN = sum)
barplot(snp_type$x, names =c("Empty", "HMO", "HMOPOS", "Local PPO", "Regoinal PPO"))

snp_SpecialNeeds = aggregate(snp$Plan.Enrollment, list(special = snp$Special.Needs.Plan.Type), na.rm = TRUE, FUN = sum)
barplot(snp_SpecialNeeds$x, names =c("Chronic or DisablinG", "Dual Eligible", "Institutional"))

snp_state_type = aggregate(snp$Plan.Enrollment, list(type = snp$Plan.Type, state = snp$State.s.), na.rm = TRUE, FUN = sum)
snp_state_type$sum <- rowSums(snp_state_type)





snp_state_SpecialNeeds = aggregate(snp$Plan.Enrollment, list(special = snp$Special.Needs.Plan.Type, state = snp$State.s.), na.rm = TRUE, FUN = sum)



