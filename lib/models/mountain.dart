class Mountain {
  String? nama;
  String? bentuk;
  String? tinggiMeter;
  String? estimasiLetusanTerakhir;
  String? geolokasi;

  Mountain(
      {this.nama,
      this.bentuk,
      this.tinggiMeter,
      this.estimasiLetusanTerakhir,
      this.geolokasi});

  Mountain.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    bentuk = json['bentuk'];
    tinggiMeter = json['tinggi_meter'];
    estimasiLetusanTerakhir = json['estimasi_letusan_terakhir'].toString();
    geolokasi = json['geolokasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['bentuk'] = this.bentuk;
    data['tinggi_meter'] = this.tinggiMeter;
    data['estimasi_letusan_terakhir'] = this.estimasiLetusanTerakhir;
    data['geolokasi'] = this.geolokasi;
    return data;
  }
}
