import 'package:flutter/material.dart';
import 'package:kost_nyaman/models/SpaceModel.dart';
import 'package:kost_nyaman/pages/error_page.dart';
import 'package:kost_nyaman/theme.dart';
import 'package:kost_nyaman/widgets/facilities_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {

  // get data space from space card
  final SpaceModel space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/img_city3.png',
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kuretakeso Hott',
                                  style: textBlackStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: 'Rp 300K',
                                      style: textPrimaryStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: ' / bulan',
                                          style: textRegularStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/ic_star.png',
                                  width: 20,
                                  color: gray,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // NOTE FACILITIES
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Fasilitas Utama',
                          style: textRegularStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilitiesItem(
                              name: 'dapur',
                              imageUrl: 'assets/ic_kitchen.png',
                              total: 2,
                            ),
                            FacilitiesItem(
                              name: 'kamar',
                              imageUrl: 'assets/ic_double_bed.png',
                              total: 3,
                            ),
                            FacilitiesItem(
                              name: 'lemari',
                              imageUrl: 'assets/ic_cupboard.png',
                              total: 3,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photo',
                          style: textRegularStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      //  NOTE : PHOTOS
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Image.asset(
                              'assets/img_pic1.png',
                              height: 90,
                              width: 120,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/img_pic2.png',
                              height: 90,
                              width: 120,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/img_pic3.png',
                              height: 90,
                              width: 120,
                            ),
                            SizedBox(
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Lokasi',
                          style: textRegularStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge, right: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jln. Kappan Sukses No. 20',
                                  style: textGrayStyle.copyWith(fontSize: 16),
                                ),
                                Text(
                                  'Palembang',
                                  style: textGrayStyle.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // link m istana negara
                                launchUrl(
                                    'https://goo.gl/maps/vhWBvKZWWu2audGeA');
                              },
                              child: Image.asset(
                                'assets/btn_location.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 60,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: RaisedButton(
                          onPressed: () {
                            launchUrl('tel:+628123456789');
                          },
                          color: purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          child: Text(
                            'Book Now',
                            style: textWhiteStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back_cirlce_white.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl('url salah');
                    },
                    child: Image.asset(
                      'assets/btn_wishlist_circle_white.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
