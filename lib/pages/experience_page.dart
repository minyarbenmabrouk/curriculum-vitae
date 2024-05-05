import 'package:benmabrouk_minyar/utils/text_style.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Experience professionel",
              style: headerTextStyle,
            ),
            _itemWidget("20 April, 2020", "description"),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(title, description) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            margin: EdgeInsets.only(right: 10),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          ),
          Text(
            title,
            style: subHeaderTextStyle,
          )
        ],
      ),
    );
  }
}
