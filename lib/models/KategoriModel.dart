class KategoriModel {
  String _name;
  int _jumlah;

  KategoriModel(this._name, this._jumlah);
  KategoriModel.fromMap(dynamic obj) {
    this._name = obj['name'];
    this._jumlah = obj['jumlah'];
  }
  KategoriModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _jumlah = json['jumlah'];
  }

  String get name => _name;
  int get jumlah => _jumlah;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["jumlah"] = _jumlah;
    return map;
  }
}
