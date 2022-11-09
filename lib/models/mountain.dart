class Mountain {
  String nama;
  String bentuk;
  String tinggiMeter;
  String estimasiLetusanTerakhir;
  String geolokasi;

  Mountain(
      {required this.nama,
      required this.bentuk,
      required this.tinggiMeter,
      required this.estimasiLetusanTerakhir,
      required this.geolokasi});

  factory Mountain.fromJson(Map<String, dynamic> json) => Mountain(
        nama: json['nama'],
        bentuk: json['bentuk'],
        tinggiMeter: json['tinggi_meter'],
        estimasiLetusanTerakhir: json['estimasi_letusan_terakhir'].toString(),
        geolokasi: json['geolokasi'],
      );
  Map<String, dynamic> toJson() => {
        'nama': nama,
        'bentuk': bentuk,
        'tinggi_meter': tinggiMeter,
        'estimasi_letusan_terakhir': estimasiLetusanTerakhir,
        'geolokasi': geolokasi,
        // 'nama' = nama;
        // 'bentuk' = bentuk;
        // 'tinggi_meter' = tinggiMeter;
        // 'estimasi_letusan_terakhir' = estimasiLetusanTerakhir;
        // 'geolokasi' = geolokasi;
      };
}
