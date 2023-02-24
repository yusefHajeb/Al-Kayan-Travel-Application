import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnmiScreen extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<ListAnmiScreen> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('VIEW ANIMATING LISTVIEW'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SlideAnimation2(
                        imgurl: 'd',
                        Name: "S",
                        title: "s",
                      )),
            );
          },
        ),
      ),
    );
  }
}

class SlideAnimation2 extends StatelessWidget {
  final String imgurl;
  final String Name;
  final String title;

  const SlideAnimation2(
      {Key? key, required this.imgurl, required this.Name, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return (
        // appBar: AppBar(
        //     title: Text("Go Back"),
        //     centerTitle: true,
        //     brightness: Brightness.dark),
        AnimationLimiter(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(_w / 30),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 2500),
                          child: Container(
                            margin: EdgeInsets.only(bottom: _w / 50),
                            height: (_w / 4) + 5,
                            child: ListTile(
                              onTap: () {},
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imgurl,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  // color: Colors.transparent,
                                ),
                              ),
                              title: Text(
                                Name,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(title),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                        // horizontalOffset: -300,
                        // verticalOffset: -850,
                        // child: Container(
                        //   margin: EdgeInsets.only(bottom: _w / 20),
                        //   height: _w / 4,
                        //   child: ListTile(
                        //     onTap: () {},
                        //     leading: ClipRRect(
                        //       borderRadius: BorderRadius.circular(10),
                        //       child: Image.asset(
                        //         imgurl,
                        //         fit: BoxFit.cover,
                        //         width: 100,
                        //         height: 100,
                        //         // color: Colors.transparent,
                        //       ),
                        //     ),
                        //     title: Text(
                        //       Name,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //     subtitle: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: <Widget>[
                        //         Text(title),
                        //         SizedBox(height: 10),
                        //       ],
                        //     ),
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black.withOpacity(0.1),
                        //         blurRadius: 40,
                        //         spreadRadius: 10,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  );
                })));
  }
}
