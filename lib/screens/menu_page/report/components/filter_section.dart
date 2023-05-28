import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../config/my_colors.dart';
import 'date_picker.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());

  // List<String> groupOptions = ['Products', 'Products/stg'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Filter',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            FormBuilder(
              key: _formKey,
              // enabled: false,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(_formKey.currentState!.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customers & suppliers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        // disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["All", "Customer A"],
                      // dropdownDecoratorProps: DropDownDecoratorProps(
                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Menu mode",
                      //     hintText: "country in menu mode",
                      //   ),
                      // ),
                      onChanged: print,
                      selectedItem: "All",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: false,
                        fit: FlexFit.loose,
                        // disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["All", "Admin", "Cashier A"],
                      // dropdownDecoratorProps: DropDownDecoratorProps(
                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Menu mode",
                      //     hintText: "country in menu mode",
                      //   ),
                      // ),
                      onChanged: print,
                      selectedItem: "All",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cash register",
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        // showSearchBox: true,
                        fit: FlexFit.loose,
                        // disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["All", "POS"],
                      // dropdownDecoratorProps: DropDownDecoratorProps(
                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Menu mode",
                      //     hintText: "country in menu mode",
                      //   ),
                      // ),
                      onChanged: print,
                      selectedItem: "All",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Product",
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        // disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["All", "Shay", "Buna", "Burger"],
                      // dropdownDecoratorProps: DropDownDecoratorProps(
                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Menu mode",
                      //     hintText: "country in menu mode",
                      //   ),
                      // ),
                      onChanged: print,
                      selectedItem: "All",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customers & suppliers",
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        // disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["Products", "Products/group1"],
                      // dropdownDecoratorProps: DropDownDecoratorProps(
                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Menu mode",
                      //     hintText: "country in menu mode",
                      //   ),
                      // ),
                      onChanged: print,
                      selectedItem: "Products",
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: FormBuilderSwitch(
                      title: const Text('Include subgroups'),
                      name: 'include_subgroups',
                      decoration: const InputDecoration(border: InputBorder.none),
                      activeColor: MyColors.primary,
                      activeTrackColor: MyColors.primaryVariant,
                      controlAffinity: ListTileControlAffinity.leading,
                      initialValue: true,
                      onChanged: _onChanged,
                    ),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.noHeader,
                        body: const Center(
                          child: MyDatePicker(),
                        ),
                      ).show();
                      // late AwesomeDialog dialog;
                      // dialog = AwesomeDialog(
                      //   context: context,
                      //   animType: AnimType.scale,
                      //   dialogType: DialogType.info,
                      //   keyboardAware: true,
                      //   body: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       children: <Widget>[
                      //         Text(
                      //           'Form Data',
                      //           style: Theme.of(context).textTheme.headline6,
                      //         ),
                      //         const SizedBox(
                      //           height: 10,
                      //         ),
                      //         Material(
                      //           elevation: 0,
                      //           color: Colors.blueGrey.withAlpha(40),
                      //           child: TextFormField(
                      //             autofocus: true,
                      //             minLines: 1,
                      //             decoration: const InputDecoration(
                      //               border: InputBorder.none,
                      //               labelText: 'Title',
                      //               prefixIcon: Icon(Icons.text_fields),
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 10,
                      //         ),
                      //         Material(
                      //             elevation: 0,
                      //             color: Colors.blueGrey.withAlpha(40),
                      //             child: TextFormField(
                      //               autofocus: true,
                      //               keyboardType: TextInputType.multiline,
                      //               minLines: 2,
                      //               maxLines: null,
                      //               decoration: const InputDecoration(
                      //                 border: InputBorder.none,
                      //                 labelText: 'Description',
                      //                 prefixIcon: Icon(Icons.text_fields),
                      //               ),
                      //             )),
                      //         const SizedBox(
                      //           height: 10,
                      //         ),
                      //         AnimatedButton(
                      //           isFixedHeight: false,
                      //           text: 'Close',
                      //           pressEvent: () {
                      //             dialog.dismiss();
                      //           },
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )..show();
                    },
                    icon: const Icon(Icons.calendar_month, size: 20),
                    label: const Text(
                      '5/1/2023-5/12/2023',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                      spacing: 5.0,
                      alignment: WrapAlignment.spaceAround,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        _myOutlineButton(
                            name: 'Show report',
                            icon: const Icon(Icons.search, size: 20),
                            onPressed: () {
                              print('Show report');
                            },
                            context: context),
                        _myOutlineButton(
                            name: 'Print',
                            icon: const Icon(Icons.print, size: 20),
                            onPressed: () {
                              print('Print');
                            },
                            context: context),
                        _myOutlineButton(
                            name: 'Excel',
                            icon: const Icon(Icons.note_add, size: 20),
                            onPressed: () {
                              print('Excel');
                            },
                            context: context),
                        _myOutlineButton(
                            name: 'PDF',
                            icon: const Icon(Icons.picture_as_pdf, size: 20),
                            onPressed: () {
                              print('PDF');
                            },
                            context: context),
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myOutlineButton(
      {required String name,
      required Icon icon,
      required Function()? onPressed,
      required BuildContext context}) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        // minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 45)
        // minimumSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
        // maximumSize: const Size(20, 20)
      ),
      icon: icon,
      label: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
