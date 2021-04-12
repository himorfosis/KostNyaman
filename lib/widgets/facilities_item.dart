import 'package:flutter/material.dart';
import 'package:kost_nyaman/theme.dart';

class FacilitiesItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilitiesItem({this.name, this.imageUrl, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: '$total ',
              style: textPrimaryStyle.copyWith(fontSize: 14),
              children: [
                TextSpan(
                  text: name,
                  style: textGrayStyle.copyWith(fontSize: 14),
                ),
              ]),
        ),
      ],
    );
  }
}
