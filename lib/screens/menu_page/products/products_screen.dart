import 'package:flutter/material.dart';
// import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:separated_row/separated_row.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../config/my_colors.dart';
import '../../../utils/size_utils.dart';
import 'components/new_product.dart';
import 'components/products_table.dart';
import 'components/top_option.dart';

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
          TopOptions(context),
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

Widget TopOptions(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Wrap(
      alignment: WrapAlignment.start,
      spacing: 25,
      runSpacing: 25,
      children: [
        TopOption(
            icon: Icons.refresh,
            name: "Refresh",
            action: () => print('refresh')),
        TopOption(
            icon: Icons.create_new_folder,
            name: "New group",
            action: () => print('New group')),
        TopOption(
            icon: Icons.drive_file_rename_outline,
            name: "Edit group",
            action: () => print('Edit group')),
        TopOption(
            icon: Icons.folder_delete,
            name: "Delete group",
            action: () => print(MediaQuery.of(context).size.width)),
        TopOption(
          icon: Icons.add,
          name: "New Product",
          action: () => SideSheet.right(
            context: context,
            width: MediaQuery.of(context).size.width < 1000
                ? 450
                : MediaQuery.of(context).size.width * 0.4,
            body: NewProduct(),
          ),
        ),
        TopOption(
            icon: Icons.edit,
            name: "Edit Product",
            action: () => print('Edit Product')),
        TopOption(
            icon: Icons.delete,
            name: "Delete product",
            action: () => print('Delete product')),
        TopOption(
            icon: Icons.print, name: "Print", action: () => print('Print')),
        TopOption(
            icon: Icons.picture_as_pdf,
            name: "Save as PDF",
            action: () => print('Save as PDF')),
        TopOption(
            icon: Icons.tag,
            name: "Price tags",
            action: () => print('Price tags')),
        TopOption(
            icon: Icons.sort, name: "Sorting", action: () => print('Sorting')),
        TopOption(
            icon: Icons.trending_up,
            name: "Mov. avg. price",
            action: () => print('Mov. avg. price')),
        TopOption(
            icon: Icons.file_download,
            name: "Import",
            action: () => print('Import')),
        TopOption(
            icon: Icons.file_upload,
            name: "Export",
            action: () => print('Export')),
        TopOption(icon: Icons.help, name: "Help", action: () => print('Help')),
      ],
    ),
  );
}
