import 'package:flutter/material.dart';
import 'package:first/views/pages/home.dart';
import 'package:first/views/pages/kategori.dart';
import 'package:first/views/pages/kategoriDetail.dart';
import 'package:first/views/pages/songDetail.dart';
import 'package:first/views/pages/searchNumber.dart';
import 'package:first/views/pages/searchTitle.dart';
import 'package:first/views/pages/about.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomePage());
    case '/kategori':
      return MaterialPageRoute(builder: (_) => Kategori());
    case '/kategori-detail':
      return MaterialPageRoute(
          builder: (_) => KategoriDetail(
                kategoriName: settings.arguments,
              ));
    case '/song-detail':
      return MaterialPageRoute(
          builder: (_) => SongDetail(
                no: settings.arguments,
              ));
    case '/search-number':
      return MaterialPageRoute(builder: (_) => SearchNumber());
    case '/search-title':
      return MaterialPageRoute(builder: (_) => SearchTitle());
    case '/about':
      return MaterialPageRoute(builder: (_) => About());
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
