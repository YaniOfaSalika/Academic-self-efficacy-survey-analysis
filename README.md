# 📊 Estimasi Academic Self-Efficacy Mahasiswa Menggunakan Metode Two Stage Cluster Sampling

<p align="center">

![R](https://img.shields.io/badge/Language-R-blue?style=for-the-badge&logo=r)
![Sampling](https://img.shields.io/badge/Method-Two%20Stage%20Cluster%20Sampling-success?style=for-the-badge)
![Survey](https://img.shields.io/badge/Survey-Statistical%20Analysis-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

</p>

---

# 📖 Deskripsi Proyek

Repository ini mendokumentasikan proses analisis data survei mengenai **Academic Self-Efficacy** mahasiswa menggunakan bahasa pemrograman **R** dengan pendekatan **Two Stage Cluster Sampling**.

Analisis dilakukan mulai dari proses import data, data cleaning, pengujian kualitas instrumen, pembentukan bobot sampel, hingga estimasi parameter populasi menggunakan package **survey** pada R.

Repository ini disusun sebagai dokumentasi proses analisis data end-to-end sehingga setiap tahapan dapat direplikasi kembali.

---

# ⭐ Highlight Project

✔ Import data menggunakan **readxl**

✔ Data Cleaning

✔ Uji Validitas

✔ Uji Reliabilitas

✔ Statistik Deskriptif

✔ Kategorisasi Academic Self-Efficacy

✔ Visualisasi Data

✔ Perhitungan Bobot Sampling

✔ Survey Design

✔ Estimasi Mean Populasi

✔ Relative Standard Error (RSE)

✔ Confidence Interval

✔ Design Effect

✔ Analisis per Cluster

---

# 📑 Daftar Isi

- [Deskripsi Proyek](#-deskripsi-proyek)
- [Struktur Repository](#-struktur-repository)
- [Latar Belakang](#-latar-belakang)
- [Tujuan Penelitian](#-tujuan-penelitian)
- [Metodologi Penelitian](#-metodologi-penelitian)
- [Tools yang Digunakan](#-tools-yang-digunakan)
- [Alur Analisis](#-alur-analisis)
- [Analisis Data](#-analisis-data)
  - [1. Import Data](#1-import-data)
  - [2. Data Cleaning](#2-data-cleaning)
  - [3. Uji Validitas](#3-uji-validitas)
  - [4. Uji Reliabilitas](#4-uji-reliabilitas)
  - [5. Statistik Deskriptif](#5-statistik-deskriptif)
  - [6. Kategorisasi Academic Self-Efficacy](#6-kategorisasi-academic-self-efficacy)
  - [7. Visualisasi Data](#7-visualisasi-data)
  - [8. Pembobotan Sampel](#8-pembobotan-sampel)
  - [9. Survey Design](#9-survey-design)
  - [10. Estimasi Parameter](#10-estimasi-parameter)
  - [11. Analisis per Cluster](#11-analisis-per-cluster)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
- [Kesimpulan](#kesimpulan)
- [Rekomendasi](#rekomendasi)
- [Referensi](#referensi)

---

# 📂 Struktur Repository

```
Academic-Self-Efficacy-Two-Stage-Cluster-Sampling
│
├── README.md
├── Analisis.R
│
├── Data
│     └── Kuesioner Analisis.xlsx
│
├── Images
│     ├── Visualisasi Kategori.png
│     └── Visualisasi Cluster.png
│
├── Output
│     ├── Validitas.csv
│     ├── Reliabilitas.csv
│     ├── Statistik Deskriptif.csv
│     └── Analisis Cluster.csv
│
└── LICENSE
```

---

# 📚 Latar Belakang

Academic Self-Efficacy merupakan keyakinan individu terhadap kemampuannya dalam menyelesaikan tugas-tugas akademik secara efektif. Tingkat self-efficacy yang baik berperan penting dalam meningkatkan motivasi belajar, kemampuan memecahkan masalah, serta keberhasilan akademik mahasiswa.

Karena penelitian dilakukan terhadap sebagian anggota populasi, diperlukan metode sampling yang mampu menghasilkan estimasi yang representatif. Oleh karena itu digunakan **Two Stage Cluster Sampling**, yaitu teknik pengambilan sampel bertingkat yang memperhitungkan peluang terpilihnya setiap responden melalui proses pembobotan.

Melalui pendekatan ini diharapkan estimasi parameter populasi yang diperoleh memiliki tingkat ketelitian yang baik sehingga mampu menggambarkan kondisi populasi secara lebih akurat.

---

# 🎯 Tujuan Penelitian

Penelitian ini bertujuan untuk:

- Mengukur tingkat Academic Self-Efficacy mahasiswa.
- Menguji kualitas instrumen melalui uji validitas dan reliabilitas.
- Mengestimasi rata-rata Academic Self-Efficacy populasi.
- Menghitung kualitas estimasi menggunakan Standard Error (SE), Relative Standard Error (RSE), Confidence Interval (CI), dan Design Effect (DEFF).
- Mendeskripsikan perbedaan tingkat Academic Self-Efficacy pada setiap cluster.

---

# 🔬 Metodologi Penelitian

| Komponen | Keterangan |
|-----------|------------|
| Pendekatan | Kuantitatif |
| Metode | Survey |
| Teknik Sampling | Two Stage Cluster Sampling |
| Software | R Programming |
| Jumlah Sampel | 30 Responden |
| Jumlah Cluster | 3 Cluster |
| Jumlah Item | 12 Pernyataan |
| Skala Pengukuran | Likert 1–4 |

---

# 💻 Tools yang Digunakan

| Software | Fungsi |
|-----------|--------|
| R | Pengolahan Data |
| readxl | Import file Excel |
| dplyr | Manipulasi data |
| psych | Uji Validitas & Reliabilitas |
| survey | Analisis Survey Sampling |

---

# 🔄 Alur Analisis

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
Kategorisasi Data
      │
      ▼
Visualisasi
      │
      ▼
Pembobotan Sampling
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
Interpretasi Hasil
```

---

# 📊 Analisis Data

Pada bagian ini dijelaskan setiap tahapan analisis beserta tujuan, syntax R yang digunakan, serta penjelasan mengenai fungsi masing-masing kode sehingga proses analisis dapat direplikasi dengan mudah.

---

# 1. Import Data

## Tujuan

Tahap pertama bertujuan untuk mengimpor data hasil kuesioner ke dalam lingkungan kerja R serta memastikan struktur data telah terbaca dengan benar sebelum dilakukan analisis lebih lanjut.

## Penjelasan Syntax

Package **readxl** digunakan untuk membaca file Excel, sedangkan package **dplyr**, **psych**, dan **survey** digunakan untuk proses manipulasi data, pengujian instrumen, serta analisis survey sampling.

Setelah data berhasil diimpor, dilakukan pengecekan awal menggunakan fungsi `head()`, `str()`, dan `dim()` untuk melihat isi data, struktur variabel, serta dimensi dataset.

## Syntax

```r
library(readxl)
library(dplyr)
library(psych)
library(survey)

data <- read_excel("Kuesioner Analisis.xlsx")

head(data)

str(data)

dim(data)
```

---

# 2. Data Cleaning

## Tujuan

Data Cleaning dilakukan untuk memastikan kualitas data sebelum dianalisis. Tahapan ini meliputi pemeriksaan missing value dan data duplikat agar hasil analisis tidak dipengaruhi oleh kesalahan pencatatan data.

## Penjelasan Syntax

Fungsi `is.na()` digunakan untuk mendeteksi data yang kosong pada setiap variabel, sedangkan fungsi `duplicated()` digunakan untuk mengidentifikasi apakah terdapat responden yang tercatat lebih dari satu kali.

## Syntax

```r
colSums(is.na(data))

sum(duplicated(data))
```

---

# 3. Uji Validitas

## Tujuan

Uji validitas bertujuan untuk mengetahui apakah setiap butir pertanyaan mampu mengukur variabel Academic Self-Efficacy secara tepat.

## Penjelasan Syntax

Tahap pertama adalah menghitung skor total setiap responden menggunakan `rowSums()`. Selanjutnya dihitung korelasi Pearson antara skor setiap item dengan skor total menggunakan fungsi `cor()`. Nilai korelasi tersebut kemudian dibandingkan dengan nilai r tabel untuk menentukan valid atau tidaknya setiap item.

## Syntax

```r
item <- data %>%
select(P1:P12)

data$Total <- rowSums(item)

validitas <- data.frame(
Item=names(item),
r_hitung=sapply(item,function(x)
cor(x,data$Total))
)

validitas
```

---

# 4. Uji Reliabilitas

## Tujuan

Uji reliabilitas digunakan untuk mengukur tingkat konsistensi jawaban responden terhadap seluruh item kuesioner.

## Penjelasan Syntax

Reliabilitas dihitung menggunakan metode **Cronbach Alpha** melalui fungsi `alpha()` dari package **psych**. Semakin tinggi nilai Cronbach Alpha, maka semakin baik konsistensi internal instrumen penelitian.

## Syntax

```r
hasil_alpha <- alpha(item)

hasil_alpha
```

---

# 5. Statistik Deskriptif

## Tujuan

Statistik deskriptif memberikan gambaran umum mengenai distribusi skor Academic Self-Efficacy responden sebelum dilakukan estimasi populasi.

## Penjelasan Syntax

Fungsi-fungsi statistik digunakan untuk menghitung ukuran pemusatan dan penyebaran data, meliputi rata-rata, median, standar deviasi, nilai minimum, dan maksimum.

## Syntax

```r
summary(data$Total)

mean(data$Total)

median(data$Total)

sd(data$Total)

min(data$Total)

max(data$Total)
```

---

# Hasil dan Pembahasan

Tahap ini menyajikan hasil analisis data berdasarkan output yang diperoleh dari R Programming. Setiap hasil tidak hanya ditampilkan dalam bentuk tabel, tetapi juga disertai interpretasi sehingga dapat memberikan gambaran mengenai kondisi data, kualitas instrumen, serta hasil estimasi menggunakan metode *Two Stage Cluster Sampling*.

---

# 1. Hasil Uji Validitas

Uji validitas dilakukan menggunakan korelasi Pearson antara skor setiap item dengan skor total (*Corrected Item-Total Correlation*). Suatu item dinyatakan valid apabila nilai **r hitung > r tabel (0,361)** pada jumlah responden sebanyak 30 orang.

| Item | r Hitung | r Tabel | Keputusan |
|:---:|:-------:|:-------:|:---------:|
| P1 | 0.825 | 0.361 | Valid |
| P2 | 0.686 | 0.361 | Valid |
| P3 | 0.493 | 0.361 | Valid |
| P4 | 0.702 | 0.361 | Valid |
| P5 | 0.844 | 0.361 | Valid |
| P6 | 0.803 | 0.361 | Valid |
| P7 | 0.817 | 0.361 | Valid |
| P8 | 0.772 | 0.361 | Valid |
| P9 | 0.875 | 0.361 | Valid |
| P10 | 0.592 | 0.361 | Valid |
| P11 | 0.870 | 0.361 | Valid |
| P12 | 0.633 | 0.361 | Valid |

### Pembahasan

Hasil analisis menunjukkan bahwa seluruh item memiliki nilai **r hitung** yang lebih besar dibandingkan **r tabel (0,361)**. Dengan demikian, seluruh butir pernyataan dinyatakan **valid**, sehingga mampu merepresentasikan konstruk Academic Self-Efficacy yang ingin diukur.

Item **P9** memiliki nilai korelasi tertinggi sebesar **0,875**, yang menunjukkan bahwa item tersebut memiliki hubungan yang sangat kuat dengan skor total. Sebaliknya, item **P3** memiliki korelasi terendah sebesar **0,493**, namun nilainya masih berada di atas batas minimum sehingga tetap layak digunakan dalam analisis.

Secara keseluruhan, hasil ini menunjukkan bahwa instrumen yang digunakan telah memiliki kemampuan yang baik dalam mengukur tingkat Academic Self-Efficacy responden.

---

# 2. Hasil Uji Reliabilitas

Reliabilitas instrumen diukur menggunakan **Cronbach's Alpha** untuk mengetahui tingkat konsistensi internal antar item pertanyaan.

| Indikator | Nilai |
|-----------|------:|
| Cronbach's Alpha | **0.926** |
| Kategori | Sangat Reliabel |

### Pembahasan

Nilai **Cronbach's Alpha sebesar 0,926** menunjukkan bahwa instrumen memiliki tingkat reliabilitas yang sangat tinggi. Berdasarkan kriteria umum, nilai alpha di atas **0,90** menunjukkan bahwa seluruh item dalam kuesioner memiliki konsistensi internal yang sangat baik.

Hal ini mengindikasikan bahwa jawaban responden pada setiap item cenderung stabil dan saling mendukung dalam mengukur variabel Academic Self-Efficacy. Dengan demikian, instrumen penelitian dapat dipercaya dan layak digunakan untuk proses estimasi parameter populasi.

---

# 3. Statistik Deskriptif

Analisis statistik deskriptif dilakukan untuk memberikan gambaran umum mengenai distribusi skor Academic Self-Efficacy responden.

| Statistik | Nilai |
|-----------|------:|
| Jumlah Responden | 30 |
| Mean | 37.77 |
| Median | 36.50 |
| Standar Deviasi | 5.72 |
| Minimum | 27 |
| Maksimum | 48 |

### Pembahasan

Rata-rata skor Academic Self-Efficacy responden sebesar **37,77** dari rentang skor maksimum **48**. Nilai tersebut menunjukkan bahwa secara umum responden memiliki tingkat Academic Self-Efficacy yang relatif tinggi.

Nilai median sebesar **36,50** yang berada cukup dekat dengan rata-rata mengindikasikan bahwa distribusi data relatif seimbang dan tidak menunjukkan penyimpangan yang ekstrem.

Standar deviasi sebesar **5,72** menunjukkan adanya variasi skor antar responden, namun variasi tersebut masih tergolong moderat sehingga tidak terdapat perbedaan yang terlalu jauh dalam tingkat Academic Self-Efficacy antar mahasiswa.

---

# 4. Distribusi Kategori Academic Self-Efficacy

Untuk mempermudah interpretasi, skor total responden kemudian diklasifikasikan menjadi tiga kategori, yaitu **Rendah**, **Sedang**, dan **Tinggi**.

| Kategori | Frekuensi | Persentase |
|-----------|----------:|-----------:|
| Rendah | 0 | 0% |
| Sedang | 15 | 50% |
| Tinggi | 15 | 50% |

## Visualisasi

> 📌 **Tambahkan hasil visualisasi kategori Academic Self-Efficacy di bawah ini.**

<p align="center">
<img src="Output/Visualisasi Kategori.png" width="650">
</p>

### Pembahasan

Distribusi kategori menunjukkan bahwa **tidak terdapat responden yang berada pada kategori rendah**. Sebanyak **15 responden (50%)** berada pada kategori sedang, sedangkan **15 responden lainnya (50%)** berada pada kategori tinggi.

Hasil tersebut menunjukkan bahwa mayoritas mahasiswa memiliki keyakinan yang cukup baik terhadap kemampuan akademiknya. Tidak ditemukannya kategori rendah mengindikasikan bahwa responden secara umum memiliki kepercayaan diri yang positif dalam menyelesaikan aktivitas akademik.

Visualisasi diagram batang juga memperlihatkan distribusi yang seimbang antara kategori sedang dan tinggi sehingga menunjukkan bahwa tingkat Academic Self-Efficacy responden relatif baik.

---
---

# Insight Utama

Berdasarkan keseluruhan hasil analisis, diperoleh beberapa temuan utama sebagai berikut.

### 1. Kualitas Instrumen Sangat Baik

Seluruh butir pernyataan dinyatakan **valid**, serta memiliki nilai **Cronbach's Alpha sebesar 0,926**. Hal ini menunjukkan bahwa instrumen yang digunakan memiliki konsistensi internal yang sangat tinggi sehingga mampu mengukur variabel Academic Self-Efficacy secara baik.

---

### 2. Academic Self-Efficacy Mahasiswa Cenderung Tinggi

Rata-rata skor Academic Self-Efficacy yang diperoleh adalah **37,81** dari skor maksimum **48**.

Selain itu, distribusi kategori menunjukkan bahwa:

- 50% responden berada pada kategori **Sedang**
- 50% responden berada pada kategori **Tinggi**
- Tidak terdapat responden pada kategori **Rendah**

Temuan ini menunjukkan bahwa responden secara umum memiliki keyakinan yang cukup baik terhadap kemampuan akademiknya.

---

### 3. Hasil Estimasi Memiliki Presisi yang Baik

Nilai Relative Standard Error (RSE) sebesar **4,35%** berada jauh di bawah batas 25%.

Artinya, hasil estimasi yang diperoleh memiliki tingkat ketelitian yang baik sehingga dapat digunakan sebagai representasi populasi.

---

### 4. Terdapat Perbedaan Rata-rata antar Cluster

Analisis menunjukkan bahwa rata-rata Academic Self-Efficacy pada setiap cluster tidak sama.

| Cluster | Mean |
|---------|-----:|
|2024A|37.40|
|2024B|35.10|
|2025A|40.50|

Cluster **2025A** memiliki rata-rata tertinggi, sedangkan **2024B** memiliki rata-rata terendah.

Meskipun demikian, seluruh cluster masih menunjukkan tingkat Academic Self-Efficacy yang relatif baik.

---

# Tools yang Digunakan

Seluruh proses analisis dilakukan menggunakan bahasa pemrograman **R** dengan beberapa package berikut.

| Package | Fungsi |
|----------|---------|
| readxl | Mengimpor data Excel |
| dplyr | Manipulasi data |
| psych | Uji validitas dan reliabilitas |
| survey | Analisis survey kompleks dan estimasi parameter |

---

# Informasi Dataset

| Informasi | Nilai |
|-----------|-------|
| Jumlah Responden | 30 |
| Jumlah Variabel | 1 |
| Jumlah Indikator | 4 |
| Jumlah Item Pernyataan | 12 |
| Jumlah Cluster Sampel | 3 |
| Teknik Sampling | Two Stage Cluster Sampling |
| Skala Pengukuran | Likert 1–4 |

---

# Struktur Variabel

Variabel yang dianalisis dalam penelitian ini adalah **Academic Self-Efficacy** yang diukur menggunakan empat indikator.

| Variabel | Indikator | Item |
|-----------|-----------|------|
| Academic Self-Efficacy | Mastery Experience | P1–P3 |
| Academic Self-Efficacy | Vicarious Experience | P4–P6 |
| Academic Self-Efficacy | Social Persuasion | P7–P9 |
| Academic Self-Efficacy | Physiological & Emotional State | P10–P12 |

---

# Workflow Analisis

```text
Data Kuesioner
       │
       ▼
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
Kategorisasi Self-Efficacy
       │
       ▼
Pembobotan Two Stage Cluster Sampling
       │
       ▼
Survey Design
       │
       ▼
Estimasi Mean Populasi
       │
       ▼
Evaluasi Ketelitian Estimasi
       │
       ▼
Analisis per Cluster
       │
       ▼
Visualisasi Hasil
```

---

# Future Improvement

Pengembangan analisis yang dapat dilakukan pada penelitian selanjutnya antara lain:

- Menambah jumlah cluster sehingga representasi populasi menjadi lebih baik.
- Menggunakan ukuran sampel yang lebih besar.
- Menambahkan analisis inferensial, seperti uji beda rata-rata antar cluster.
- Mengembangkan model prediksi Academic Self-Efficacy menggunakan Machine Learning.
- Menggunakan teknik sampling lain sebagai pembanding, seperti Stratified Sampling atau Simple Random Sampling.

---

# Author

**Yani Ofa Salika**

Mahasiswa Program Studi Statistika yang memiliki ketertarikan pada bidang:

- Statistical Analysis
- Survey Sampling
- Data Science
- R Programming
- Machine Learning
- Data Visualization

GitHub ini dibuat sebagai dokumentasi sekaligus portofolio analisis data menggunakan **R Programming**.

---

# Referensi

1. Lohr, S. L. (2022). *Sampling: Design and Analysis* (3rd Edition). CRC Press.

2. Lumley, T. (2010). *Complex Surveys: A Guide to Analysis Using R*. Wiley.

3. Bandura, A. (1997). *Self-Efficacy: The Exercise of Control*. W.H. Freeman.

---

# Link Kuesioner

Tambahkan tautan Google Form atau instrumen penelitian pada bagian ini.

Contoh:

> https://forms.gle/xxxxxxxxxxxx

---

# Lisensi

Repository ini dibuat untuk tujuan pembelajaran, dokumentasi analisis data, serta pengembangan portofolio di bidang statistika dan data science.
