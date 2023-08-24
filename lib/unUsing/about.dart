import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = 'page_kaian_about';

  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  const Row(
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
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(
                      Icons.location_city,
                      size: 23,
                    ),
                    title: const Text("إب"),
                    subtitle: const Text("1.0"),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.roundabout_right_outlined,
                      size: 23,
                    ),
                    title: const Text("شارع العدين"),
                    subtitle: const Text("نزلة شركة سبافون"),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.lock_clock,
                      size: 23,
                    ),
                    title: const Text("08:00 - -ص 12:00"),
                    onTap: () {},
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo2() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Author'),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 23,
                    ),
                    title: const Text("Deepakkumar"),
                    subtitle: const Text("Coimbatore,TamilNadu"),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.file_download,
                      size: 23,
                    ),
                    title: const Text("Download From Cloud"),
                    onTap: () {},
                  ),
                ],
              )),
        ));
  }
}
