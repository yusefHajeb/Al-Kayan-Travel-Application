import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';

// import 'package:yah_app/screen/screen_search/secreen_animation.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/style.dart';

class Screen2 extends StatefulWidget {
  static const routeName = 'screen2 ';

  const Screen2({Key? key}) : super(key: key);
  @override
  State<Screen2> createState() => _AlkianScreen();
}

class _AlkianScreen extends State<Screen2> {
  late bool _isLoding;
  @override
  void initState() {
    _isLoding = true;
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        _isLoding = false;
      });
    });
    // Timer(Duration(seconds: 2), () async {
    //   _isLoding = await false;
    // });
    // _isLoding = false;
    super.initState();
  }

  @override
  void dispose() {
    _isLoding = true;

    super.dispose();
  }

  late final AnimationController _controller;

  late Animation<double> _fadeInFadeOut;
// @override
// GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
            Stack(children: <Widget>[
              Container(
                height: size.height / 4.5,
                width: double.infinity,
                child: Image.asset(
                  "assest/image/top_image.png",
                  fit: BoxFit.fill,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const firstScreen()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 30,
                child: Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: header,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ]),
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
                          LoadingShowService(),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 15),
                    ),
                  )
                : Expanded(
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
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          boxShadow: const [
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                            style: header2,
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                e.discrib,
                                                style: paragraph,
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )))
                            .toList()),
                  )
          ],
        ),
      ),
    );
  }
}

class LoadingShowService extends StatelessWidget {
  const LoadingShowService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Skelton(
          height: 120,
          width: 120,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Skelton(width: 80),
            const SizedBox(height: 8),
            const Skelton(),
            const SizedBox(height: 8),
            const Skelton(),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(child: Skelton()),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: Skelton()),
              ],
            )
          ],
        ))
      ],
    );
  }
}

class myAppBarServece extends StatelessWidget {
  const myAppBarServece({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assest/image/top_background.png",
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 80,
          right: 150,
          child: Text(
            "لماذا نحن",
            style: header,
          ),
        ),
      ],
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
