import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = 'page_kaian_about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildInfo1(),
            _buildInfo2(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo1() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assest/image/thim2.png"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'وكالة الكيان الدولي ترخيص رقم',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(
                      Icons.location_city,
                      size: 23,
                    ),
                    title: Text("إب"),
                    subtitle: Text("1.0"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.roundabout_right_outlined,
                      size: 23,
                    ),
                    title: Text("شارع العدين"),
                    subtitle: Text("نزلة شركة سبافون"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.lock_clock,
                      size: 23,
                    ),
                    title: Text("08:00 - -ص 12:00"),
                    onTap: () {},
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo2() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Author'),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 23,
                    ),
                    title: Text("Deepakkumar"),
                    subtitle: Text("Coimbatore,TamilNadu"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.file_download,
                      size: 23,
                    ),
                    title: Text("Download From Cloud"),
                    onTap: () {},
                  ),
                ],
              )),
        ));
  }
}
