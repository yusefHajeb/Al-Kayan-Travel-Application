// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import "package:flutter/material.dart";
// import 'package:flutter/rendering.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:yah_app/main.dart';
// import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';
// import '../Widget/card_widget/catagory_curd.dart';

// class Fruit {
//   String type;
//   Fruit({required this.type});
// }

// class Apple extends Fruit {
//   String variety;
//   int count;

//   Apple({required String type, required this.variety, required this.count})
//       : assert(type != null),
//         assert(variety != null),
//         assert(count != null),
//         super(type: type);

//   void eat() {
//     print('Eating an apple');
//   }
// }

// int _currentPage = 0;

// class BottomPage extends StatefulWidget {
//   const BottomPage({Key? key}) : super(key: key);

//   @override
//   State<BottomPage> createState() => BottomPageState();
// }

// class BottomPageState extends State<BottomPage> {
//   late PageController _pageController;
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pageController =
//         PageController(initialPage: _currentPage, viewportFraction: 0.8);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var product;
//     Size size = MediaQuery.of(context).size;
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           body: firstScreen(),
//           bottomNavigationBar: CurvedNavigationBar(
//             backgroundColor: Color.fromARGB(255, 21, 39, 20),
//             items: <Widget>[
//               Icon(Icons.list, size: 30),
//               Icon(Icons.home, size: 30),
//               Icon(Icons.compare_arrows, size: 30),
//             ],
//             onTap: (index) {
//               //Handle button tap
//             },
//           ),
//         ));
//     //       bottomNavigationBar: Container(
//     //         color: Colors.black,
//     //         child: Padding(
//     //             padding: const EdgeInsets.symmetric(horizontal: 5.5, vertical: 8),
//     //             child: GNav(
//     //                 backgroundColor: Colors.black,
//     //                 color: Colors.white,
//     //                 activeColor: yBackgroundColor,
//     //                 tabBackgroundColor: Colors.grey.shade800,
//     //                 gap: 10,
//     //                 hoverColor: kBlueColor,
//     //                 onTabChange: (index) {
//     //                   if (index == 1) {
//     //                     Navigator.of(context)
//     //                         .push(MaterialPageRoute(builder: (_) {
//     //                       return MyHomePage();
//     //                     }));
//     //                   }
//     //                 },
//     //                 tabs: [
//     //                   GButton(
//     //                     icon: Icons.home,
//     //                     text: "الرئيسية",
//     //                   ),
//     //                   GButton(icon: Icons.people_rounded, text: "شركائنا"),
//     //                   GButton(
//     //                     icon: Icons.headphones,
//     //                     text: "خدماتنا",
//     //                   ),
//     //                   GButton(
//     //                     icon: Icons.share,
//     //                     text: "للتواصل",
//     //                   )
//     //                 ])),
//     //       ));
//     // }
//   }
// }
