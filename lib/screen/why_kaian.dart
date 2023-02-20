import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yah_app/screen/sirvec_page.dart';
import 'package:yah_app/tolls.dart';
import 'package:yah_app/main.dart';
import 'package:page_transition/page_transition.dart';
import '../Widget/BouncingButton.dart';
import '../Widget/about.dart';
import 'first_screen.dart';

void select_screen(BuildContext ctx) {
  Navigator.of(ctx).pushNamed(AboutUs.routeName);
}

class Product {
  final image;
  final name;
  final discrib;
  Product(this.image, this.name, this.discrib);
}

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2();
  static const routeName = 'screen2 ';

  @override
  void initState() {}
}

class _Screen2 extends State<Screen2> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<double> _fadeInFadeOut;
  @override

  // عند فتح الصفحة تظهر هذي البانات الخاصة بزر لماذا كيان
  List products = [
    Product("assest/image/imageKaian.png", 'مصداقية', "دائما الزبون على حق"),
    Product("assest/image/imageKaian.png", 'اسعار منافسة',
        "خدمات متعددة بااسعار منافسة"),
    Product("assest/image/thim3.png", 'دقة في المواعيد ',
        "سرعة في انجاز المعاملات"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];
//اقائمة هذي حق شركائنا
  List partners = [
    Product("assest/image/me.jpg", 'طيران السعيدة', "دائما الزبون على حق"),
    Product("assest/image/me.jpg", 'مصر للطيران', ""),
    Product(
        "assest/image/me.jpg", 'دقة في المواعيد ', "سرعة في انجاز المعاملات"),
    Product("assest/image/me.jpg", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];

  // فروعنا
  List branch = [
    Product("assest/image/thim3.png", 'طيران السعيدة', "دائما الزبون على حق"),
    Product("assest/image/thim3.png", 'مصر للطيران', ""),
    Product(
        "assest/image/me.jpg", 'دقة في المواعيد ', "سرعة في انجاز المعاملات"),
    Product("assest/image/me.jpg", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final numTab = ModalRoute.of(context)?.settings.arguments.toString();
    String index = numTab.toString();
    List<dynamic> check() {
      if (index == "1")
        return products;
      else if (index == "2")
        return partners;
      else if (index == "3")
        return branch;
      else
        // index = "1";
        print(index);
      return products;
    }

    // String index = numTab.toString();
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: size.height * .22,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assest/image/airplane1.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
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
          Expanded(
            child: Column(
                children: check()
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
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(e.discrib),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
