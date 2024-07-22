import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/kayancontent/loadingshow_servece.dart';
import 'package:yah_app/providers/myprovider.dart';
import 'package:yah_app/styles/style.dart';
import '../../Widget/kayancontent/appbar_contant.dart';

class ButtonsKyanBranchesAndPartnersScreen extends StatefulWidget {
  static const routeName = 'screen2 ';

  const ButtonsKyanBranchesAndPartnersScreen({Key? key}) : super(key: key);
  @override
  State<ButtonsKyanBranchesAndPartnersScreen> createState() => _AlkianScreen();
}

class _AlkianScreen extends State<ButtonsKyanBranchesAndPartnersScreen> {
  late bool _isLoding;
  @override
  void initState() {
    _isLoding = true;
    Future.delayed(const Duration(seconds: 1)).then((_) {
      setState(() {
        _isLoding = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _isLoding = true;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final numTab = Provider.of<ProviderService>(context).getNumberScreen();

    //set val to index in provider
    Provider.of<ProviderService>(context, listen: false)
        .setIndex(numTab.toString());

    String title =
        Provider.of<ProviderService>(context).titleTopScreen[int.parse(numTab)];
    List<dynamic> check = Provider.of<ProviderService>(context).check();

    return Scaffold(
      // appBar: ,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            AppBarHeadder(size: size, title: title),
            const SizedBox(
              height: 4,
            ),
            _isLoding
                ? Expanded(
                    child: ListView.separated(
                      shrinkWrap: false,
                      // scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) =>
                          const LoadingShowService(),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15),
                    ),
                  )
                : CardContant(check: check)
          ],
        ),
      ),
    );
  }
}

class CardContant extends StatelessWidget {
  const CardContant({
    super.key,
    required this.check,
  });

  final List check;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
          children: check
              .map((e) => AnimationConfiguration.staggeredList(
                  position: 2,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 2500),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              e.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e.name,
                                                  style: header2,
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  e.discrib,
                                                  style: paragraph,
                                                )
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )))
              .toList()),
    );
  }
}
