import 'package:flutter/material.dart';

class InfoUserContact extends StatelessWidget {
  const InfoUserContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text("الرقة"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.person_outline_outlined),
              Text("name last"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone_android_outlined),
              Text("0956108642"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email_outlined),
              Text("the.lost.admiral@gmail.com"),
            ],
          ),
        ],
      ),
    );
  }
}
