import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IosPopoverDemo extends StatelessWidget {
  const IosPopoverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlPopover',
      sourceCodePath: 'lib/views/popover_demo.dart',
      bottomSafe: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DemoButtonVerticalGroup(
              items: [
                DemoButtonGroupItem('没按钮', () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (context) => Scaffold(
                      appBar: YlAppBar(
                        title: Text('这是个弹窗'),
                        leading: YlAppBarBackButton(
                          child: Text(
                            '取消',
                          ),
                        ),
                      ),
                      body: Container(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
