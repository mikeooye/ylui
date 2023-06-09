import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'code_viewer.dart';

class DemoPage extends StatelessWidget {
  final Widget? child;
  final String? title;
  final EdgeInsets? contentPadding;
  final String? sourceCodePath;
  final bool bottomSafe;
  final Color? backgroundColor;

  const DemoPage(
      {Key? key,
      this.title,
      this.child,
      this.contentPadding,
      this.sourceCodePath,
      this.bottomSafe = true,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? CupertinoColors.systemBackground,
      appBar: YlAppBar(
        title: Text(
          title ?? '',
        ),
        actions: [
          if (sourceCodePath != null)
            YlAppBarButton(
              child: Icon(CupertinoIcons.chevron_left_slash_chevron_right),
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => CodeViewerPage(
                      filePath: sourceCodePath!,
                    ),
                  )),
            )
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: bottomSafe,
        child: Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: child,
        ),
      ),
    );
  }
}

toPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
