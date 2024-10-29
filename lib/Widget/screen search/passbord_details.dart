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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(filterData.image),
              radius: 80,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoSection('الاسم', filterData.name),
          _buildInfoSection('الرقم', filterData.phone),
          _buildInfoSection('حالة المعاملة', filterData.state),
          _buildInfoSection('نوع المعاملة', filterData.another),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: header2,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: paragraph2,
          ),
          const Divider(color: yShadowColor),
        ],
      ),
    );
  }
}
