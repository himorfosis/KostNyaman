import 'package:flutter/material.dart';
import 'package:kost_nyaman/models/TipsModel.dart';
import 'package:kost_nyaman/theme.dart';

class TipsCard extends StatelessWidget {
  final TipsModel tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: textBlackStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: textGrayStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            size: 24,
            color: gray,
          ),
        )
      ],
    );
  }
}
