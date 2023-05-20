import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:resizable_widget/resizable_widget.dart';

import '../../../../config/my_colors.dart';
import 'filter_section.dart';

class SelectReportTab extends StatelessWidget {
  const SelectReportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContentResizable();
    // return FilterSection();
  }
}

void _printResizeInfo(List<WidgetSizeInfo> dataList) {
  // ignore: avoid_print
  print(dataList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "));
}

Widget MainContentResizable() {
  return ResizableWidget(
    isHorizontalSeparator: false,
    percentages: const <double>[0.75, 0.25],
    isDisabledSmartHide: false,
    separatorColor: Colors.white12,
    separatorSize: 5,
    onResized: _printResizeInfo,
    children: [
      // Text("hellow"),
      Container(
        decoration: BoxDecoration(
          color: MyColors.mainContainer,
        ),
        // child: TreeView(nodes: [
        //   TreeNode(content: Text("Products"), children: [
        //     TreeNode(content: Text("child21")),
        //   ]),
        // ]),
        child: Text('yo '),
      ),
      FilterSection(),
    ],
  );
}
