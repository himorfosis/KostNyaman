import 'package:flutter/material.dart';
import 'package:kost_nyaman/models/CityModel.dart';
import 'package:kost_nyaman/models/SpaceModel.dart';
import 'package:kost_nyaman/models/TipsModel.dart';
import 'package:kost_nyaman/providers/SpaceProvider.dart';
import 'package:kost_nyaman/theme.dart';
import 'package:kost_nyaman/widgets/bottom_navbar_item.dart';
import 'package:kost_nyaman/widgets/city_card.dart';
import 'package:kost_nyaman/widgets/space_card.dart';
import 'package:kost_nyaman/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fetch data spaces
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecomendedSpaces();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            // NOTE: TITLE / HEADER
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: textBlackStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kostan yang nyaman',
                style: textGrayStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Popular Cities',
                  style: textRegularStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    CityModel(
                      id: 1,
                      name: "Jakarta",
                      imageUrl: "assets/img_city1.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    CityModel(
                        id: 1,
                        name: "Yogyakarta",
                        imageUrl: "assets/img_city3.png",
                        isFavorite: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    CityModel(
                      id: 1,
                      name: "Surabaya",
                      imageUrl: "assets/img_city2.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    CityModel(
                      id: 1,
                      name: "Bandung",
                      imageUrl: "assets/img_city1.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    CityModel(
                        id: 1,
                        name: "Palembang",
                        imageUrl: "assets/img_city2.png",
                        isFavorite: true),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            // NOTE RECOMMENDED SPACE
            SizedBox(
              height: 30,
            ),
            // NOTE : POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Recomended Space',
                  style: textRegularStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecomendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SpaceModel> data = snapshot.data;
                    int index = 0;
                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 1 ? 0 : 30,
                        ),
                        child: SpaceCard(item),
                      );
                    }).toList());
                    // return Column(
                    //   children: [
                    //     SpaceCard(SpaceModel(
                    //         name: "Kuretakeso Raharjo",
                    //         imageUrl: 'assets/img_space1.png',
                    //         price: '300',
                    //         city: 'Yogyakarta',
                    //         rating: 5)),
                    //     SizedBox(
                    //       height: 30,
                    //     ),
                    //     SpaceCard(SpaceModel(
                    //         name: "Kintamani",
                    //         imageUrl: 'assets/img_space3.png',
                    //         price: '500',
                    //         city: 'Bali',
                    //         rating: 5)),
                    //     SizedBox(
                    //       height: 30,
                    //     ),
                    //     SpaceCard(SpaceModel(
                    //         name: "Roemah Eyang",
                    //         imageUrl: 'assets/img_space2.png',
                    //         price: '300',
                    //         city: 'Surakarta',
                    //         rating: 5)),
                    //     SizedBox(
                    //       height: 30,
                    //     ),
                    //   ],
                    // );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // NOTE : TIPS & GUIDELINES
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Tips & Guidance',
                  style: textRegularStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    TipsModel(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/ic_tips1.png',
                        updatedAt: '18 Februari 2021'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TipsCard(
                    TipsModel(
                        id: 1,
                        title: 'Jakarta Fairship',
                        imageUrl: 'assets/ic_tips2.png',
                        updatedAt: '10 Februari 2021'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
      floatingActionButton: // NOTE BOTTOM NAV BAR
          Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: bgBottomBar,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/ic_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
