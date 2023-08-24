import 'package:flutter/material.dart';

class DataKayan {
  final String title;
  final String paragtaph;
  final String imgUrl;

  DataKayan(
      {required this.title, required this.paragtaph, required this.imgUrl});
}

List<DataKayan> data = [
  DataKayan(
      imgUrl: 'assest/image/airplane.jpg',
      paragtaph:
          " نسعى من خلال مكتب الكيان توفير الخدمات لحجاج ومعتمري بيت الله الحرام بما يلبي مطالبهم من سرعة _  انجاز معاملاتهم وتأمين وسية نقل أمنه",
      title: "حج وعمرة"),
  DataKayan(
    title: 'الزيارات العائلية',
    paragtaph:
        "من بين خدمات مكتب الكيان الدولي للسفريات والسياحة يوجد خدمة الزيارة العائلية،  تتضمن خدمة الزيارة العائلية أيضًا إجراءات _ تأشيرات الدخول للزائرين، بشكل عام، تتيح خدمة الزيارة العائلية للزوار فرصًا ثمينة للاستكشاف والاحتفال بأحبائهم في الخارج والحصول على تجربة سفر مريحة وسلسة. وتعد خدمات مكتب الكيان الدولي للسفريات والسياحة من بين الأفضل في هذا المجال، حيث يمكن للزائرين الاستفادة من خدماتهم المتميزة",
    imgUrl: 'assest/image/airplane4.jpg',
  ),
  DataKayan(
      title: 'تأشيرات عمل',
      paragtaph:
          'تاشيرات عمل الئ معظم الدول المجاورة بااسعار مناسبة _ وتاشيرات مضمونة ',
      imgUrl: 'assest/image/airplane.jpg'),
  DataKayan(
    title: "انجاز المعاملات ",
    paragtaph:
        " يسعئ مكتب الكيان ان يوفر لعملائه خدمات اخرئ منها اصدار _ الاقامات والمعاملات الاخرئ ",
    imgUrl: 'assest/image/airplane1.jpg',
  ),
  DataKayan(
    title: 'اخرئ',
    paragtaph: 'تاشيرات على عمل ',
    imgUrl: 'assest/image/airplane3.jpg',
  ),
];

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}
