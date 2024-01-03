import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        // if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            AnimatingRoute(
              route: const HomeScreen(),
              page: Container(),
            ));
        Timer(
          const Duration(milliseconds: 300),
          () {
            // print('worked');
            scaleController.reset();
            //  scaleController.forward();
          },
        );
      });

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 10.0).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    // double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            scaleController.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: AnimatedBuilder(
              animation: scaleAnimation,
              builder: (c, child) => Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Go Back'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}

class AnimatingRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  AnimatingRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:slider_button/slider_button.dart';

// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Container(
//           width: 400,
//           margin: EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 6),
//               blurRadius: 17,
//               spreadRadius: -20,
//               color: Colors.black,
//             ),
//           ], color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
//           child: TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               hintText: "ابحث برقم الجواز",
//               icon: Icon(Icons.search),
//               border: InputBorder.none,
//               suffixIcon: SliderButton(
//                 action: () {
//                   ///Do something here
//                 },
//                 width: 150,
//                 label: Text(
//                   'search',
//                   style: TextStyle(
//                       color: Color.fromARGB(255, 215, 181, 181),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 17),
//                 ),
//                 icon: CircleAvatar(
//                   // child: Icon(Icons.search),
//                   maxRadius: 59,
//                   backgroundColor: Colors.black12,
//                 ),
//                 // Icon(Icons.search),
//               ),
//             ),
//           )),
//     ));
//   }
// }
