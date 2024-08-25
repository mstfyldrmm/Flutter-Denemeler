import 'package:flutter/material.dart';
import 'package:flutter_application_1/stopWatchApp/theme.dart';


class LapsWidget extends StatelessWidget {
  final List widgetList;
  const LapsWidget({Key? key, required this.widgetList}) : super(key: key);

  final double _containerSize = 400;
  final double _containerBorderRadius = 8;
  final double _listViewPadding = 16.0;
  final double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _containerSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_containerBorderRadius),
          color: ProjectColor().spaceColor),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(_listViewPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Tur ${index + 1}',
                  style: TextStyle(
                      color: ProjectColor().textColor, fontSize: _fontSize),
                ),
                Text(
                  "${widgetList[index]}",
                  style: TextStyle(
                      color: ProjectColor().textColor, fontSize: _fontSize),
                )
              ],
            ),
          );
        },
        itemCount: widgetList.length,
      ),
    );
  }
}
