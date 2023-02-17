// import 'package:flutter/material.dart';
// import 'package:yah_app/HomePage.dart';

// class Kaian extends StatelessWidget {
//   final image;
//   final name;
//   final discrib;

//   Kaian({Key? key, this.image, this.name, this.discrib});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45,
//             color: kBlueColor,
//             // width: double.infinity,
//           ),
//           SafeArea(
//               child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: size.height * 0.05,
//               ),
//               Text(
//                 "Al-Kaian",
//                 style: Theme.of(context)
//                     .textTheme
//                     .displaySmall
//                     ?.copyWith(fontWeight: FontWeight.w900),
//               )
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
