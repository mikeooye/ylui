import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class FloatingBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlFloatingBottom',
      contentPadding: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(child: Container()),
          YlFloatingBottom(
            child: YlButton.fromType(
              size: YlButtonSize.max,
              type: YlButtonType.primary,
              child: Text('Button'),
            ),
          )
        ],
      ),
    );
  }
}