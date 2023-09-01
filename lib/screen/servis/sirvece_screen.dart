import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';

// import 'package:yah_app/screen/servis/sirvec_page.dart';
import 'package:yah_app/styles/style.dart';
<<<<<<< HEAD

import '../../providers/service_provider.dart';
=======
import '../../providers/service_provider.dart';
// import '../../styles/provider_passboard.dart';
>>>>>>> 5035911d6811ccb0c95452793424fc7bed5118b4

import '../alhayan content/kaian__screen.dart';

// import '../../styles/tolls.dart';
// import '../alhayan content/kaian__screen.dart';

// import 'package:yah_app/styles/style.dart';

class ShowService extends StatefulWidget {
  static const routeName = 'servece_screen';

  static const roteName = "Screen Home";

  const ShowService({Key? key}) : super(key: key);
  @override
  State<ShowService> createState() => _Screenkhadmatana();
}

class _Screenkhadmatana extends State<ShowService> {
  @override
  void initState() {
<<<<<<< HEAD
=======
    setState(() {
      fetchData().then((value) =>
          Future.delayed(const Duration(milliseconds: 100)).then((_) {
            Provider.of<ServicesProvider>(context, listen: false)
                .setValueLoading(true);
          }));
    });

>>>>>>> 5035911d6811ccb0c95452793424fc7bed5118b4
    super.initState();
    fetchData()
        .then((value) => Future.delayed(Duration(milliseconds: 100)).then((_) {
              Provider.of<ServicesProvider>(context, listen: false)
                  .setValueLoading(true);
              print("Okkkkkkkkkkk");
            }));
  }

  List mylist = [];

  Future<void> fetchData() async {
    Provider.of<ServicesProvider>(context, listen: false).DataProvider.clear();
    CollectionReference ref = FirebaseFirestore.instance.collection("service");
    QuerySnapshot querySnapshot = await ref.get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        mylist.add(doc.data());
      }
      Provider.of<ServicesProvider>(context, listen: false)
          .DataProvider
          .addAll(mylist);
    }
  }

  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // mylist.clear();
  // setState(() {
  //   Provider.of<ServicesProvider>(context, listen: false)
  //       .setValueLoading(false);
  // });
  // ServicesProvider myProvider = dependOnInheritedWidgetOfExactType<ServicesProvider>();
  // (myProvider as ServicesProvider).setValueLoading(false);
  // }

  @override
  void dispose() {
    if (mounted) {}
    super.dispose();
  }

  Widget buildSectionTile(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final mealId = ModalRoute.of(context)?.settings.arguments;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    var size = MediaQuery.of(context).size;
    // final DataProvider = Provider.of<ServicesProvider>(context);
    // final dataServices = DataProvider.Data;

    // CollectionReference ref = FirebaseFirestore.instance.collection("service");
    String cutDescription(String desc) {
      return desc.length > 70
          ? desc.replaceRange(70, desc.length, '...')
          : desc;
    }

    return WillPopScope(
        onWillPop: () async {
          return await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const firstScreen()));
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const firstScreen()));
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
                  height: 38,
                  child: Container(
                    child: Text(
                      "خدماتنا",
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Provider.of<ServicesProvider>(context).getLoadinf()
                    ? AnimationConfiguration.synchronized(
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          curve: Curves.slowMiddle,
                          child: FadeInAnimation(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: mylist.length,
                              itemBuilder: (ctx, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
<<<<<<< HEAD
                                  duration: Duration(milliseconds: 800),
                                  child: SlideAnimation(
                                    // delay: Duration(milliseconds: 200),
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      delay: Duration(milliseconds: 100),
=======
                                  duration: const Duration(milliseconds: 700),
                                  child: SlideAnimation(
                                    delay: const Duration(milliseconds: 200),
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      delay: const Duration(milliseconds: 200),
>>>>>>> 5035911d6811ccb0c95452793424fc7bed5118b4
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 5,
                                            left: 5,
                                            top: 5,
                                            bottom: 7),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<ServicesProvider>(
                                                    context,
                                                    listen: false)
                                                .showService(context, index);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          splashColor: primary,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            elevation: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: size.height / 4,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                              mylist[index]
                                                                  ['imgUrl']),
                                                      fit: BoxFit.fill,
                                                      // dataServices[index].imgUrl,
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        // mylist[index].title,
                                                        // data[index].title,
                                                        mylist[index]['title'],
                                                        style: header2,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        cutDescription(
                                                            mylist[index]
                                                                ['paragraph']),
                                                        // data[index]
                                                        //         .paragtaph
                                                        //         .split("_")[0] +
                                                        //     "...",
                                                        style: paragraph,
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) =>
                            const LoadingShowService(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 15),
                      ),
              )
            ]),
          ),
        ));
  }
}
