import 'dart:async';
import 'dart:convert';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yah_app/Widget/custom_clipper.dart';
import 'package:yah_app/providers/service_provider.dart';
import 'package:yah_app/Widget/home_screen/mysnackbar.dart';
import 'package:yah_app/Widget/scale_transition.dart';
import 'package:yah_app/providers/myprovider.dart';
import 'package:yah_app/providers/provider_passboard.dart';
import 'package:yah_app/screen/services_screen/sirvece_screen.dart';
import 'package:yah_app/screen/alhayan%20content/kaian__screen.dart';
import 'package:yah_app/Widget/card_widget/catagory_curd.dart';
import '../../Widget/AnimaiWidget/BouncingButton.dart';
import '../../Widget/AnimaiWidget/slide_secreen.dart';
import '../../styles/style.dart';

import '../about screen/account_screen.dart';
import '../passport_data_screen/secreen_animation.dart';
import 'package:provider/provider.dart';

int _currentPage = 0;
// void select_screen(BuildContext ctx, int tab) {}

void selectScreen2(BuildContext ctx, int index) {
  Navigator.of(ctx).pushNamed(Screen2.routeName, arguments: index);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const roteName = "Screen Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  late StreamSubscription internetSubscription;
  bool hasInternet = false;
  bool _loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // to close Kyboarde
  final FocusNode _focusNode = FocusNode();
  TextEditingController numPass = TextEditingController()..text = "";
  var key = GlobalKey<FormState>();
  List listImage = [];

  Future<void> getImage() async {
    CollectionReference ref =
        FirebaseFirestore.instance.collection("Bouncing Scroll");

    QuerySnapshot querySnapshot = await ref.get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        listImage.add(doc.data());
      }
      setState(() {
        _loading = true;
      });
    }
  }

  @override
  void initState() {
    key = GlobalKey<FormState>();
    setNumPass();
    getImage().then((value) => _loading = true);
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      this.hasInternet = hasInternet;
    });

    subscription =
        Connectivity().onConnectivityChanged.listen(_showConnectivityResult);

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    super.initState();
  }

  String _showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? "You are connected to mobile network"
        : "تاكد من إتصالك با الإنترنت ";
    // final Color color = hasInternet ? Colors.green : Colors.red;

    return message;
  }

  var messageError = "";
  late PageController _pageController;

  @override
  void dispose() {
    if (mounted) {
      _loading = false;
      super.dispose();
    }

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    Size size = MediaQuery.of(context).size;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
            flex: 4,
            child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Image.asset(
                      "assest/image/imageKaian.png",
                      color: primary,
                    ),
                  ),
                ))),
        BouncingButton(
          onPress: () {},
          child: Container(
            width: 370,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 7),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(29.5),
            ),
            child: Form(
              key: key,
              child: TextFormField(
                controller: numPass,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                obscureText: false,
                textInputAction: TextInputAction.search,
                onEditingComplete: () async {
                  final result = await Connectivity().checkConnectivity();
                  if (_showConnectivityResult(result) ==
                      "تاكد من إتصالك با الإنترنت ") {
                    _focusNode.unfocus();
                    mySnackBar(scaffold, _showConnectivityResult(result));
                  } else if (numPass.text.isEmpty) {
                    _focusNode.unfocus();
                    mySnackBar(scaffold, "الرجاء ادخال رقم الجواز");
                  } else if (numPass.text.length < 9) {
                    _focusNode.unfocus();
                    mySnackBar(scaffold, "القيمة المدخله خاطئة");
                  } else {
                    print("Passbord is :" + numPass.text);
                    Provider.of<PassportProvider>(context, listen: false)
                        .setNumberPassbord(numPass.text);
                    _focusNode.unfocus();

                    Navigator.push(
                        context, ScaleTransitionScreen2(const SecondScreen()));
                  }
                },
                decoration: InputDecoration(
                  hintText: "ابحث برقم الجواز",
                  hintStyle: header2.copyWith(fontSize: 15),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: primary,
                  ),
                  border: InputBorder.none,
                  suffixIconColor: Colors.grey,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 0),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 7,
              child: Container(
                padding: const EdgeInsets.all(0),
                child: PageView.builder(
                    itemCount: listImage.length,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: _carousView(index, size));
                    }),
              ),
            ),
          ),
        ),
        Expanded(flex: 4, child: CardBottom(context)),
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  Container CardBottom(
    BuildContext context,
  ) {
    return Container(
        margin: const EdgeInsets.only(right: 5),
        child: GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 4,
          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => [
            CategoryCount(
              titleCurd: " كيان",
              myIcon: const Icon(
                Icons.diamond,
                color: Color.fromARGB(255, 4, 10, 15),
                size: 40,
              ),
              press: () {
                _focusNode.unfocus();
                Navigator.push(context, ScaleTransitionScreen(const Screen2()));
                Provider.of<ProviderService>(context, listen: false)
                    .setNumberScreen(0.toString());
              },
            ),
            CategoryCount(
              titleCurd: "الفروع",
              myIcon: const Icon(
                Icons.hotel_class_outlined,
                color: Color.fromARGB(255, 22, 51, 26),
                size: 34,
              ),
              press: () {
                _focusNode.unfocus();
                Navigator.push(context, ScaleTransitionScreen(Screen2()));
                Provider.of<ProviderService>(context, listen: false)
                    .setNumberScreen(2.toString());
              },
            ),
            CategoryCount(
              titleCurd: "شركائنا",
              myIcon: const Icon(
                Icons.local_airport_sharp,
                color: Color.fromARGB(255, 22, 51, 26),
                size: 34,
              ),
              press: () {
                _focusNode.unfocus();
                Navigator.push(context, ScaleTransitionScreen(const Screen2()));
                //the provider work number spacitial number screen || in past was send number by argument and arrive by setting arggumrnt in noviagtion
                Provider.of<ProviderService>(context, listen: false)
                    .setNumberScreen(1.toString());
              },
            ),
            CategoryCount(
              titleCurd: "حساباتنا",
              myIcon: const Icon(
                Icons.local_phone_outlined,
                size: 34,
                color: Color.fromARGB(255, 22, 51, 26),
              ),
              press: () {
                _focusNode.unfocus();
                Navigator.push(context, MySlideTransition(AccountsPage()));
              },
            ),
            CategoryCount(
              titleCurd: "خدماتنا",
              myIcon: const Icon(
                Icons.local_mall_sharp,
                size: 34,
              ),
              press: () {
                Provider.of<ServicesProvider>(context, listen: false)
                    .setValueLoading(false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ShowService()));
              },
            ),
            CategoryCount(
              titleCurd: " كيان",
              myIcon: const Icon(
                Icons.diamond,
                color: Color.fromARGB(255, 4, 10, 15),
                size: 40,
              ),
              press: () {
                _focusNode.unfocus();
                Navigator.push(context, ScaleTransitionScreen(const Screen2()));
                Provider.of<ProviderService>(context, listen: false)
                    .setNumberScreen(0.toString());
              },
            ),
          ].elementAt(index),
        ));
  }

  void setNumPass() {
    return setState(() {
      const SecondScreen();
    });
  }

  Widget _carousView(int index, Size s) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
            angle: -3.14 * value,
            child: _crouseCard(listImage[index]["imageUrl"].toString(), s));
      },
    );
  }

  Widget _crouseCard(String urlImage, Size size) {
    return Column(
      children: [
        Container(
          height: size.height / 4.5,
          margin: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(urlImage),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
