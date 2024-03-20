import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/dataBase/dealetes.dart';
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

// List<DataService> listService = [];

Future<void> getData() async {
  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  QuerySnapshot querySnapshot = await ref.get();

  List mylist = [];
  if (querySnapshot.docs.isNotEmpty) {
    for (var doc in querySnapshot.docs) {
      mylist.add(doc.data());
    }
    // listService.add(DataService(imgUrl: '', paragraph: '', title: ''));
    print("-------------------------------");
  }
}

List myList = [];

@override
class _PageService extends State<PageService> {
  @override
  Widget build(BuildContext context) {
    myList = Provider.of<ServicesProvider>(context, listen: false).DataProvider;
    var size = MediaQuery.of(context).size;
    //عند الا
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
                child: AppBarHeadder(
                  size: size,
                ),
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
                      myList[sectionIndex]['title'],
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
                  // height: size.height / 2.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      myList[sectionIndex]['paragraph'],
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
                              child: FadeInAnimation(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: SlideAnimation(
                                        horizontalOffset: 30.0,
                                        child: FadeInAnimation(
                                          delay:
                                              const Duration(milliseconds: 200),
                                          child: Bouncing(
                                              onPress: () {},
                                              child: (CardBottom(
                                                  sectionIndex: index))),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: data.length,
                                ),
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
                // width: 70,
                // height: 50,
                // padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 40, 39, 37)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          myList[sectionIndex]['imgUrl']),
                      fit: BoxFit.fill,
                      // dataServices[index].imgUrl,
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Text(
                myList[sectionIndex]['title'],
                // data[sectionIndex].title,
                style: paragraph2,
                //  TextStyle(
                //     color: Color.fromARGB(255, 54, 52, 52), fontSize: 13),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}