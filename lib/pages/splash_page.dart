import 'package:flutter/material.dart';
import 'package:kost_nyaman/pages/home_page.dart';
import 'package:kost_nyaman/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/img_splash.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Find Cozy House\nto Stay and Happy',
                      style: textBlackStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Stop membuang banyak waktu \npada tempat yang tidak habitable',
                      style: textGrayStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 210,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          'Explore Now',
                          style: TextStyle(
                            color: textWhite,
                            fontSize: 18,
                          ),
                        ),
                        color: purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
