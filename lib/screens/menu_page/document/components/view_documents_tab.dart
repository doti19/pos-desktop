import 'package:flutter/material.dart';
import 'package:pos_desktop2/config/my_colors.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'documents_table.dart';

class ViewDocumentsTab extends StatelessWidget {
  const ViewDocumentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TopOptions(),
            ),
            const Divider(),
            BelowOptions(),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Text("Documents (0)", style: TextStyle(fontSize: 30)),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(thickness: 1.0, color: Colors.black),
                )),
              ],
            ),
            const SizedBox(height: 8.0),
            // Container(
            //   width: double.infinity,
            //   // color: Color.fromRGBO(255, 193, 7, 1),
            //   height: 10000,
            //   child: DocumentsTable(),
            // ),
            Container(
              color: MyColors.mainContainer,
              child: const DocumentsTable(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BelowOptions() {
  return Container(
      decoration: BoxDecoration(color: MyColors.mainContainer),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 5,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Products",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,
                                showSearchBox: true,
                                fit: FlexFit.loose,
                                // disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: const ["All Products", "Coffee", "Tea"],
                              // dropdownDecoratorProps: DropDownDecoratorProps(
                              //   dropdownSearchDecoration: InputDecoration(
                              //     labelText: "Menu mode",
                              //     hintText: "country in menu mode",
                              //   ),
                              // ),
                              onChanged: print,
                              selectedItem: "All Products",
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "User",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,
                                fit: FlexFit.loose,
                              ),
                              items: const ["Admin", "Mehari", "Saminas"],
                              onChanged: print,
                              selectedItem: "Admin",
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Cash register",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,
                                fit: FlexFit.loose,
                              ),
                              items: const ["All cash register", "POS"],
                              onChanged: print,
                              selectedItem: "All cash register",
                            ),
                          ),
                        ),

                        //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Customer",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,
                                fit: FlexFit.loose,
                              ),
                              items: const ["All customers", "customer 1"],
                              onChanged: print,
                              selectedItem: "All customers",
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Document Type",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                fit: FlexFit.loose,
                              ),
                              items: const [
                                "All document types",
                                "100 - Purchase",
                                "120 - Stock Return",
                                "200 - Sales ",
                                "220 - Refund",
                                "230 - Proforma",
                                "300 - Inventory Count",
                                "400 - Loss And Damage"
                              ],
                              onChanged: print,
                              selectedItem: "All document types",
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Paid status",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                fit: FlexFit.loose,
                              ),
                              items: const [
                                "All transactions",
                                "Unpaid",
                                "Paid"
                              ],
                              onChanged: print,
                              selectedItem: "All transactions",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Document number",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "External document",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "period",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 25,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.clear,
                      size: 25,
                    ),
                    Text(
                      "Clear",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ));
}

Widget TopOptions() {
  return const Wrap(
    alignment: WrapAlignment.start,
    spacing: 25,
    children: [
      Column(
        children: <Widget>[
          Icon(
            Icons.add,
            size: 30,
          ),
          Text(
            "Add",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Icon(
            Icons.preview,
            size: 30,
          ),
          Text(
            "Preview",
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
        children: [
          Icon(
            Icons.edit,
            size: 30,
          ),
          Text(
            "Edit",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.delete,
            size: 30,
          ),
          Text(
            "Delete",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ],
  );
}
