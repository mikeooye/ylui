import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YlColors.grey3,
      body: CustomScrollView(
        slivers: [
          YlSliverAppBar(title: 'AppBarView'),
          SliverToBoxAdapter(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  YlAppBar(
                    title: Text('选择远程工作原因原因原因'),
                    leading: YlAppBarBackButton(
                      backgroundColor: Colors.yellow[100],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YlAppBar(
                    title: Text('选择远程工作原因'),
                    leading: YlAppBarBackButton(
                      backgroundColor: Colors.yellow[100],
                    ),
                    actions: [
                      YlAppBarButton(
                        backgroundColor: Colors.green[100],
                        child: YlButton.fromType(
                          size: YlButtonSize.small,
                          type: YlButtonType.primary,
                          child: Text('保存'),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YlAppBar(
                    title: Text('圆领官方'),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.red,
                    leading: YlAppBarBackButton(),
                    actions: [
                      YlAppBarButton(
                        child: Icon(CupertinoIcons.ellipsis),
                        backgroundColor: Colors.pink[100],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YlAppBar(
                    leading: YlAppBarBackButton(
                      backgroundColor: Colors.yellow[100],
                    ),
                    actions: [
                      YlAppBarButton(
                        child: Icon(
                          CupertinoIcons.chart_pie,
                        ),
                        backgroundColor: Colors.yellow[100],
                      ),
                      YlAppBarButton(
                        child: Icon(CupertinoIcons.share),
                        backgroundColor: Colors.red[100],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YlAppBar(
                    leading: YlAppBarBackButton(
                      backgroundColor: Colors.yellow[100],
                      child: Text('取消'),
                    ),
                    actions: [
                      YlAppBarButton(
                        child: Icon(
                          CupertinoIcons.chart_pie,
                        ),
                        backgroundColor: Colors.yellow[100],
                      ),
                      YlAppBarButton(
                        child: Icon(CupertinoIcons.share),
                        backgroundColor: Colors.red[100],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YlAppBar(
                    leading: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "大标题",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    leadingWidth: 100,
                    automaticallyImplyLeading: false,
                    actions: [
                      YlAppBarButton(
                        child: Icon(
                          CupertinoIcons.chart_pie,
                        ),
                        backgroundColor: Colors.yellow[100],
                      ),
                      YlAppBarButton(
                        child: Icon(CupertinoIcons.share),
                        backgroundColor: Colors.red[100],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
