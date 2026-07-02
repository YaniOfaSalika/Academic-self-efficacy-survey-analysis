# Estimasi Rata-rata Academic Self-Efficacy Mahasiswa Program Studi S1 Statistika Universitas Mataram Menggunakan Two-Stage Cluster Sampling
 
<p align="center">

![R](https://img.shields.io/badge/Language-R-276DC3?logo=r)
![Method](https://img.shields.io/badge/Two--Stage%20Cluster%20Sampling-success)
![Survey](https://img.shields.io/badge/Analysis-Survey-orange)

</p>

---
 
# Deskripsi Proyek
 
Repository ini mendokumentasikan proses analisis survei mengenai **tingkat Academic Self-Efficacy mahasiswa Program Studi S1 Statistika Universitas Mataram** menggunakan pendekatan **Cluster Sampling Dua Tahap (Two-Stage Cluster Sampling)**.
 
Analisis dilakukan menggunakan bahasa pemrograman **R**, meliputi pengolahan data, pengujian validitas dan reliabilitas instrumen, data cleaning, kategorisasi skor, pembobotan sampel, serta evaluasi kualitas estimasi melalui perhitungan **Standard Error (SE)**, **Confidence Interval (CI)**, **Design Effect (DEFF)**, dan **Relative Standard Error (RSE)**.
 
Repository ini bertujuan menyajikan alur analisis yang terdokumentasi secara sistematis dan transparan sehingga dapat digunakan sebagai referensi dalam penerapan metode survei dan analisis data berbasis **Cluster Sampling**.
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## Struktur Repository
 
```text
Academic-Self-Efficacy-Two-Stage-Cluster-Sampling/
├── README.md
├── Analisis.R
├── Data/
│   └── Kuesioner Analisis.xlsx
├── Output/
│   ├── Visualisasi Kategori.png
│   └── Visualisasi Cluster.png
└── Dokumentasi/
```
 
- **README.md** : Dokumentasi lengkap proyek.
- **Analisis.R** : Seluruh script analisis menggunakan R, dari import data hingga estimasi.
- **Data/** : Berisi data mentah hasil survei (kuesioner).
- **Output/** : Berisi hasil visualisasi (grafik kategori dan grafik per cluster).
- **Dokumentasi/** : Berisi dokumentasi pendukung penelitian (kuesioner, desain sampling, dll).
<h1 id="daftar-isi">Daftar Isi</h1>
 
- [Deskripsi Proyek](#deskripsi-proyek)
- [Struktur Repository](#struktur-repository)
- [Latar Belakang](#latar-belakang)
- [Tujuan Penelitian](#tujuan-penelitian)
- [Metodologi Penelitian](#metodologi-penelitian)
- [Alur Analisis](#alur-analisis)
- [Analisis Data](#analisis-data)
  - [1. Import Data](#1-import-data)
  - [2. Data Cleaning](#2-data-cleaning)
  - [3. Uji Validitas](#3-uji-validitas)
  - [4. Uji Reliabilitas](#4-uji-reliabilitas)
  - [5. Statistik Deskriptif](#5-statistik-deskriptif)
  - [6. Kategorisasi Academic Self-Efficacy](#6-kategorisasi-academic-self-efficacy)
  - [7. Pembobotan Sampel](#7-pembobotan-sampel)
  - [8. Survey Design dan Estimasi Parameter](#8-survey-design-dan-estimasi-parameter)
  - [9. Analisis per Cluster](#9-analisis-per-cluster)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
- [Kesimpulan](#kesimpulan)
- [Keterbatasan Penelitian](#keterbatasan-penelitian)
- [Rekomendasi](#rekomendasi)
- [Referensi](#referensi)
- [Link Kuesioner](#link-kuesioner)
  
---
 
# Latar Belakang
 
**Academic Self-Efficacy** merupakan keyakinan mahasiswa terhadap kemampuan dirinya dalam menyelesaikan tugas-tugas akademik, memahami materi perkuliahan, dan menghadapi evaluasi akademik dengan baik. Tingkat self-efficacy yang baik berkaitan erat dengan motivasi belajar, ketekunan, serta kemampuan mahasiswa dalam menghadapi tantangan selama proses perkuliahan.
 
Bagi mahasiswa Program Studi Statistika, yang perkuliahannya sarat dengan pengolahan data, analisis kuantitatif, dan pemrograman, tingkat keyakinan diri terhadap kemampuan akademik menjadi faktor yang relevan untuk diukur, mengingat besarnya tuntutan penyelesaian tugas secara mandiri.
 
Penelitian ini menggunakan pendekatan survei dengan desain **Cluster Sampling Dua Tahap** agar diperoleh estimasi rata-rata Academic Self-Efficacy yang representatif terhadap populasi mahasiswa Program Studi S1 Statistika Universitas Mataram.
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Tujuan Penelitian
 
Penelitian ini bertujuan untuk:
 
- Mengukur tingkat Academic Self-Efficacy mahasiswa.
- Menguji validitas dan reliabilitas instrumen penelitian.
- Melakukan proses data cleaning sebelum analisis.
- Mengkategorikan tingkat Academic Self-Efficacy mahasiswa (Rendah, Sedang, Tinggi).
- Menghitung bobot sampel berdasarkan desain Cluster Sampling Dua Tahap.
- Mengestimasi rata-rata Academic Self-Efficacy terbobot pada tingkat populasi.
- Menghitung Standard Error (SE), Confidence Interval (CI) 90%, Design Effect (DEFF), dan Relative Standard Error (RSE) sebagai indikator kualitas estimasi.
- Membandingkan tingkat Academic Self-Efficacy antar cluster (kelas).
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Metodologi Penelitian
 
Penelitian ini merupakan penelitian survei kuantitatif yang bertujuan mengestimasi tingkat Academic Self-Efficacy mahasiswa Program Studi S1 Statistika Universitas Mataram. Pengambilan sampel dilakukan menggunakan metode **Cluster Sampling Dua Tahap (Two-Stage Cluster Sampling)**, dengan kelas sebagai unit klaster pada tahap pertama.
 
Populasi penelitian terdiri atas **6 kelas** mahasiswa aktif Program Studi Statistika. Pada tahap pertama, **3 kelas** dipilih secara acak (2024A, 2024B, dan 2025A) sebagai klaster sampel. Pada tahap kedua, dilakukan pengambilan sampel mahasiswa pada setiap klaster terpilih secara acak dengan alokasi proporsional terhadap ukuran kelas, sehingga diperoleh total **30 responden**. Pengumpulan data dilakukan menggunakan kuesioner skala Likert 1–4 yang terdiri atas 12 butir pernyataan mengenai Academic Self-Efficacy.
 
| Komponen | Keterangan |
|---|---|
| Metode | Survey |
| Pendekatan | Kuantitatif |
| Sampling | Two Stage Cluster Sampling |
| Software | R Programming |
| Jumlah Cluster Populasi (M) | 6 kelas |
| Jumlah Cluster Terpilih (m) | 3 kelas (2024A, 2024B, 2025A) |
| Jumlah Sampel | 30 Responden |
| Jumlah Item | 12 Pernyataan |
| Skala | Likert 1–4 |
 
Seluruh proses pengolahan data dilakukan menggunakan bahasa pemrograman R pada lingkungan RStudio. Tahapan analisis meliputi import data, data cleaning (pemeriksaan missing value dan data duplikat), uji validitas (korelasi item-total), uji reliabilitas (Cronbach's Alpha), kategorisasi skor, pembobotan sampel berdasarkan desain survei, pembentukan survey design, serta analisis kualitas estimasi melalui perhitungan Standard Error (SE), Confidence Interval (CI) 90%, Design Effect (DEFF), dan Relative Standard Error (RSE).
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Alur Analisis
 
```text
Import Data
      │
      ▼
Data Cleaning
      │
      ▼
Uji Validitas
      │
      ▼
Uji Reliabilitas
      │
      ▼
Statistik Deskriptif
      │
      ▼
Kategorisasi
      │
      ▼
Pembobotan Sampel
      │
      ▼
Survey Design
      │
      ▼
Estimasi Mean Populasi
      │
      ▼
Analisis per Cluster
      │
      ▼
Visualisasi
```
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Analisis Data
 
Analisis data dilakukan menggunakan bahasa pemrograman **R** melalui beberapa tahapan berikut. Seluruh syntax dapat dilihat lengkap di file [`Analisis.R`](Analisis.R).
 
---
 
## 1. Import Data
 
### Tujuan
 
Tahap ini bertujuan mengimpor data kuesioner ke dalam R serta memastikan struktur data telah sesuai sebelum dilakukan analisis lebih lanjut.
 
### Sintaks
 
```r
library(readxl)
library(dplyr)
library(psych)
library(survey)
 
data <- read_excel("Data/Kuesioner Analisis.xlsx")
 
head(data)
str(data)
dim(data)
```
 
### Keterangan
 
- `read_excel()` digunakan untuk mengimpor data survei dari file Excel.
- `head()` digunakan untuk melihat beberapa baris pertama data.
- `str()` digunakan untuk memeriksa struktur dan tipe data setiap kolom.
- `dim()` digunakan untuk mengetahui jumlah baris dan kolom data (30 responden × 14 variabel).
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 2. Data Cleaning
 
### Tujuan
 
Data diperiksa untuk memastikan tidak terdapat *missing value* maupun data duplikat yang dapat memengaruhi hasil analisis.
 
### Sintaks
 
```r
colSums(is.na(data))
sum(duplicated(data))
```
 
### Keterangan
 
- `colSums(is.na(data))` digunakan untuk menghitung jumlah data yang hilang pada setiap kolom.
- `sum(duplicated(data))` digunakan untuk menghitung jumlah baris data yang terduplikasi.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 3. Uji Validitas
 
### Tujuan
 
Uji validitas dilakukan untuk mengetahui apakah setiap butir pernyataan mampu mengukur konstruk Academic Self-Efficacy, menggunakan korelasi Pearson antara skor item dengan skor total.
 
### Sintaks
 
```r
item <- data %>%
  select(P1:P12)
 
data$Total <- rowSums(item)
 
validitas <- data.frame(
  Item = names(item),
  r_hitung = sapply(item, function(x) cor(x, data$Total))
)
 
r_tabel <- 0.361
 
validitas$Keputusan <- ifelse(validitas$r_hitung > r_tabel, "Valid", "Tidak Valid")
 
validitas
```
 
### Keterangan
 
- `select(P1:P12)` digunakan untuk memilih 12 butir pernyataan penelitian.
- `rowSums(item)` digunakan untuk menghitung skor total setiap responden.
- `sapply()` bersama `cor()` digunakan untuk menghitung korelasi Pearson antara tiap item dengan skor total.
- `r_tabel` merupakan nilai kritis korelasi untuk n = 30 pada taraf signifikansi 5% (0.361).
- `ifelse()` digunakan untuk menentukan valid atau tidaknya setiap item berdasarkan perbandingan r hitung terhadap r tabel.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 4. Uji Reliabilitas
 
### Tujuan
 
Uji reliabilitas dilakukan untuk mengukur konsistensi internal instrumen menggunakan koefisien **Cronbach's Alpha**.
 
### Sintaks
 
```r
hasil_alpha <- alpha(item)
 
hasil_alpha
 
cat("\nCronbach Alpha =", round(hasil_alpha$total$raw_alpha, 3))
```
 
### Keterangan
 
- `alpha()` dari package **psych** digunakan untuk menghitung nilai Cronbach's Alpha beserta statistik pendukungnya (item-total correlation, alpha jika item dihapus, dsb).
- `hasil_alpha$total$raw_alpha` digunakan untuk mengambil nilai Cronbach's Alpha secara keseluruhan.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 5. Statistik Deskriptif
 
### Tujuan
 
Memberikan gambaran umum distribusi skor total Academic Self-Efficacy sebelum dilakukan pembobotan.
 
### Sintaks
 
```r
summary(data$Total)
mean(data$Total)
median(data$Total)
sd(data$Total)
min(data$Total)
max(data$Total)
```
 
### Keterangan
 
- `summary()` menampilkan ringkasan lima angka (minimum, kuartil 1, median, kuartil 3, maksimum) beserta rata-rata.
- `mean()`, `median()`, `sd()`, `min()`, dan `max()` digunakan untuk menghitung statistik deskriptif skor total secara individual.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 6. Kategorisasi Academic Self-Efficacy
 
### Tujuan
 
Mengelompokkan skor total responden menjadi tiga kategori: Rendah, Sedang, dan Tinggi.
 
### Sintaks
 
```r
data$Kategori <- cut(
  data$Total,
  breaks = c(12, 24, 36, 48),
  labels = c("Rendah", "Sedang", "Tinggi"),
  include.lowest = TRUE
)
 
table(data$Kategori)
prop.table(table(data$Kategori)) * 100
 
png("Output/Visualisasi Kategori.png", width = 600, height = 500)
barplot(
  table(data$Kategori),
  col = c("tomato", "gold", "steelblue"),
  main = "Kategori Academic Self-Efficacy",
  ylab = "Frekuensi",
  xlab = "Kategori"
)
dev.off()
```
 
### Keterangan
 
- `cut()` digunakan untuk mengelompokkan skor total ke dalam 3 kategori berdasarkan rentang skor minimum (12) hingga maksimum (48) dari 12 item skala 1–4.
- `table()` dan `prop.table()` digunakan untuk menghitung frekuensi dan persentase tiap kategori.
- `barplot()` digunakan untuk memvisualisasikan distribusi kategori, disimpan langsung ke folder `Output/` menggunakan `png()` dan `dev.off()`.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 7. Pembobotan Sampel
 
### Tujuan
 
Pembobotan dilakukan untuk memperoleh bobot setiap responden berdasarkan peluang pemilihannya pada desain **Cluster Sampling Dua Tahap**, sehingga hasil estimasi dapat mewakili populasi.
 
### Sintaks
 
```r
N_cluster <- c("2024A" = 25, "2024B" = 28, "2025A" = 32)
n_cluster <- c("2024A" = 9,  "2024B" = 10, "2025A" = 11)
 
M <- 6   # jumlah klaster populasi
m <- 3   # jumlah klaster terpilih
 
P_cluster <- m / M
 
data$bobot <- NA
 
for (i in 1:nrow(data)) {
  kelas <- data$Kelas[i]
  P2 <- n_cluster[kelas] / N_cluster[kelas]
  Prob <- P_cluster * P2
  data$bobot[i] <- 1 / Prob
}
 
head(data)
```
 
### Keterangan
 
- `N_cluster` menyatakan jumlah populasi mahasiswa pada masing-masing kelas terpilih.
- `n_cluster` menyatakan jumlah sampel yang diambil pada masing-masing kelas terpilih.
- `M` dan `m` menyatakan jumlah klaster populasi dan klaster yang dipilih pada tahap pertama.
- `P_cluster` merupakan peluang terpilihnya klaster pada tahap pertama (m/M).
- `P2` merupakan peluang terpilihnya mahasiswa dalam klaster pada tahap kedua (n_i/N_i).
- `Prob` merupakan peluang gabungan (tahap 1 × tahap 2).
- `data$bobot` merupakan bobot akhir tiap responden (1/peluang gabungan).
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 8. Survey Design dan Estimasi Parameter
 
### Tujuan
 
Tahap ini bertujuan membentuk desain survei berbobot serta mengestimasi rata-rata Academic Self-Efficacy populasi beserta ukuran ketelitian estimasi (SE, CI, DEFF, RSE).
 
### Sintaks
 
```r
design <- svydesign(
  id = ~Kelas,
  weights = ~bobot,
  data = data
)
 
hasil <- svymean(~Total, design, deff = TRUE)
hasil
 
SE(hasil)
confint(hasil, level = 0.90)
deff(hasil)
 
Mean <- coef(hasil)
StandarError <- SE(hasil)
RSE <- (StandarError / Mean) * 100
RSE
 
if (RSE < 25) {
  cat("\nEstimasi Layak Digunakan")
} else {
  cat("\nEstimasi Tidak Layak")
}
```
 
### Keterangan
 
- `svydesign()` digunakan untuk membentuk desain survei, dengan `id = ~Kelas` menandakan klaster (kelas) sebagai unit sampling utama dan `weights = ~bobot` sebagai bobot akhir tiap responden.
- `svymean()` digunakan untuk menghitung estimasi rata-rata terbobot, dengan `deff = TRUE` untuk turut menghitung Design Effect.
- `SE()` digunakan untuk mengambil nilai Standard Error.
- `confint()` digunakan untuk menghitung Confidence Interval, di sini pada tingkat kepercayaan **90%**.
- `deff()` digunakan untuk mengambil nilai Design Effect.
- `RSE` (Relative Standard Error) dihitung sebagai (SE/Mean) × 100%, dengan ambang kelayakan RSE < 25%.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
## 9. Analisis per Cluster
 
### Tujuan
 
Membandingkan karakteristik Academic Self-Efficacy (rata-rata, median, standar deviasi, nilai minimum dan maksimum) pada setiap cluster (kelas) terpilih.
 
### Sintaks
 
```r
analisis_cluster <- data %>%
  group_by(Kelas) %>%
  summarise(
    Jumlah = n(),
    Rata_rata = mean(Total),
    Median = median(Total),
    SD = sd(Total),
    Minimum = min(Total),
    Maksimum = max(Total)
  )
 
analisis_cluster
 
png("Output/Visualisasi Cluster.png", width = 600, height = 500)
barplot(
  analisis_cluster$Rata_rata,
  names.arg = analisis_cluster$Kelas,
  col = "skyblue",
  main = "Rata-rata Academic Self-Efficacy tiap Cluster",
  ylab = "Rata-rata"
)
dev.off()
```
 
### Keterangan
 
- `group_by(Kelas)` mengelompokkan data berdasarkan kelas (cluster).
- `summarise()` menghitung ringkasan statistik (jumlah, rata-rata, median, SD, minimum, maksimum) untuk setiap cluster.
- `barplot()` memvisualisasikan perbandingan rata-rata skor Academic Self-Efficacy antar cluster, disimpan ke `Output/`.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Hasil dan Pembahasan
 
Bagian ini menyajikan hasil analisis berdasarkan tahapan yang telah dilakukan, mulai dari pengujian instrumen, data cleaning, kategorisasi, pembobotan sampel, hingga evaluasi kualitas estimasi menggunakan metode **Two-Stage Cluster Sampling**.
 
---
 
## Hasil Uji Validitas
 
| Item | r Hitung | Keputusan |
|:---:|:---:|:---:|
| P1  | 0.825 | Valid |
| P2  | 0.686 | Valid |
| P3  | 0.493 | Valid |
| P4  | 0.702 | Valid |
| P5  | 0.844 | Valid |
| P6  | 0.803 | Valid |
| P7  | 0.817 | Valid |
| P8  | 0.772 | Valid |
| P9  | 0.875 | Valid |
| P10 | 0.592 | Valid |
| P11 | 0.870 | Valid |
| P12 | 0.633 | Valid |
 
### Interpretasi
 
Seluruh item memiliki nilai korelasi (r hitung) lebih besar daripada r tabel (0.361 untuk n = 30), dengan rentang nilai antara **0.493 hingga 0.875**. Dengan demikian, seluruh 12 butir pernyataan dinyatakan **valid** dan layak digunakan dalam penelitian untuk mengukur konstruk Academic Self-Efficacy.
 
---
 
## Hasil Uji Reliabilitas
 
| Cronbach's Alpha | Kriteria | Keputusan |
|:---:|:---:|:---:|
| **0.926** | ≥ 0.70 | Sangat Reliabel |
 
### Interpretasi
 
Nilai **Cronbach's Alpha sebesar 0.926** menunjukkan bahwa instrumen memiliki tingkat konsistensi internal yang sangat tinggi. Nilai *item-total correlation* (r.drop) pada seluruh item juga berada di atas 0.4, sehingga tidak ada item yang perlu dihapus. Instrumen dinyatakan **reliabel** dan layak digunakan tanpa revisi.
 
---
 
## Hasil Data Cleaning
 
| Pemeriksaan | Hasil |
|---|---|
| Jumlah Responden | 30 |
| Missing Value | 0 |
| Data Duplikat | 0 |
| Data Siap Dianalisis | 30 |
 
### Interpretasi
 
Proses data cleaning menunjukkan bahwa tidak terdapat *missing value* maupun data duplikat pada dataset. Dengan demikian, seluruh 30 data responden memenuhi syarat untuk dianalisis lebih lanjut.
 
---
 
## Hasil Statistik Deskriptif dan Kategorisasi
 
| Statistik | Nilai |
|---|---|
| Mean | 37.77 |
| Median | 36.50 |
| SD | 5.72 |
| Minimum | 27 |
| Maksimum | 48 |
 
| Kategori | Frekuensi | Persentase |
|---|:---:|:---:|
| Rendah | 0  | 0%  |
| Sedang | 15 | 50% |
| Tinggi | 15 | 50% |
 
<img width="545" height="454" alt="Screenshot 2026-07-02 162556" src="https://github.com/user-attachments/assets/5f2e60ee-047f-492f-9f0b-0d77956aa8f7" />
 
### Interpretasi
 
Rata-rata skor Academic Self-Efficacy responden (sebelum pembobotan) berada pada nilai **37.77** dari rentang skor 12–48, dengan variasi data yang relatif sedang (SD = 5.72). Tidak terdapat responden pada kategori rendah; sebanyak **15 responden (50%)** berada pada kategori sedang dan **15 responden (50%)** berada pada kategori tinggi, menunjukkan bahwa secara umum mahasiswa memiliki tingkat Academic Self-Efficacy yang cukup baik hingga tinggi.
 
---
 
## Hasil Pembobotan Sampel
 
| Cluster | N_i (Populasi) | n_i (Sampel) | Peluang Tahap 1 | Peluang Tahap 2 | Peluang Total | Bobot Akhir |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| 2024A | 25 | 9  | 0.500 | 0.360 | 0.180 | 5.556 |
| 2024B | 28 | 10 | 0.500 | 0.357 | 0.179 | 5.600 |
| 2025A | 32 | 11 | 0.500 | 0.344 | 0.172 | 5.818 |
 
### Interpretasi
 
Bobot akhir tiap responden berkisar antara **5.556 hingga 5.818**, artinya setiap responden pada sampel mewakili sekitar 5 hingga 6 mahasiswa dalam populasi berdasarkan desain Cluster Sampling Dua Tahap. Karena seluruh responden terpilih berhasil diwawancarai (response rate 100%), tidak ada penyesuaian non-respon terhadap bobot dasar.
 
---
 
## Hasil Analisis Kualitas Estimasi
 
| Indikator | Nilai |
|---|---:|
| Estimasi Rata-rata (Total) | **37.81** |
| Standard Error (SE) | **1.643** |
| Design Effect (DEFF) | **3.002** |
| Confidence Interval 90% | **35.10 – 40.51** |
| Relative Standard Error (RSE) | **4.35%** |
| Kelayakan (RSE < 25%) | **Layak Digunakan** |
 
### Interpretasi
 
Estimasi rata-rata skor total Academic Self-Efficacy populasi sebesar **37.81** menunjukkan bahwa secara umum mahasiswa Program Studi S1 Statistika Universitas Mataram memiliki tingkat keyakinan akademik yang cukup baik.
 
Nilai **Standard Error (SE) sebesar 1.643** menunjukkan simpangan estimasi yang relatif kecil, sehingga estimasi cukup stabil. Interval kepercayaan **90%** berada pada rentang **35.10 hingga 40.51**, yang berarti rata-rata populasi diperkirakan berada dalam interval tersebut.
 
Nilai **Relative Standard Error (RSE) sebesar 4.35%** berada jauh di bawah batas 25%, sehingga estimasi yang dihasilkan memiliki tingkat ketelitian yang sangat baik dan layak digunakan sebagai dasar penarikan kesimpulan.
 
Nilai **Design Effect (DEFF) sebesar 3.002** menunjukkan bahwa varians estimasi pada desain Cluster Sampling Dua Tahap ini kurang lebih 3 kali lebih besar dibandingkan jika seluruh 30 sampel diambil secara Simple Random Sampling (SRS) murni. Hal ini merupakan konsekuensi wajar dari homogenitas karakteristik mahasiswa dalam satu kelas (*intra-cluster correlation*) — mahasiswa dalam kelas yang sama cenderung memiliki tingkat Academic Self-Efficacy yang mirip. Meski demikian, karena nilai RSE tetap jauh di bawah ambang batas, estimasi tetap layak digunakan sebagai gambaran karakteristik populasi.
 
---
 
## Hasil Analisis per Cluster
 
| Cluster | Jumlah | Rata-rata | Median | SD | Minimum | Maksimum |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| 2024A | 9  | 37.4 | 36   | 5.81 | 29 | 48 |
| 2024B | 10 | 35.1 | 35.5 | 4.56 | 27 | 44 |
| 2025A | 11 | 40.5 | 39   | 5.82 | 32 | 48 |
 
<img width="539" height="432" alt="Screenshot 2026-07-02 162623" src="https://github.com/user-attachments/assets/57fdd72f-aa73-415d-8c2f-fff480f98a10" />

### Interpretasi
 
Cluster **2025A** memiliki rata-rata Academic Self-Efficacy tertinggi (**40.5**), diikuti oleh **2024A** (**37.4**), sedangkan **2024B** memiliki rata-rata terendah (**35.1**). Perbedaan ini mengindikasikan adanya variasi tingkat Academic Self-Efficacy antar cluster, meskipun seluruh cluster masih berada pada kategori sedang hingga tinggi.
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Kesimpulan
 
Berdasarkan hasil analisis menggunakan metode **Cluster Sampling Dua Tahap**, diperoleh beberapa kesimpulan sebagai berikut.
 
1. Seluruh 12 butir pernyataan dinyatakan **valid** berdasarkan hasil uji korelasi item-total (r hitung > r tabel).
2. Instrumen penelitian memiliki tingkat reliabilitas yang sangat tinggi dengan nilai **Cronbach's Alpha sebesar 0.926**.
3. Hasil data cleaning menunjukkan tidak terdapat data hilang maupun data duplikat, sehingga seluruh 30 data layak dianalisis.
4. Tidak terdapat mahasiswa pada kategori rendah; masing-masing 50% mahasiswa berada pada kategori sedang dan tinggi.
5. Bobot akhir tiap responden berkisar antara 5.556–5.818, sesuai peluang pemilihan pada desain Cluster Sampling Dua Tahap.
6. Estimasi rata-rata Academic Self-Efficacy mahasiswa Program Studi S1 Statistika Universitas Mataram sebesar **37.81** dengan Standard Error sebesar **1.643** dan Confidence Interval 90% sebesar **35.10–40.51**.
7. Nilai RSE sebesar **4.35%** menunjukkan bahwa estimasi memiliki tingkat presisi yang sangat baik dan layak digunakan.
8. Cluster **2025A** memiliki rata-rata Academic Self-Efficacy tertinggi dibandingkan cluster lainnya.
Secara keseluruhan, penelitian ini menunjukkan bahwa tingkat Academic Self-Efficacy mahasiswa Program Studi S1 Statistika Universitas Mataram berada pada kategori sedang hingga tinggi. Pendekatan Cluster Sampling Dua Tahap mampu menghasilkan estimasi yang representatif terhadap populasi dengan kualitas estimasi yang baik.
 
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Keterbatasan Penelitian
 
- Hanya 3 dari 6 kelas populasi yang terpilih sebagai cluster pada tahap pertama, sehingga representasi populasi belum sepenuhnya optimal.
- Ukuran sampel relatif kecil (n = 30), sehingga hasil estimasi tetap rentan terhadap variasi sampling meskipun RSE menunjukkan hasil yang baik.
- Nilai Design Effect (3.002) menunjukkan efisiensi desain cluster lebih rendah dibandingkan SRS murni, meskipun desain ini lebih efisien dari sisi biaya dan waktu pengumpulan data di lapangan.
- Uji validitas dan reliabilitas pada dokumentasi ini dihitung dari data 30 sampel utama sebagai indikasi konsistensi internal; idealnya kedua uji tersebut dilakukan terlebih dahulu pada data uji coba (*pilot test*) yang terpisah dari sampel utama.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Rekomendasi
 
- Menambah jumlah cluster yang dipilih pada tahap pertama agar representasi populasi semakin baik dan Design Effect dapat ditekan.
- Melibatkan jumlah responden yang lebih besar pada penelitian berikutnya untuk memperkecil Standard Error.
- Melakukan uji coba instrumen (*pilot test*) pada responden di luar sampel sebelum pengumpulan data utama, sesuai prosedur baku penelitian survei.
- Menambahkan analisis inferensial (misalnya uji beda rata-rata antar cluster) untuk memperkuat kesimpulan mengenai variasi Academic Self-Efficacy antar kelas.
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Referensi
 
1. Lohr, S. L. (2022). *Sampling: Design and Analysis* (3rd ed.). CRC Press. ISBN: 9781032244287.
2. Lumley, T. (2010). *Complex Surveys: A Guide to Analysis Using R*. John Wiley & Sons. https://doi.org/10.1002/9780470580063
3. R Core Team. (2025). *R: A Language and Environment for Statistical Computing*. R Foundation for Statistical Computing. https://www.R-project.org/
4. Revelle, W. (2025). *psych: Procedures for Psychological, Psychometric, and Personality Research* (R package). Northwestern University. https://CRAN.R-project.org/package=psych
5. Lumley, T. (2024). *survey: Analysis of Complex Survey Samples* (R package). https://CRAN.R-project.org/package=survey
6. Wickham, H., & Bryan, J. (2025). *readxl: Read Excel Files* (R package). https://CRAN.R-project.org/package=readxl
<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---
 
# Link Kuesioner
 
*https://forms.gle/GtsaKScq37kgPQzm6*
