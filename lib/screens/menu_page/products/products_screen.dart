import 'package:flutter/material.dart';
// import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:separated_row/separated_row.dart';

import '../../../config/my_colors.dart';
import 'components/products_table.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
          // Expanded(child: tempWidget()),
        ],
      ),
    );
  }
}

Widget tempWidget() {
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
      tempWidget(),
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
              Icons.create_new_folder,
              size: 30,
            ),
            Text(
              "New group",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.drive_file_rename_outline,
              size: 30,
            ),
            Text(
              "Edit group",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.folder_delete,
              size: 30,
            ),
            Text(
              "Delete group",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.add,
              size: 30,
            ),
            Text(
              "New product",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.edit,
              size: 30,
            ),
            Text(
              "Edit Product",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.delete,
              size: 30,
            ),
            Text(
              "Delete Product",
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
              Icons.tag,
              size: 30,
            ),
            Text(
              "Price tags",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.sort,
              size: 30,
            ),
            Text(
              "Sorting",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.trending_up,
              size: 30,
            ),
            Text(
              "Mov. avg. price",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.file_download,
              size: 30,
            ),
            Text(
              "Import",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(
              Icons.file_upload,
              size: 30,
            ),
            Text(
              "Export",
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
