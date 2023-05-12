import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';

import 'components/select_report_tab.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});
  final List<TabData> tabs = [
    TabData(
        text: 'View Documents',
        content: SelectReportTab(),
        closable: false,
        leading: (context, status) => Icon(Icons.search)),
    TabData(text: 'hello'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
