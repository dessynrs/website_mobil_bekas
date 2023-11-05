# Relational Database untuk Website Mobil Bekas
Disusun sebagai pelengkap tugas Relational Database (SQL) menggunakan PostgreSQL.


## Tujuan Pengerjaan Proyek
Membuat RDBMS sederhana untuk sebuah website mobil bekas, sebagai tugas akhir proyek Relational Database (SQL) - Sekolah Data Engineering Pacmann.

1. Design relasional database menggunakan PostgreSQL
2. Pengaplikasian bahasa pemrograman Python dan Library Faker untuk membuat dummy data
3. Pengaplikasian data retrieving melalui fungsi query SQL
4. Code Sharing dalam github

### Tools
* SQL
* VS Code
* Github

### Library Python
* Faker
* Tabulate
* Random
* Datetime
* Csv


## ERD Database
![alt text](https://github.com/dessynrs/website_mobil_bekas/blob/main/ERD/ERD_website_mobil_bekas_postgres.png)


## Deskripsi File 
File "1_website_schema.sql" berisi schema pembuatan database (tabel, relatinship, constraint)
File "2_dummy_data.ipynb" berisi file Python untuk pembuatan dummy data
File "3_insert_data.sql" berisi file untuk insert data ke database yang sudah dibuat
File "4_transactional_query.sql" berisi query untuk kepentingan transaksional atas dummy data yang sudah diinput
File "5_analytical_query.sql" berisi query untuk kepentingan analitikal atas dummy data yang sudah diinput

Folder "data_to_insert" berisi data dummy yang telah disiapkan untuk diinput ke dalam database
Folder "backup" berisi data backup per tanggal 5 November 2023
Folder "ERD" berisi data ERD yang telah digenerate dari PostgreSQL 

Untuk presentasi dapat dilihat pada link ini : [here](https://drive.google.com/file/d/100rGcV-U9N1tcW9DZ9SBkuN4-qkEJbJJ/view?usp=sharing)


## Saran Pengembangan
1. RDBMS yang dibuat ini masih sangat sederhana, terutama karena pembatasan proyek sedemikian sehingga transaksi dilakukan di luar platform yang sudah dibuat.
2. Penggunaan dummy data yang lebih bisa mewakili query transaksional dan analitikal sehingga lebih mendekati kondisi market.
