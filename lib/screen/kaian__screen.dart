import 'package:flutter/material.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
// import 'package:yah_app/screen/screen_search/secreen_animation.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/style.dart';

// import '../unUsing/about.dart';

// class Product {
//   final image;
//   final name;
//   final discrib;
//   Product(this.image, this.name, this.discrib);
// }

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2();
  static const routeName = 'screen2 ';
}

class _Screen2 extends State<Screen2> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<double> _fadeInFadeOut;
  // @override
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final numTab = ModalRoute.of(context)?.settings.arguments.toString();
    //set val to index in provider
    Provider.of<ProviderService>(context, listen: false)
        .setIndex(numTab.toString());
    // final String index = Provider.of<ProviderService>(context).getIndex();

    List<dynamic> check = Provider.of<ProviderService>(context).check();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: size.height / 4.5,
              width: double.infinity,
              child: Image.asset(
                "assest/image/top_image.png",
                fit: BoxFit.fill,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 30,
              child: Container(
                child: Text(
                  "خدماتنا",
                  textAlign: TextAlign.center,
                  style: header,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ]),
          // myAppBarServece(size: size),
          // Transform.translate(
          //   offset: Offset(0, -35),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: Offset(0, 10.0),
          //           blurRadius: 20.0,
          //           color: Color.fromARGB(255, 158, 158, 158),
          //         ),
          //       ],
          //     ),
          //     height: 60,
          //     child: Container(
          //       margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          //       padding: EdgeInsets.all(5),
          //       height: 60,
          //       child: Row(
          //         //listView
          //         // scrollDirection: Axis.horizontal,
          //         children: ['مايميزنا', 'شركائنا', 'فروعنا']
          //             .map((e) => Container(
          //                 margin: EdgeInsets.symmetric(
          //                     vertical: 8.0, horizontal: 8.0),
          //                 child: Bouncing(
          //                   child: OutlinedButton(
          //                     onPressed: () {},
          //                     style: OutlinedButton.styleFrom(
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(18.0),
          //                         ),
          //                         side: BorderSide(
          //                             width: 1, color: Colors.black)),
          //                     child: Text(
          //                       e,
          //                       style:
          //                           TextStyle(color: bBackDark, fontSize: 15),
          //                     ),
          //                     // onHover: (context){},
          //                   ),
          //                   onPress: () {
          //                     setState(() {
          //                       if (e == 'مايميزنا')
          //                         index = '1';
          //                       else if (e == 'شركائنا')
          //                         index = '2';
          //                       else if (e == "فروعنا") index = '3';
          //                       // check();
          //                       index = "";
          //                     });
          //                   },
          //                 )))
          //             .toList(),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 4,
          ),
          Column(
              children: check
                  .map((e) => AnimationConfiguration.staggeredList(
                      position: 2,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 2500),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 6),
                                    blurRadius: 10,
                                    spreadRadius: -12,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                              child: ListTile(
                                onTap: () {},
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    e.image,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    // color: Colors.transparent,
                                  ),
                                ),
                                title: Text(
                                  e.name,
                                  style: header2,
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      e.discrib,
                                      style: paragraph,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )))
                  .toList()),
        ],
      ),
    );
  }
}

class myAppBarServece extends StatelessWidget {
  const myAppBarServece({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assest/image/top_background.png",
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 80,
          right: 150,
          child: Text(
            "لماذا نحن",
            style: header,
          ),
        ),
      ],
    );
  }
}
