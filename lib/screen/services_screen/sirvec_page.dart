import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/screen/services_screen/sirvece_screen.dart';

import '../../Widget/AnimaiWidget/BouncingButton.dart';
import 'package:yah_app/styles/style.dart';

import '../../providers/service_provider.dart';

class PageService extends StatefulWidget {
  static const routeName = 'show_servece_index';

  const PageService({Key? key}) : super(key: key);
  @override
  State<PageService> createState() => _PageService();
}

List serveceDetails = [];

@override
class _PageService extends State<PageService> {
  @override
  Widget build(BuildContext context) {
    serveceDetails = Provider.of<ServicesProvider>(context, listen: false)
        .getListReosponse();
    var size = MediaQuery.of(context).size;
    final int sectionIndex = Provider.of<ServicesProvider>(context).getIndex();
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ShowService()));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Stack(children: <Widget>[
                  Container(
                    height: size.height / 3,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: serveceDetails[sectionIndex]['imgUrl'],
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      width: double.infinity,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ShowService()));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          elevation: MaterialStateProperty.all(0),
                          minimumSize:
                              MaterialStateProperty.all(const Size(34, 34)),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          alignment: Alignment.center,
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 218, 172, 31),
                          )),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -2,
                    height: 25,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Transform.translate(
                offset: const Offset(0, -50),
                child: Container(
                  width: size.width / 1.50,
                  padding: const EdgeInsets.all(13),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 17,
                          spreadRadius: -6,
                          color: Colors.black,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      serveceDetails[sectionIndex]['title'],
                      // data[sectionIndex].title,
                      textAlign: TextAlign.center,
                      style: header2,
                    ),
                  ),
                ),
              ),
              //-=============================================
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      serveceDetails[sectionIndex]['paragraph'],
                      style: paragraph.copyWith(fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 20),
                        child: Text(
                          "مزيد من الخدمات",
                          style: header2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 80.0,
                          child: AnimationConfiguration.synchronized(
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              curve: Curves.easeInCirc,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 600),
                                    child: SlideAnimation(
                                      horizontalOffset: 30.0,
                                      child: FadeInAnimation(
                                        delay:
                                            const Duration(microseconds: 200),
                                        child: BouncingButton(
                                            onPress: () {},
                                            child: (CardBottom(
                                                sectionIndex: index))),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: serveceDetails.length,
                              ),
                            ),
                          )),
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
    required this.sectionIndex,
  }) : super(key: key);

  final int sectionIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ServicesProvider>(context, listen: false)
            .showService(context, sectionIndex);
      },
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 10, bottom: 10),
          // padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 6),
                  blurRadius: 3,
                  spreadRadius: -7,
                  color: Colors.black,
                )
              ]),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 2,
              child: Container(
                // width: double.infinity,
                // height: 200,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 40, 39, 37)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    height: 200,
                    imageUrl: serveceDetails[sectionIndex]['imgUrl'],
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    // width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Text(
                '${serveceDetails[sectionIndex]['title']}',
                style: paragraph2,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
