// import 'package:flutter/material.dart';
// import 'package:yah_app/screen/sirvec_page.dart';
// import 'package:yah_app/screen/sirvece_screen.dart';

// import 'dealetes.dart';
// // import 'package:prgect_corse/widget/category_item.dart';
// // import 'package:prgect_corse/widget/meal__item.dart';
// // import '../dummy_data.dart';

// class Screen3 extends StatefulWidget {
//   static const routName = 'pagee';

//   @override
//   State<Screen3> createState() => _Screen3();
// }

// class _Screen3 extends State<Screen3> {
//   @override
//   Widget build(BuildContext context) {
//     final routeArg =
//         ModalRoute.of(context)?.settings.arguments as Map<String, String>;
//     // final categoryId = routeArg['id'];
//     // final categoryTitle = routeArg['title'];
//     //where is use to filter , away meal can accisc to all element List
//     // containes use to chick to categoryId to if one  ,to show filtterat dinnar
//     // final categoryMeals = DUMMY_MEALS.where((meal) {
//     //   return meal.categories.contains(categoryId);
//     // }).toList();
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return SrvessScreen(
//             id: DUMMY_MEALS[index].id,
//             imageUrl: DUMMY_MEALS[index].imageUrl,
//             title: DUMMY_MEALS[index].title,
//           );
//         },
//         itemCount: DUMMY_MEALS.length,
//       ),
//     );
//   }
// }
