import 'dart:async';
import 'package:animations/animations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yah_app/Widget/new_page.dart';
import 'package:yah_app/screen/Hom%20Screen/widget/mysnackbar.dart';
import 'package:yah_app/screen/servis/widget/scale_transition.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/provider_passboard.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/alhayan%20content/kaian__screen.dart';
import 'package:yah_app/Widget/card_widget/catagory_curd.dart';
import '../../Widget/AnimaiWidget/BouncingButton.dart';
import '../../styles/style.dart';
import '../../styles/tolls.dart';
import '../about screen/account_screen.dart';
import '../screen_search/secreen_animation.dart';
import 'package:provider/provider.dart';

int _currentPage = 0;
// void select_screen(BuildContext ctx, int tab) {}

void selectScreen2(BuildContext ctx, int index) {
  Navigator.of(ctx).pushNamed(Screen2.routeName, arguments: index);
}

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);
  static const roteName = "Screen Home";

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  late StreamSubscription subscription;
  late StreamSubscription internetSubscription;
  bool hasInternet = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // to close Kyboarde
  FocusNode _focusNode = FocusNode();
  TextEditingController numPass = TextEditingController()..text = "";
  var key = GlobalKey<FormState>();
  @override
  void initState() {
    key = GlobalKey<FormState>();
    setNumPass();
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
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
    final Color color = hasInternet ? Colors.green : Colors.red;
    return message;
  }

  var messageError = "";
  late PageController _pageController;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    String searchQuery = '';
    Size size = MediaQuery.of(context).size;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
            flex: 7,
            child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      "assest/image/imageKaian.png",
                      color: primary,
                    ),
                  ),
                ))),
        const SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Bouncing(
            onPress: () {},
            child: Container(
              width: 400,
              margin: const EdgeInsets.only(
                  top: 0, right: 30, left: 30, bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 17,
                    spreadRadius: -20,
                    color: Colors.black,
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
                    // _showConnectivityResult(result);
                    if (_showConnectivityResult(result) ==
                        "تاكد من إتصالك با الإنترنت ") {
                      _focusNode.unfocus();
                      MySnackBar(scaffold, _showConnectivityResult(result));
                    } else if (numPass.text.isEmpty ||
                        numPass.text.length < 9) {
                      _focusNode.unfocus();
                      MySnackBar(scaffold, "القيمة المدخله خاطة");
                    } else {
                      print("Passbord is :" + numPass.text);
                      Provider.of<PasspordProvider>(context, listen: false)
                          .setNumberPassbord(numPass.text);
                      _focusNode.unfocus();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SecondScreen()));
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "ابحث برقم الجواز",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primary,
                    ),

                    border: InputBorder.none,

                    //  suffixIcon: 24.0,
                    suffixIconColor: Colors.grey,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),

                    suffixIcon: InkWell(
                      onTap: () {
                        if (numPass.text.isEmpty || numPass.text.length < 9) {
                          _focusNode.unfocus();
                          MySnackBar(scaffold, "القيمة المدخله خاطة");
                        } else {
                          print("Passbord is :" + numPass.text);
                          Provider.of<PasspordProvider>(context, listen: false)
                              .setNumberPassbord(numPass.text);
                          // Navigator.of(context).Reblase
                          _focusNode.unfocus();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SecondScreen()));
                        }
                      },
                      focusColor: Colors.amber,
                      hoverColor: Colors.black,
                      child: Container(
                        // color: Colors.amber,
                        child: const Text("Search"),
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 10,
              child: Container(
                // margin: EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(0),
                child: PageView.builder(
                    itemCount: dataList.length,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: carousView(index, size),
                      );
                    }),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        CardBottom(context),
      ]),
    );
  }

  Expanded CardBottom(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 700,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        margin: const EdgeInsets.only(right: 20),
        child: ListView(scrollDirection: Axis.horizontal, children: [
          CatagoryCount(
            titleCurd: "لماذا كيان",
            myIcon: const Icon(
              Icons.diamond,
              color: Colors.blue,
              size: 40,
            ),
            press: () {
              Navigator.push(context, ScaleTransitionScreen(Screen2()));
              Provider.of<ProviderService>(context, listen: false)
                  .setNumberScreen(1.toString());
            },
          ),
          CatagoryCount(
            titleCurd: "شركائنا",
            myIcon: const Icon(
              Icons.handshake,
              color: Color.fromARGB(255, 22, 51, 26),
              size: 50,
            ),
            press: () {
              Navigator.push(context, ScaleTransitionScreen(Screen2()));
              //the provider work number spacitial number screen || in past was send number by argument and arrive by setting arggumrnt in noviagtion
              Provider.of<ProviderService>(context, listen: false)
                  .setNumberScreen(2.toString());
            },
          ),
          CatagoryCount(
            titleCurd: "الفروع",
            myIcon: const Icon(
              Icons.slideshow,
              color: const Color.fromARGB(255, 22, 51, 26),
            ),
            press: () {
              Navigator.push(context, ScaleTransitionScreen(Screen2()));
              Provider.of<ProviderService>(context, listen: false)
                  .setNumberScreen(2.toString());
            },
          ),
          CatagoryCount(
            titleCurd: "حساباتنا",
            myIcon: const Icon(
              Icons.media_bluetooth_on,
              size: 30,
              color: Color.fromARGB(255, 22, 51, 26),
            ),
            press: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ScreenMedia())));
              });
            },
          ),
          CatagoryCount(
              titleCurd: "خدماتنا",
              myIcon: const Icon(Icons.design_services),
              press: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ShowService()));
              }),
        ]),
      ),
    );
  }

  void setNumPass() {
    return setState(() {
      SecondScreen();
    });
  }

  Widget carousView(int index, Size s) {
    return Container(
      child: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 0.0;
            if (_pageController.position.haveDimensions) {
              value = index.toDouble() - (_pageController.page ?? 0);
              value = (value * 0.038).clamp(-1, 1);
              print("value $value indexss $index");
            }
            return Transform.rotate(
              angle: -3.14 * value,
              child: crouseCard(dataList[index], s),
            );
          }),
    );
  }

  Widget crouseCard(DataModel data, Size size) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.only(bottom: 30),

          width: 300,
          height: size.height / 4.3,
          margin: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  data.imageName,
                ),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black)
              ]),
        )
      ],
    );
  }
}

