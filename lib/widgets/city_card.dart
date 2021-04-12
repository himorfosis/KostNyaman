import 'package:flutter/material.dart';
import 'package:kost_nyaman/models/CityModel.dart';
import 'package:kost_nyaman/theme.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: bgCard,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isFavorite
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                              child: Image.asset(
                            'assets/ic_star.png',
                            height: 18,
                            width: 18,
                          )),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: textBlackStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
