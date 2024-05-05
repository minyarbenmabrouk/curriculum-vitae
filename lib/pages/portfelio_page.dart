import 'package:benmabrouk_minyar/main.dart';
import 'package:benmabrouk_minyar/utils/AppColors.dart';
import 'package:benmabrouk_minyar/utils/text_style.dart';
import 'package:benmabrouk_minyar/utils/common_string.dart';
import 'package:flutter/material.dart';

class PortfelioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Text("Portfolio",
                style: headerTextStyle.copyWith(color: Colors.indigo)),
            Container(
              child: Text("Our various projects accomplished this year :",
                  style: bodyTextStyle),
              margin: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Row(children: <Widget>[
              _itemWidget("1", width),
              _itemWidget("2", width),
              _itemWidget("3", width)
            ]),
            Row(children: <Widget>[
              _itemWidget("4", width),
              _itemWidget("5", width),
              _itemWidget("6", width)
            ]),
          ])),
    );
  }

  Widget _itemWidget(title, width) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            scaffoldkey.currentState?.showBottomSheet((context) {
              return Container(
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Column(
                        // Use Column to stack vertically
                        children: <Widget>[
                          Image.asset('assets/ecommerce.png',
                              width: 24.0,
                              height:
                                  24.0), // Replace 'assets/ecommerce_icon.png' with your actual image path
                          const SizedBox(
                              width: 40.0), // Optional: Add spacing below image
                          Text("Ecommerce /(Laravel,vuejs)",
                              style: subHeaderTextStyle),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Text(
                          "Our extensive catalog boasts an impressive range of electronic components, carefully curated to meet the diverse needs of our customers. From resistors and capacitors to microcontrollers and sensors, we have everything you need to tackle even the most complex projects.",
                          style: bodyTextStyle),
                    ),
                  ],
                ),
              );
            });
          },
          child: Container(
            margin: EdgeInsets.all(3),
            height: 100,
            color: cardBGColor,
            alignment: Alignment.center,
            child: Text(title),
          ),
        ));
  }
}
