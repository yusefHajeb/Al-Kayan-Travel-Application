class DataKayan {
  final String title;
  final String paragtaph;
  final String imgUrl;

  DataKayan(
      {required this.title, required this.paragtaph, required this.imgUrl});
}

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
