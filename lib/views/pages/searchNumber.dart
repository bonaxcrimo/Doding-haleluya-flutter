import 'package:first/configuration.dart';
import 'package:first/dao/dodingDao.dart';
import 'package:first/views/components/textView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

class SearchNumber extends StatefulWidget {
  @override
  _SearchNumberState createState() => _SearchNumberState();
}

class _SearchNumberState extends State<SearchNumber> {
  DodingDao _query = new DodingDao();
  String _judul = "";
  String _kategori = "";
  String _lirik = "";
  String _no = "";
  TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cari berdasarkan nomor",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: _judul == ""
          ? null
          : FloatingActionButton(
              onPressed: () {
                final RenderBox box = context.findRenderObject();
                Share.share(_lirik.replaceAll('<br>', '\n'),
                    subject: '$_no. $_judul',
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
              child: Icon(Icons.share),
              backgroundColor: colorPrimaryDark,
            ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OutlineTextView(
              controller: _controller,
              customFormat: [CustomRangeTextInputFormatter()],
              hintText: "Masukkan No dan Enter",
              type: TextInputType.number,
              borderColor: colorPrimaryDark,
              customFunction: (val) {
                _query.getSong(val).then((value) => {
                      setState(() {
                        _no = val;
                        _judul = '$val. ${value.judul}';
                        _kategori = '(${value.kategori})';
                        _lirik = value.lirik;
                      })
                    });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _judul,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              _kategori,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            Expanded(
              child: SingleChildScrollView(child: Html(data: _lirik)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '')
      return TextEditingValue();
    else if (int.parse(newValue.text) < 1)
      return TextEditingValue().copyWith(text: '1');

    return int.parse(newValue.text) > 506
        ? TextEditingValue().copyWith(text: '506')
        : newValue;
  }
}
