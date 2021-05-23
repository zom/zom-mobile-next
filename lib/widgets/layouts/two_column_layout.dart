import 'package:fluffychat/config/app_config.dart';
import 'package:flutter/material.dart';

class TwoColumnLayout extends StatelessWidget {
  final Widget mainView;
  final Widget sideView;

  const TwoColumnLayout(
      {Key key, @required this.mainView, @required this.sideView})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= AppConfig.columnWidth * 2) {
      return mainView;
    }
    return Scaffold(
      body: ScaffoldMessenger(
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              width: 360.0,
              child: mainView,
            ),
            Container(
              width: 1.0,
              color: Theme.of(context).dividerColor,
            ),
            Expanded(
              child: ClipRRect(
                child: sideView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}