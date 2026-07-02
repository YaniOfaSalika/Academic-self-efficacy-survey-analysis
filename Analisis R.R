###########################################################
# PROJECT UAS TEKNIK SAMPLING
# Analisis Academic Self-Efficacy Mahasiswa
# Two Stage Cluster Sampling
###########################################################

#==========================================================
# 1. MEMANGGIL PACKAGE
#==========================================================

library(readxl)
library(dplyr)
library(psych)
library(survey)

#==========================================================
# 2. IMPORT DATA
#==========================================================

data <- read_excel("C:/Users/Yani Ofa Salika/Documents/Akademik/Semester 4/Tugas/Teknik Sampling/Project UAS/Kuesioner Analisis.xlsx")

# Melihat data
head(data)

# Struktur data
str(data)

# Dimensi data
dim(data)

#==========================================================
# 3. DATA CLEANING
#==========================================================

# Missing Value
colSums(is.na(data))

# Data Duplikat
sum(duplicated(data))

#==========================================================
# 4. MEMILIH ITEM KUESIONER
#==========================================================

item <- data %>%
  select(P1:P12)

#==========================================================
# 5. UJI VALIDITAS
#==========================================================

# Membuat skor total

data$Total <- rowSums(item)

# Korelasi Item Total

validitas <- data.frame(
  Item = names(item),
  r_hitung = sapply(item,
                    function(x)
                      cor(x,data$Total))
)

validitas

# Nilai r tabel (n=30)
r_tabel <- 0.361

validitas$Keputusan <-
  ifelse(validitas$r_hitung>r_tabel,
         "Valid",
         "Tidak Valid")

validitas

#==========================================================
# 6. UJI RELIABILITAS
#==========================================================

hasil_alpha <- alpha(item)

hasil_alpha

cat("/nCronbach Alpha =",
    round(hasil_alpha$total$raw_alpha,3))

#==========================================================
# 7. STATISTIK DESKRIPTIF
#==========================================================

summary(data$Total)

mean(data$Total)

median(data$Total)

sd(data$Total)

min(data$Total)

max(data$Total)

#==========================================================
# 8. KATEGORI ACADEMIC SELF-EFFICACY
#==========================================================

data$Kategori <- cut(
  data$Total,
  breaks=c(12,24,36,48),
  labels=c("Rendah",
           "Sedang",
           "Tinggi"),
  include.lowest=TRUE
)

table(data$Kategori)

prop.table(table(data$Kategori))*100

#==========================================================
# 9. VISUALISASI
#==========================================================

barplot(
  table(data$Kategori),
  col=c("tomato",
        "gold",
        "steelblue"),
  main="Kategori Academic Self-Efficacy",
  ylab="Frekuensi",
  xlab="Kategori"
)

#==========================================================
# 10. UKURAN POPULASI CLUSTER
#==========================================================

N_cluster <- c(
  
  "2024A"=25,
  
  "2024B"=28,
  
  "2025A"=32
  
)

#==========================================================
# 11. UKURAN SAMPEL TIAP CLUSTER
#==========================================================

n_cluster <- c(
  
  "2024A"=9,
  
  "2024B"=10,
  
  "2025A"=11
  
)

#==========================================================
# 12. MENGHITUNG BOBOT SAMPLING
#==========================================================

M <- 6

m <- 3

P_cluster <- m/M

data$bobot <- NA

for(i in 1:nrow(data)){
  
  kelas <- data$Kelas[i]
  
  P2 <- n_cluster[kelas]/N_cluster[kelas]
  
  Prob <- P_cluster*P2
  
  data$bobot[i] <- 1/Prob
  
}

head(data)

#==========================================================
# 13. MEMBUAT SURVEY DESIGN
#==========================================================

design <- svydesign(
  
  id=~Kelas,
  
  weights=~bobot,
  
  data=data
  
)

#==========================================================
# 14. ESTIMASI RATA-RATA POPULASI
#==========================================================

hasil <- svymean(
  
  ~Total,
  
  design,
  
  deff=TRUE
  
)

hasil

#==========================================================
# 15. STANDARD ERROR
#==========================================================

SE(hasil)

#==========================================================
# 16. CONFIDENCE INTERVAL 90%
#==========================================================

confint(
  
  hasil,
  
  level=0.90
  
)

#==========================================================
# 17. DESIGN EFFECT
#==========================================================

deff(hasil)

#==========================================================
# 18. RELATIVE STANDARD ERROR
#==========================================================

Mean <- coef(hasil)

StandarError <- SE(hasil)

RSE <- (StandarError/Mean)*100

RSE

if(RSE<25){
  
  cat("/nEstimasi Layak Digunakan")
  
}else{
  
  cat("/nEstimasi Tidak Layak")
  
}

#==========================================================
# 19. ANALISIS PER CLUSTER
#==========================================================

analisis_cluster <-
  
  data %>%
  
  group_by(Kelas) %>%
  
  summarise(
    
    Jumlah=n(),
    
    Rata_rata=mean(Total),
    
    Median=median(Total),
    
    SD=sd(Total),
    
    Minimum=min(Total),
    
    Maksimum=max(Total)
    
  )

analisis_cluster

#==========================================================
# 20. VISUALISASI RATA-RATA PER CLUSTER
#==========================================================

barplot(
  
  analisis_cluster$Rata_rata,
  
  names.arg=analisis_cluster$Kelas,
  
  col="skyblue",
  
  main="Rata-rata Academic Self-Efficacy tiap Cluster",
  
  ylab="Rata-rata"
  
)

#==========================================================
# 21. MENAMPILKAN HASIL
#==========================================================

cat("/n")
cat("=========================================/n")
cat("HASIL ANALISIS/n")
cat("=========================================/n")

cat("/nJumlah Responden : ",nrow(data),"/n")

cat("/nMean : ",round(coef(hasil),2))

cat("/nStandard Error : ",round(SE(hasil),3))

cat("/nDesign Effect : ",round(deff(hasil),3))

cat("/nRelative Standard Error : ",round(RSE,2),"%")

cat("/n")

print(confint(hasil,level=0.90))

cat("/n=========================================/n")
cat("Distribusi Kategori/n")
cat("=========================================/n")

print(table(data$Kategori))

cat("/n=========================================/n")
cat("Analisis per Cluster/n")
cat("=========================================/n")

print(analisis_cluster)

cat("/n=========================================/n")
cat("Selesai/n")
cat("=========================================/n")

