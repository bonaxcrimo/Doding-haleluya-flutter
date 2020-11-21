import 'package:flutter/material.dart';
import 'package:first/models/GridMenu.dart';

import '../../configuration.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({Key key, this.gridMenu}) : super(key: key);

  final List<GridMenu> gridMenu;

  @override
  Widget build(BuildContext context) {
    return gridMenu == null
        ? Text("Empty")
        : GridView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: gridMenu.map((grid) {
              return Card(
                elevation: 2.5,
                margin: EdgeInsets.all(12.5),
                child: InkWell(
                  child: getCardByTitle(grid.name, grid.icon, grid.warna),
                  onTap: () {
                    Navigator.pushNamed(context, '/${grid.route}');
                  },
                ),
              );
            }).toList());
  }

  Column getCardByTitle(String title, IconData icon, Color warna) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(children: <Widget>[
            RawMaterialButton(
              elevation: 0.0,
              fillColor: warna,
              child: Icon(
                icon,
                size: 30.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            )
            // new Image.asset(imgUrl, width: 80.0, height: 80.0)
          ])),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Divider(
            color: lightgray,
            height: 15.0,
            thickness: 2.0,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff969696),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
