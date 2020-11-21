import 'package:first/models/KategoriModel.dart';
import 'package:first/models/SongModel.dart';
import 'package:first/utils/databaseHelper.dart';

class DodingDao {
  DatabaseHelper instance = new DatabaseHelper();
  Future<List<KategoriModel>> getAllKategori() async {
    var db = await instance.database;
    var res = await db.rawQuery(
        "select kategori as name,count(kategori) as jumlah from doding group by kategori");
    List<KategoriModel> list = res.isNotEmpty
        ? res.map((c) => KategoriModel.fromJson(c)).toList()
        : null;
    return list;
  }

  Future<List<SongModel>> getKategoriSong(String kategori) async {
    var db = await instance.database;
    var res = await db.rawQuery(
        "select * from doding where kategori = '$kategori' order by no");
    List<SongModel> list =
        res.isNotEmpty ? res.map((c) => SongModel.fromJson(c)).toList() : null;
    return list;
  }

  Future<SongModel> getSong(String no) async {
    var db = await instance.database;
    var res = await db.rawQuery("select * from doding where no = '$no'");
    SongModel song = res.isNotEmpty ? SongModel.fromJson(res.first) : null;
    return song;
  }

  Future<List<SongModel>> getSongByText(String txt, [int islirik = 0]) async {
    var db = await instance.database;
    String where = " where judul like  '%$txt%'  ";
    if (islirik == 1) {
      where += " or lirik like  '%$txt%'  ";
    }
    var res = await db
        .rawQuery("select no,judul,kategori from doding $where order by no");
    List<SongModel> list =
        res.isNotEmpty ? res.map((c) => SongModel.fromJson(c)).toList() : null;
    return list;
  }
}
