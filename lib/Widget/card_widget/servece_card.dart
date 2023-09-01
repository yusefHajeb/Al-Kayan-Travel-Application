import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  final String imageUrl;
  final String id;

  final String title;
  //constracter
  const ServiceScreen({Key? key, 
    required this.imageUrl,
    required this.id,
    required this.title,
  }) : super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              //widget to Rudios to Image
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
              // child: Text(imageUrl),
            ],
          )
        ]),
      ),
    );
  }
}
