class Surah {
  int nomor;
  String namaLatin;
  int jumlahAyat;

  Surah(
      {required this.nomor, required this.namaLatin, required this.jumlahAyat});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
        nomor: json['nomor'],
        namaLatin: json['namaLatin'],
        jumlahAyat: json['jumlahAyat']);
  }
}
