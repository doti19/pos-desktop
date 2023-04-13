import 'package:flutter/material.dart';

import '../../../config/my_colors.dart';
import 'components/products_table.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:resizable_widget/resizable_widget.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Center(child: Text("hellow")),
          TopOptions(),
          // Divider(),
          // Container(child: Center(child: Text("Hello")))
          Expanded(child: MainContentResizable()),
          // SizedBox(height: 2.0),
          // temporary(),
          // Expanded(child: tempWidget()),
        ],
      ),
    );
  }
}

Widget temporary() {
  return Ink(
    width: double.infinity,
    child: Wrap(
      direction: Axis.horizontal,

      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min, // direction: Axis.horizontal,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Switch(value: false, onChanged: null),
                Text("Negative quantity")
              ],
            ),
            Row(
              children: const <Widget>[
                Switch(value: false, onChanged: null),
                Text("Non zero quantity")
              ],
            ),
            Row(
              children: const <Widget>[
                Switch(value: false, onChanged: null),
                Text("Zero quantity")
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          // direction: Axis.horizontal,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
                margin: EdgeInsets.all(8),
                color: Colors.red,
                // width: double.maxFinite,
                child: Text('0')),
            Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
                margin: EdgeInsets.all(8),
                color: Colors.blue,
                // width: double.maxFinite,
                child: Text('0')),
            Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
                margin: EdgeInsets.all(8),
                color: Colors.green,
                // width: double.maxFinite,
                child: Text('0')),
          ],
        ),
      ],
    ),
  );
}

Widget tableWidget() {
  return Ink(
    // height: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        temporary(),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.qr_code, size: 20, color: Colors.white)),
              const VerticalDivider(),
              const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.pin, size: 20, color: Colors.white)),
              const VerticalDivider(),
              Ink(
                color: Colors.blue,
                child: const IconButton(
                    onPressed: null,
                    icon:
                        Icon(Icons.local_offer, size: 20, color: Colors.white)),
              ),
              const VerticalDivider(),
              const Expanded(
                flex: 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(2),
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Product Name"),
                    ),
                    // labelText: "Product Name",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const VerticalDivider(),
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                      TextSpan(
                          text: 'Products count: ',
                          style: TextStyle(fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                              text: '1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                      textAlign: TextAlign.end),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: const ProductsTable()),
      ],
    ),
  );
}

Widget ContentHeader() {
  return Row(
    children: const <Widget>[],
  );
}

Widget MainContentResizable() {
  List<Node> nodes = const [
    Node(
      label: 'Products',
      key: 'products',
      expanded: true,
      icon: Icons.folder,
      children: [
        Node(
            label: 'yegna product',
            key: 'd1',
            icon: Icons.folder,
            iconColor: Colors.green),
      ],
    ),
  ];
  TreeViewController treeViewController = TreeViewController(children: nodes);
  return ResizableWidget(
    isHorizontalSeparator: false,
    percentages: const <double>[0.2, 0.8],
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
        child: TreeView(
            controller: treeViewController,
            allowParentSelect: true,
            supportParentDoubleTap: false,

            // onExpansionChanged: _expandNodeHandler,
            // onNodeTap: (key) {
            //   setState(() {
            //     _treeViewController = _treeViewController.copyWith(selectedKey: key);
            //   });
            // },
            theme: _treeViewTheme),
      ),
      tableWidget(),
    ],
  );
}

TreeViewTheme _treeViewTheme = const TreeViewTheme(
  verticalSpacing: 5,
  expanderTheme: ExpanderThemeData(
    type: ExpanderType.plusMinus,
    modifier: ExpanderModifier.none,
    position: ExpanderPosition.start,
    color: Colors.white,
    size: 20,
  ),
  labelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.3,
  ),
  parentLabelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    color: Colors.white60,
  ),
  iconTheme: IconThemeData(
    size: 18,
    color: Colors.white38,
  ),
  colorScheme: ColorScheme.light(),
);

void _printResizeInfo(List<WidgetSizeInfo> dataList) {
  // ignore: avoid_print
  // if (dataList[1].percentage < 0.35) {
  //   dataList[1] = WidgetSizeInfo(450, 0.35);
  // }
  print(dataList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "));
}

Widget TopOptions() {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Wrap(
      alignment: WrapAlignment.start,
      spacing: 25,
      runSpacing: 25,
      children: [
        Column(
          children: const <Widget>[
            Icon(
              Icons.refresh,
              size: 30,
            ),
            Text(
              "Refresh",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.history,
              size: 30,
            ),
            Text(
              "Stock history",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.print,
              size: 30,
            ),
            Text(
              "print",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.picture_as_pdf,
              size: 30,
            ),
            Text(
              "Save as PDF",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.view_compact,
              size: 30,
            ),
            Text(
              "Excel",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "icon will be changed later",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.fact_check,
              size: 30,
            ),
            Text(
              "Inventory count report",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.rate_review,
              size: 30,
            ),
            Text(
              "Quick Inventory",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.help,
              size: 30,
            ),
            Text(
              "Help",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    ),
  );
}
