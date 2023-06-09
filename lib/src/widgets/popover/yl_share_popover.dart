import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlPopoverShareItem {
  final Widget icon;
  final Widget title;
  final VoidCallback action;

  YlPopoverShareItem(
      {required this.icon, required this.title, required this.action});
}

Future<T?> showYlSharePopover<T>(BuildContext context,
    {required List<YlPopoverShareItem> items, RouteSettings? routeSettings}) {
  var body = Container(
    color: YlColors.white,
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 142,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 24),
            itemBuilder: (context, index) => Column(
                  children: [
                    YlTapEffect(
                      radius: BorderRadius.circular(24),
                      onTap: items[index].action,
                      child: Container(
                        height: 48,
                        width: 48,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 32,
                                  color: YlColors.black.withOpacity(0.08))
                            ]),
                        child: items[index].icon,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: YlTextStyles.caption1
                          .copyWith(color: YlColors.black50),
                      child: items[index].title,
                    )
                  ],
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 22,
                ),
            itemCount: items.length),
      ),
      Container(
        height: 8,
        color: YlColors.grey3,
      )
    ]),
  );
  var footer = YlTapEffect(
    onTap: () => Navigator.pop(context),
    child: Container(
      alignment: Alignment.center,
      height: 56,
      child: Text(
        '取消',
        textAlign: TextAlign.center,
        style:
            YlTextStyles.header5.copyWith(color: YlColors.black70, height: 1.3),
      ),
    ),
  );
  var child = YlPopover.close(
    title: Text('分享'),
    body: body,
    footer: footer,
    onClosed: () => Navigator.pop(context),
  );
  return showYlPopover<T>(context, child, routeSettings: routeSettings);
}
