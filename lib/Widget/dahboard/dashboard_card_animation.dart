import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yah_app/Widget/AnimaiWidget/BouncingButton.dart';
import 'package:yah_app/dataBase/dashboard_card_data.dart';
import 'package:yah_app/styles/style.dart';

class DashboardCardAnimation extends StatelessWidget {
  const DashboardCardAnimation({
    super.key,
    required this.cardsData,
    required this.widthSize,
    required this.index,
  });

  final int index;
  final List<DashboardCardData> cardsData;
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      duration: const Duration(milliseconds: 1400),
      curve: Curves.fastLinearToSlowEaseIn,
      child: FadeInAnimation(
        child: BouncingButton(
          onPress: () {},
          child: InkWell(
            onTap: () {
              cardsData[index].onTap();
            },
            child: Container(
              child: SizedBox(
                height: 20,
                width: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        cardsData[index].imageLink,
                        scale: 2,
                        width: MediaQuery.sizeOf(context).width / 6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        cardsData[index].name,
                        style: card,
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(
                bottom: widthSize / 30,
                left: widthSize / 60,
                right: widthSize / 60,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                gradient: const LinearGradient(
                    colors: [Colors.white, yBackgroundColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