class textForm extends StatelessWidget {
  const textForm({
    Key? key,
    required this.numPass,
  }) : super(key: key);

  final TextEditingController numPass;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numPass,
      // onChanged: ((value) {
      //   setState(() {
      //     numPass.text = value;
      //   });
      // }),
      // onSaved: (ipnut) {
      //   setState(() {
      //     numPass.text = ipnut.toString();
      //   });
      //   numPass.text = ipnut.toString();
      // },
      // validator: (val) {
      //   if (val!.isEmpty) {
      //     setState(() {
      //       messageError = "الرجاء ادخال رقم الجواز";
      //     });

      //   numPass = val as TextEditingController;
      // } else if (val.length < 9) {
      //   setState(() {
      //     messageError =
      //         "رقم الجواز يجب أن يتكون من 9 أرقام على الأقل";
      //   });

      //     return "";
      //   } else {
      //     return null;
      //   }
      // },
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "ابحث برقم الجواز",
        prefixIcon: const Icon(
          Icons.search,
          color: primary,
        ),
        border: InputBorder.none,
        suffixIcon: OpenContainer(
          openColor: Colors.white,
          closedBuilder: (_, openContainer) {
            return Container(
              height: 50,
              width: 100,
              color: Color(0x3234234),
              child: Container(
                child: Center(child: Text('بحث')),
              ),
            );
          },
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          transitionDuration: Duration(milliseconds: 700),
          openBuilder: (_, closeConntainer) {
            if (numPass.text.isEmpty || numPass.text.length < 9) {
              // setNumPass();
              return firstScreen();
            } else {
              return SecondScreen();
            }
          },
        ),
      ),
    );
  }
}
