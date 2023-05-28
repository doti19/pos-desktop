import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';

import '../../../config/my_colors.dart';
import 'components/select_report_tab.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});
  final List<TabData> tabs = [
    TabData(
        text: 'Select report',
        content: const SelectReportTab(),
        closable: false,
        leading: (context, status) => const Icon(Icons.search)),
    TabData(text: 'another page'),
  ];
  @override
  Widget build(BuildContext context) {
    final TabbedView tabbedView = TabbedView(
      controller: TabbedViewController(tabs),
    );
    TabbedViewThemeData themeData = TabbedViewThemeData.dark();
    themeData.tab
      ..textStyle = const TextStyle(fontSize: 15, color: Colors.white)
      ..verticalAlignment = VerticalAlignment.top
      // ..highlightedStatus = TabStatusThemeData(
      //   decoration: BoxDecoration(color: MyColors.primaryVariant),
      // )
      ..selectedStatus = TabStatusThemeData(
          // padding: EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: MyColors.secondaryAppColor))

      // ..decoration = BoxDecoration(color: MyColors.secondaryAppColor)
      ..padding = const EdgeInsets.all(5);
    themeData.contentArea
      .decoration = BoxDecoration(
        color: MyColors.background,
      );
    Widget w = TabbedViewTheme(
      data: themeData,
      child: tabbedView,
    );
    return SafeArea(
      child: w,
    );
  }
}
