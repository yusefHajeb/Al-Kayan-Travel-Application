import 'dart:convert';

import 'package:flutter/material.dart';

import '../../providers/provider_passboard.dart';
import '../../styles/style.dart';

class DataVisa extends StatelessWidget {
  const DataVisa({
    Key? key,
    required this.filterData,
    required this.size,
  }) : super(key: key);

  final Passbord filterData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Card(
            semanticContainer: false,
            elevation: 20,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(20.0),
            // padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    filterData.name,
                    style: header,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.memory(
                      base64Decode(filterData.image), fit: BoxFit.fill,
                      width: double.infinity,
                      height: 200,
                      // color: Colors.transparent,
                    )),
                // // Container(
                //   child: Image.network(
                //     filterData.image,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    " الاسم : " + filterData.name,
                    style: header2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "  الرقم : " + filterData.phone,
                    style: header2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    " حالة المعاملة : " + filterData.state,
                    style: header2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    " نوع المعاملة : " + filterData.another,
                    style: header2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
