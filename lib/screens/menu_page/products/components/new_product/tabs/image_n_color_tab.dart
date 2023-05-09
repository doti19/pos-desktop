import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../config/my_colors.dart';

class ImageAndColor extends StatefulWidget {
  const ImageAndColor({super.key});

  @override
  State<ImageAndColor> createState() => _ImageAndColorState();
}

class _ImageAndColorState extends State<ImageAndColor> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());
  // bool _taxHasError = false;
  bool _costHasError = false;
  bool _markupHasError = false;
  bool _salePriceHasError = false;
  List<ColorItem> colorOptions = [
    ColorItem(color: const Color.fromRGBO(210, 180, 140, 1), name: "Tan"),
    ColorItem(color: const Color.fromRGBO(128, 203, 196, 1), name: "Teal"),
    ColorItem(color: const Color.fromRGBO(216, 191, 216, 1), name: "Thistle"),
    ColorItem(color: const Color.fromRGBO(255, 99, 71, 1), name: "Tomato"),
    ColorItem(color: const Color.fromRGBO(0, 0, 0, 0), name: "Transparent"),
    ColorItem(color: const Color.fromRGBO(48, 213, 200, 1), name: "Turquoise"),
    ColorItem(color: const Color.fromRGBO(127, 0, 255, 1), name: "Violet"),
    ColorItem(color: const Color.fromRGBO(245, 222, 179, 1), name: "Wheat"),
    ColorItem(color: const Color.fromRGBO(255, 255, 255, 1), name: "White"),
    ColorItem(
        color: const Color.fromRGBO(245, 245, 245, 1), name: "WhiteSmoke"),
    ColorItem(color: const Color.fromRGBO(255, 255, 0, 1), name: "Yellow"),
    ColorItem(
        color: const Color.fromRGBO(154, 205, 50, 1), name: "YellowGreen"),
  ];

  // Uint8List imageValue =0;
  String _pathText = '';
  dynamic imageFile = NetworkImage('');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: FormBuilder(
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
              SizedBox(
                width: 200,
                child: FormBuilderDropdown<String>(
                  // key: UniqueKey(),
                  dropdownColor: Colors.black87,
                  focusColor: Colors.black12,
                  name: 'color',

                  decoration: const InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    labelText: 'Color',
                    // suffix: _groupHasError
                    //     ? const Icon(Icons.error)
                    //     : const Icon(Icons.check),
                    hintText: 'Select color',
                  ),
                  initialValue: colorOptions[0].name,
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required()]),
                  items: colorOptions
                      .map((colorItem) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: colorItem.name,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    color: colorItem.color,
                                    width: 15,
                                    height: 15),
                                SizedBox(width: 15),
                                Text(
                                  colorItem.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                  // onChanged: (val) {
                  //   setState(() {
                  //     _taxHasError =
                  //         !(_formKey.currentState?.fields['tax_$id']?.validate() ??
                  //             false);
                  //   });
                  // },
                  valueTransformer: (val) => val?.toString(),
                ),
              ),
              const Divider(),
              const SizedBox(height: 15),
              Text('Image'),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);

                      if (result != null) {
                        setState(() {
                          _pathText = result.files.first.path.toString();

                          imageFile = FileImage(File(_pathText));
                        });
                        // PlatformFile file = result.files.first;
                        // setState(() {
                        //   imageValue = file.bytes!;
                        // });
                      }
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                          style: BorderStyle.solid)),
                    ),
                    child: Text('Browse'),
                  ),
                  SizedBox(width: 25),
                  OutlinedButton(
                      onPressed: _pathText == ''
                          ? null
                          : () {
                              setState(() {
                                _pathText = '';
                              });
                            },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                            style: BorderStyle.solid)),
                      ),
                      child: Text('Clear',
                          style: TextStyle(
                              color:
                                  _pathText == '' ? Colors.grey : Colors.blue)))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: _pathText == ''
                    ? const Center(
                        child: Text(
                          'No image selected',
                        ),
                      )
                    : Image(image: imageFile),
              ),
              // Image.file(null),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorItem {
  final Color color;
  final String name;

  ColorItem({required this.color, required this.name});
}
