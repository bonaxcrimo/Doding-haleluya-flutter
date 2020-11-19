class SongModel {
  int no;
  String kategori;
  String judul;
  String lirik;

  SongModel({this.no, this.kategori, this.judul, this.lirik});

  SongModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    kategori = json['kategori'];
    judul = json['judul'];
    lirik = json['lirik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['kategori'] = this.kategori;
    data['judul'] = this.judul;
    data['lirik'] = this.lirik;
    return data;
  }
}
