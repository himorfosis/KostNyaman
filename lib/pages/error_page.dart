import 'package:flutter/material.dart';
import 'package:kost_nyaman/pages/home_page.dart';
import 'package:kost_nyaman/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_404.png',
                width: 300,
                height: 96,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: textBlackStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were \nrequested is already gone',
                style: textGrayStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 60,
                width: 210,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Back to Home',
                    style: textWhiteStyle.copyWith(fontSize: 16),
                  ),
                  color: purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
