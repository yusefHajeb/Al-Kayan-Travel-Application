import 'dart:convert';

import 'package:flutter/material.dart';

import '../../providers/provider_passboard.dart';
import '../../styles/style.dart';

class PassbordDetails extends StatelessWidget {
  const PassbordDetails({
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  filterData.name,
                  style: header,
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.memory(
                      base64Decode(filterData.image),
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 200,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  " الاسم : " + filterData.name,
                  style: header2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "  الرقم : " + filterData.phone,
                  style: header2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " حالة المعاملة : " + filterData.state,
                  style: header2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " نوع المعاملة : " + filterData.another,
                  style: header2,
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
