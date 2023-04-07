import 'package:animations/animations.dart';

import 'package:flutter/material.dart';

import 'package:yah_app/Widget/new_page.dart';
import 'package:yah_app/screen/Hom%20Screen/widget/mysnackbar.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/kaian__screen.dart';
import 'package:yah_app/Widget/card_widget/catagory_curd.dart';
import '../account_screen.dart';
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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController numPass = TextEditingController()..text = "";
  var key = GlobalKey<FormState>();
  // getData() async {
  //   DocumentReference doc = FirebaseFirestore.instance
  //       .collection("customer")
  //       .doc("p7EGGN5PWnD0bXcl9apb");

  //   await doc.get().then((value) {
  //     print(value.data());
  //   });
  // }
//  var formdata = fromstat.currentState!;
  @override
  void initState() {
    key = GlobalKey<FormState>();
    // fromstat = new GlobalKey<FormState>();
    setNumPass();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    super.initState();
  }

  // int currentCarouselIndex = 0;
  // Timer t = Timer(const Duration(seconds: 2), () {
  //   setState(() => currentCarouselIndex++);
  //   print(currentCarouselIndex);
  // });
  // var numPass = 0;
  var messageError = "";
  late PageController _pageController;

  // ignore: non_constant_identifier_names

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
            flex: 6,
            child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assest/image/imageKaian.png",
                      color: primary,
                    ),
                  ),
                ))),
        const SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Container(
            width: 400,
            margin:
                const EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
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
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "ابحث برقم الجواز",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: primary,
                  ),
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () {
                      if (numPass.text.isEmpty || numPass.text.length < 9) {
                        MySnackBar(scaffold);
                      } else {
                        print("Passbord is :" + numPass.text);
                        Provider.of<passpordProvider>(context, listen: false)
                            .setNumberPassbord(numPass.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondScreen()));
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
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
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
          height: 10,
        ),
        CardBottom(context),
      ]),
      // bottomNavigationBar: CurvedNavigationBar(
      //   items: <Widget>[
      //     Icon(Icons.add, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       index = index;
      //     });
      //   },
      // ),
    );
  }

  Expanded CardBottom(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        // height: 600,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        margin: EdgeInsets.only(right: 20),
        child: ListView(scrollDirection: Axis.horizontal, children: [
          CatagoryCount(
            titleCurd: "لماذا كيان",
            myIcon: const Icon(
              Icons.diamond,
              color: Colors.blue,
              size: 50,
            ),
            press: () {
              Navigator.of(context).pushNamed(Screen2.routeName);
              Provider.of<ProviderService>(context, listen: false)
                  .setNumberScreen(1.toString());
              // setState(() {
              //   selectScreen2(context, 1);
              // });
            },
          ),
          CatagoryCount(
            titleCurd: "شركائنا",
            myIcon: const Icon(
              Icons.handshake,
              color: const Color.fromARGB(255, 22, 51, 26),
              size: 50,
            ),
            press: () {
              //           setState(() {
              //   selectScreen2(context, 2);
              // });
              Navigator.of(context).pushNamed(Screen2.routeName);
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
              Navigator.of(context).pushNamed(Screen2.routeName);
              Provider.of<ProviderService>(context, listen: false)
                  .setNumberScreen(3.toString());

              // setState(() {
              //   selectScreen2(context, 3);
              // });
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
                setState(() {
                  Navigator.of(context).pushNamed(SrvessScreen.routeName);
                });
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
          height: size.height / 4.8,
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
