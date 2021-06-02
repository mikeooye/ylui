import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlButtonGroupItem {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonClickCallback onAsyncPressed;
  final YlButtonType type;
  final double width;

  YlButtonGroupItem(
      {@required this.child,
      this.width,
      this.onAsyncPressed,
      this.onPressed,
      @required this.type});

  YlButton asButton(YlButtonSize size) {
    return YlButton.fromType(
      size: size,
      type: type,
      child: child,
      width: width,
      onPressed: onPressed,
      onAsyncPressed: onAsyncPressed,
    );
  }
}

enum YlButtonGroupWeight { equaly, primaryBigger, primaryExpanded }

class YlButtonGroup extends StatelessWidget {
  final List<YlButtonGroupItem> children;
  final YlButtonGroupWeight weight;
  final Color backgroundColor;
  final EdgeInsets padding;

  const YlButtonGroup(
      {Key key,
      this.children,
      this.weight = YlButtonGroupWeight.equaly,
      this.backgroundColor = YlColors.white,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = YlButtonSize.max;
    if (children.length > 1) {
      size = YlButtonSize.large;
    }
    List<Widget> widgets = [];
    var count = children.length;
    for (var i = 0; i < count; i++) {
      var e = children[i];
      Widget widget = e.asButton(size);
      if (weight == YlButtonGroupWeight.equaly) {
        widget = Expanded(
          child: widget,
        );
      } else if (weight == YlButtonGroupWeight.primaryExpanded &&
          e.type == YlButtonType.primary) {
        widget = Expanded(
          child: widget,
        );
      } else if (weight == YlButtonGroupWeight.primaryBigger) {
        int flex = 1;
        int primaryFlex = 2;
        if (e.type == YlButtonType.primary ||
            e.type == YlButtonType.subPrimary) {
          widget = Expanded(
            flex: primaryFlex,
            child: widget,
          );
        } else {
          widget = Expanded(
            flex: flex,
            child: widget,
          );
        }
      }

      if (i > 0) {
        widgets.add(SizedBox(
          width: 8,
        ));
      }
      widgets.add(widget);
    }
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Row(
        children: widgets,
      ),
    );
  }
}