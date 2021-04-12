import 'package:flutter/material.dart';
import 'package:kost_nyaman/models/SpaceModel.dart';
import 'package:kost_nyaman/pages/space_detail_page.dart';
import 'package:kost_nyaman/theme.dart';

class SpaceCard extends StatelessWidget {
  final SpaceModel space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // send data and navigation to space detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpaceDetailPage(space),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_star.png',
                              height: 14,
                              width: 14,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: textWhiteStyle.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: textBlackStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                    text: 'Rp ${space.price}0K',
                    style: textPrimaryStyle.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' / Bulan',
                        style: textGrayStyle.copyWith(fontSize: 16),
                      ),
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${space.city}, ${space.country}',
                style: textRegularStyle.copyWith(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
