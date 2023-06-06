import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_windows/image_picker_windows.dart';
// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../../../../../../blocs/product/product_bloc.dart';
import '../../../../../../config/my_colors.dart';
import '../../../../../../models/product/product.dart';

// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// import '../../../../../../db/database_adapter.dart';

class ImageAndColor extends StatelessWidget {
  final formKey;
  ImageAndColor({required this.formKey, super.key});

  bool autoValidate = true;

  bool readOnly = false;

  bool showSegmentedControl = true;

  // final widget.formKey = GlobalKey<FormBuilderState>();
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
  Uint8List? fileBytes;

  String _pathText = '';

  ////////
  // List<PickedFile>? _imageFileList;

  // This must be called from within a setState() callback
  // void _setImageFileListFromFile(PickedFile? value) {
  //   _imageFileList = value == null ? null : <PickedFile>[value];
  // }

  // dynamic _pickImageError;
  // final ImagePickerPlatform _picker = ImagePickerPlatform.instance;

  // String? _retrieveDataError;

// Future<void> _handleMultiImagePicked(BuildContext context) async {
//     await _displayPickImageDialog(context,
//         (double? maxWidth, double? maxHeight, int? quality) async {
//       try {
//         final List<PickedFile>? pickedFileList = await _picker.pickMultiImage(
//           maxWidth: maxWidth,
//           maxHeight: maxHeight,
//           imageQuality: quality,
//         );
//         setState(() {
//           _imageFileList = pickedFileList;
//         });
//       } catch (e) {
//         setState(() {
//           _pickImageError = e;
//         });
//       }
//     });
//   }

// Future<void> _handleSingleImagePicked(
//       BuildContext context, ImageSource source) async {
//     await _displayPickImageDialog(context,
//         (double? maxWidth, double? maxHeight, int? quality) async {
//       try {
//         final PickedFile? pickedFile = await _picker.pickImage(
//           source: source,
//           maxWidth: maxWidth,
//           maxHeight: maxHeight,
//           imageQuality: quality,
//         );
//         setState(() {
//           _setImageFileListFromFile(pickedFile);
//         });
//       } catch (e) {
//         setState(() {
//           _pickImageError = e;
//         });
//       }
//     });
//   }

  // final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  // final TextEditingController maxWidthController = TextEditingController();
  // final TextEditingController maxHeightController = TextEditingController();
  // final TextEditingController qualityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
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
                initialValue: colorOptions[4].name,
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
                              const SizedBox(width: 15),
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
                //         !(widget.formKey.currentState?.fields['tax_$id']?.validate() ??
                //             false);
                //   });
                // },
                valueTransformer: (val) => val?.toString(),
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            const Text('Image'),
            Row(
              children: [
                FormBuilderField(
                    name: 'image',
                    builder: (FormFieldState<dynamic> field) {
                      return OutlinedButton(
                        onPressed: () async {
                          // _pickImage(context);
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(type: FileType.image);

                          if (result != null) {
                            // fileBytes = result.files.first.bytes;
                            _pathText = result.files.first.path.toString();

                            // imageFile = FileImage(File(_pathText));

                            fileBytes = await File(_pathText).readAsBytes();
                            field.didChange(fileBytes);
                            // print(fileBytes);

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
                        child: const Text('Browse'),
                      );
                    }),
                const SizedBox(width: 25),
                // ElevatedButton(
                //   onPressed: () {
                //     if (fileBytes != null) {
                //       context.read<ProductBloc>().add(AddDataEvent(
                //           product: Product()
                //             ..name = 'saved product'
                //             ..image = fileBytes!));
                //     } else {
                //       print('goddamn fileBytes');
                //     }
                //   },
                //   child: const Text('save'),
                // ),
                const SizedBox(width: 25),
                OutlinedButton(
                  onPressed: formKey.currentState!.fields['image']?.value ==
                          null
                      ? null
                      : () {
                          formKey.currentState!.fields['image'].didChange(null);
                        },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                        style: BorderStyle.solid)),
                  ),
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: Colors.blue,
                      // formKey.currentState!.fields['image']?.value == null
                      //     ? Colors.grey
                      //     : Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                if (state is ProductInitial) {
                  context.read<ProductBloc>().add(const FetchAllProductEvent());
                  // BlocProvider.of<ProductBloc>(context).add(const FetchAllProductEvent());
                }
                if (state is DisplayAllProductsState) {
                  if (state.products.isNotEmpty) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: state.products.length,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                    onTap: () {
                                      context.read<ProductBloc>().add(
                                          DeleteSpecificProductEvent(
                                              product: state.products[i]));
                                    },
                                    child: Container(
                                        height: 20,
                                        margin:
                                            const EdgeInsets.only(bottom: 14),
                                        child: Card(
                                          elevation: 10,
                                          color: i % 2 == 0
                                              ? Colors.blueAccent
                                              : Colors.brown,
                                          child: state.products[i].image != null
                                              ? Image.memory(
                                                  state.products[i].image!)
                                              : Center(
                                                  child: Text(
                                                      'empty'.toUpperCase(),
                                                      style: const TextStyle(
                                                          fontSize: 21))),
                                        )));
                              }),
                        ),
                      ],
                    );
                  }
                }
                return Center(
                    child: Text('empty'.toUpperCase(),
                        style: const TextStyle(fontSize: 21)));
              }),
            ),
            // Image.file(null),
          ],
        ),
      ),
    );
  }
}

// Future<void> _pickImage(BuildContext context) async {
//   ImagePicker imagePicker = ImagePicker();
//   XFile? image;
//   XFile? pickedFile;
//   Future getImage(ImageSource src) async {
//     pickedFile = await imagePicker.pickImage(source: src);
//   }

//   if (pickedFile == null) {
//     print('it is fucking null');
//     return;
//   }
//   Uint8List imageBytes = await pickedFile!.readAsBytes();
//   context.read<ProductBloc>().add(AddDataEvent(
//       product: Product()
//         ..name = 'new product'
//         ..image = imageBytes));
//   // adapter.storeImage(imageBytes);
// }

// Future<List<Uint8List>?> _readImagesFromDatabase() async {
//   return adapter.getImages();
// }
class ColorItem {
  final Color color;
  final String name;

  ColorItem({required this.color, required this.name});
}
