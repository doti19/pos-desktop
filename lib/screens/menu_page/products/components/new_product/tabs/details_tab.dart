import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pos_desktop2/config/my_colors.dart';
import 'package:textfield_tags/textfield_tags.dart';
// import 'package:flutter_tags/flutter_tags.dart';
import 'package:super_tag_editor/tag_editor.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';

import '../../InputChipExample.dart';

import 'package:material_tag_editor/tag_editor.dart' as tag;
import 'package:material_tag_editor/tag_editor_layout_delegate.dart';
import 'package:material_tag_editor/tag_layout.dart';
import 'package:material_tag_editor/tag_render_layout_box.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({super.key});

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _codeHasError = false;
  bool _barcodeHasError = false;
  bool _nameHasError = true;
  bool _unitOfMeasurementHasError = false;
  bool _descriptionHasError = false;

  bool _groupHasError = false;

  List<String> genderOptions = ['Products', 'Products/stg'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  late double _distanceToField;
  final TextfieldTagsController _controller = TextfieldTagsController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  _onDelete(index) {
    setState(() {
      // values.removeAt(index);
      _values.removeAt(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  // final TextEditingController _textEditingController = TextEditingController();
  final List<String> values = [];

  List _items = [];
  double _fontSize = 14;

  @override
  void initState() {
    super.initState();
  }

  List<String> _myList = [];
  List<String> _myListCustom = [];

  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  /// This is just an example for using `TextEditingController` to manipulate
  /// the the `TextField` just like a normal `TextField`.
  _onPressedModifyTextField() {
    // final text =
    // DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10);
    final String text = DateTime.now()
            .toString()
            .replaceAll(RegExp("-|:| "), '')
            .split(".")[0]
            .substring(2) +
        DateTime.now().toString().split(".")[1].substring(0, 1);
    // _textEditingController.text = text;
    // _textEditingController.value = _textEditingController.value.copyWith(
    //   text: text,
    //   selection: TextSelection(
    //     baseOffset: text.length,
    //     extentOffset: text.length,
    //   ),
    // );
    setState(() {
      _values.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      // appBar: AppBar(title: const Text('Form Builder Example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                // initialValue: const {
                //   'movie_rating': 5,
                //   'best_language': 'Dart',
                //   'age': '13',
                //   'gender': 'Male',
                //   'languages_filter': ['Dart']
                // },
                // skipDisabled: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'name',

                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey
                                  .currentState?.fields['name']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        // FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(70),
                        FormBuilderValidators.min(1)
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    // const SizedBox(height: 15),
                    // ChipTags(
                    //   list: _myList,
                    //   createTagOnSubmit: true,
                    // ),
                    Divider(),
                    //Customised add any character using which you want to seprate
                    // ChipTags(
                    //   list: _myListCustom,
                    //   chipColor: MyColors.secondaryAppColor,
                    //   iconColor: Colors.black,
                    //   textColor: Colors.white,
                    //   chipPosition: ChipPosition.below,
                    //   // separator: " ",
                    //   createTagOnSubmit: true,
                    //   decoration: InputDecoration(
                    //     hintText: "Barcode",
                    //   ),
                    //   keyboardType: TextInputType.text,
                    // ),
                    // InputChipExample(),
                    SizedBox(
                      width: 200,
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'code',

                        decoration: const InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          labelText: 'Code',
                          // suffixIcon: _codeHasError
                          //     ? const Icon(Icons.error, color: Colors.red)
                          //     : const Icon(Icons.check, color: Colors.green),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _codeHasError = !(_formKey
                                    .currentState?.fields['code']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          // FormBuilderValidators.required(),

                          // FormBuilderValidators.max(70),
                          // FormBuilderValidators.min(0)
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        tag.TagEditor(
                          length: _values.length,
                          controller: _textEditingController,
                          focusNode: _focusNode,
                          delimiters: [',', ' '],
                          hasAddButton: true,
                          resetTextOnSubmitted: true,
                          // This is set to grey just to illustrate the `textStyle` prop
                          textStyle: const TextStyle(color: Colors.white),
                          onSubmitted: (outstandingValue) {
                            setState(() {
                              _values.add(outstandingValue);
                            });
                          },
                          inputDecoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Barcode',
                          ),
                          onTagChanged: (newValue) {
                            setState(() {
                              _values.add(newValue);
                            });
                          },
                          tagBuilder: (context, index) => _Chip(
                            index: index,
                            label: _values[index],
                            onDeleted: _onDelete,
                          ),
                          // InputFormatters example, this disallow \ and /
                          inputFormatters: [
                            // FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                          ],
                        ),
                        const Divider(),
                        // This is just a button to illustrate how to use
                        // TextEditingController to set the value
                        // or do whatever you want with it
                        TextButton(
                          onPressed: _onPressedModifyTextField,
                          child: const Text('Generate Barcode...'),
                        ),
                      ],
                    ),
                    // TextFieldTags(
                    //   textfieldTagsController: _controller,
                    //   textSeparators: const [' ', ','],
                    //   letterCase: LetterCase.normal,
                    //   validator: (String tag) {
                    //     if (_controller.getTags!.contains(tag)) {
                    //       return 'you already entered that';
                    //     }
                    //     return null;
                    //   },
                    //   inputfieldBuilder:
                    //       (context, tec, fn, error, onChanged, onSubmitted) {
                    //     return ((context, sc, tags, onTagDelete) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(10.0),
                    //         child: TextFormField(
                    //           controller: tec,
                    //           focusNode: fn,
                    //           // expands: true,
                    //           // maxLines: null,
                    //           // minLines: null,
                    //           // keyboardType: TextInputType.multiline,
                    //           decoration: InputDecoration(
                    //             // isDense: true,
                    //             border: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: MyColors.primary,
                    //                 width: 3.0,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: MyColors.primaryVariant,
                    //                 width: 1.0,
                    //               ),
                    //             ),
                    //             hintText:
                    //                 _controller.hasTags ? '' : "Enter tag...",
                    //             errorText: error,
                    //             prefixIconConstraints: BoxConstraints(
                    //               maxWidth: MediaQuery.of(context).size.width >
                    //                       1000
                    //                   ? MediaQuery.of(context).size.width * 0.22
                    //                   : MediaQuery.of(context).size.width * 0.4,
                    //             ),
                    //             prefixIcon: tags.isNotEmpty
                    //                 ? SingleChildScrollView(
                    //                     scrollDirection: Axis.horizontal,
                    //                     child: Wrap(
                    //                       // alignment: WrapAlignment.start,
                    //                       // verticalDirection: VerticalDirection.up,
                    //                       children: tags.map((String tag) {
                    //                         // return InputChip(label: tag);
                    //                         return Chip(
                    //                           label: Text(tag,
                    //                               style: const TextStyle(
                    //                                   color: Colors.black)),
                    //                           backgroundColor: Colors.red,
                    //                           deleteIcon:
                    //                               const Icon(Icons.close),
                    //                           deleteIconColor: Colors.black,
                    //                           onDeleted: () {
                    //                             print(MediaQuery.of(context)
                    //                                 .size
                    //                                 .width);
                    //                             onTagDelete(tag);
                    //                           },
                    //                         );
                    //                         // return Container(
                    //                         //   decoration: BoxDecoration(
                    //                         //     borderRadius:
                    //                         //         const BorderRadius.all(
                    //                         //       Radius.circular(5.0),
                    //                         //     ),
                    //                         //     color: MyColors.secondaryAppColor,
                    //                         //   ),
                    //                         //   margin: const EdgeInsets.symmetric(
                    //                         //       horizontal: 5.0),
                    //                         //   padding: const EdgeInsets.symmetric(
                    //                         //       horizontal: 10.0,
                    //                         //       vertical: 5.0),
                    //                         //   child: Row(
                    //                         //     mainAxisAlignment:
                    //                         //         MainAxisAlignment
                    //                         //             .spaceBetween,
                    //                         //     children: [
                    //                         //       InkWell(
                    //                         //         child: Text(
                    //                         //           '$tag',
                    //                         //           style: const TextStyle(
                    //                         //               color: Colors.white),
                    //                         //         ),
                    //                         //         onTap: () {
                    //                         //           print("$tag selected");
                    //                         //         },
                    //                         //       ),
                    //                         //       const SizedBox(width: 4.0),
                    //                         //       InkWell(
                    //                         //         child: const Icon(
                    //                         //           Icons.cancel,
                    //                         //           size: 14.0,
                    //                         //           color: Colors.black,
                    //                         //         ),
                    //                         //         onTap: () {
                    //                         //           onTagDelete(tag);
                    //                         //         },
                    //                         //       )
                    //                         //     ],
                    //                         //   ),
                    //                         // );
                    //                       }).toList(),
                    //                     ),
                    //                   )
                    //                 : Text(''),
                    //           ),
                    //           onChanged: onChanged,
                    //           // onSubmitted: onSubmitted,
                    //         ),
                    //       );
                    //     });
                    //   },
                    // ),

                    const SizedBox(height: 15),
                    SizedBox(
                      width: 200,
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'Unit_of_measurement',

                        decoration: const InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          labelText: 'Unit of measurement',
                          // suffixIcon: _codeHasError
                          //     ? const Icon(Icons.error, color: Colors.red)
                          //     : const Icon(Icons.check, color: Colors.green),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _unitOfMeasurementHasError = !(_formKey
                                    .currentState?.fields['unit_of_measurement']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          // FormBuilderValidators.required(),

                          // FormBuilderValidators.max(70),
                          // FormBuilderValidators.min(0)
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 15),
                    FormBuilderDropdown<String>(
                      dropdownColor: Colors.black87,
                      focusColor: Colors.black12,
                      name: 'group',

                      decoration: const InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Group',
                        // suffix: _groupHasError
                        //     ? const Icon(Icons.error)
                        //     : const Icon(Icons.check),
                        hintText: 'Select Group',
                      ),
                      initialValue: genderOptions[0],
                      // validator: FormBuilderValidators.compose(
                      //     [FormBuilderValidators.required()]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: gender,
                                child: Text(gender,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _groupHasError = !(_formKey
                                  .currentState?.fields['group']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 150,
                      child: FormBuilderSwitch(
                        title: const Text('Active'),
                        name: 'active',
                        decoration: InputDecoration(border: InputBorder.none),
                        activeColor: MyColors.primary,
                        activeTrackColor: MyColors.primaryVariant,
                        controlAffinity: ListTileControlAffinity.leading,
                        initialValue: true,
                        onChanged: _onChanged,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: FormBuilderSwitch(
                        title: const Text('Default quantity'),
                        name: 'default_quantity',
                        decoration: InputDecoration(border: InputBorder.none),
                        activeColor: MyColors.primary,
                        activeTrackColor: MyColors.primaryVariant,
                        controlAffinity: ListTileControlAffinity.leading,
                        initialValue: true,
                        onChanged: _onChanged,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderSwitch(
                        title: const Text('Service (not using stock)'),
                        name: 'servie',
                        decoration: InputDecoration(border: InputBorder.none),
                        activeColor: MyColors.primary,
                        activeTrackColor: MyColors.primaryVariant,
                        controlAffinity: ListTileControlAffinity.leading,
                        initialValue: true,
                        onChanged: _onChanged,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 200,
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'age',

                        decoration: InputDecoration(
                          labelText: 'Age restriction',
                          suffixIcon: _ageHasError
                              ? const Icon(Icons.error, color: Colors.red)
                              : const Icon(Icons.check, color: Colors.green),
                          suffixText: 'Year(s)',
                          suffixStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _ageHasError = !(_formKey
                                    .currentState?.fields['age']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          // FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.max(70),
                          FormBuilderValidators.min(0)
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'description',
                      style: TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Description',

                        // suffixIcon: _nameHasError
                        //     ? const Icon(Icons.error, color: Colors.red)
                        //     : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        // setState(() {
                        //   _descriptionHasError = !(_formKey
                        //           .currentState?.fields['description']
                        //           ?.validate() ??
                        //       false);
                        // });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(),
                      //   // FormBuilderValidators.numeric(),
                      //   FormBuilderValidators.max(70),
                      //   FormBuilderValidators.min(1)
                      // ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      // textInputAction: TextInputAction.next,
                    ),

                    //   FormBuilderCheckboxGroup<String>(
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     decoration: const InputDecoration(
                    //         labelText: 'The language of my people'),
                    //     name: 'languages',
                    //     // initialValue: const ['Dart'],
                    //     options: const [
                    //       FormBuilderFieldOption(value: 'Dart'),
                    //       FormBuilderFieldOption(value: 'Kotlin'),
                    //       FormBuilderFieldOption(value: 'Java'),
                    //       FormBuilderFieldOption(value: 'Swift'),
                    //       FormBuilderFieldOption(value: 'Objective-C'),
                    //     ],
                    //     onChanged: _onChanged,
                    //     separator: const VerticalDivider(
                    //       width: 10,
                    //       thickness: 5,
                    //       color: Colors.red,
                    //     ),
                    //     validator: FormBuilderValidators.compose([
                    //       FormBuilderValidators.minLength(1),
                    //       FormBuilderValidators.maxLength(3),
                    //     ]),
                    //   ),
                    //   FormBuilderFilterChip<String>(
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     decoration: const InputDecoration(
                    //         labelText: 'The language of my people'),
                    //     name: 'languages_filter',
                    //     selectedColor: Colors.red,
                    //     options: const [
                    //       FormBuilderChipOption(
                    //         value: 'Dart',
                    //         avatar: CircleAvatar(child: Text('D')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Kotlin',
                    //         avatar: CircleAvatar(child: Text('K')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Java',
                    //         avatar: CircleAvatar(child: Text('J')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Swift',
                    //         avatar: CircleAvatar(child: Text('S')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Objective-C',
                    //         avatar: CircleAvatar(child: Text('O')),
                    //       ),
                    //     ],
                    //     onChanged: _onChanged,
                    //     validator: FormBuilderValidators.compose([
                    //       FormBuilderValidators.minLength(1),
                    //       FormBuilderValidators.maxLength(3),
                    //     ]),
                    //   ),
                    //   FormBuilderChoiceChip<String>(
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     decoration: const InputDecoration(
                    //         labelText:
                    //             'Ok, if I had to choose one language, it would be:'),
                    //     name: 'languages_choice',
                    //     initialValue: 'Dart',
                    //     options: const [
                    //       FormBuilderChipOption(
                    //         value: 'Dart',
                    //         avatar: CircleAvatar(child: Text('D')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Kotlin',
                    //         avatar: CircleAvatar(child: Text('K')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Java',
                    //         avatar: CircleAvatar(child: Text('J')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Swift',
                    //         avatar: CircleAvatar(child: Text('S')),
                    //       ),
                    //       FormBuilderChipOption(
                    //         value: 'Objective-C',
                    //         avatar: CircleAvatar(child: Text('O')),
                    //       ),
                    //     ],
                    //     onChanged: _onChanged,
                    //   ),
                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: MyColors.secondaryAppColor,
      labelPadding: const EdgeInsets.only(left: 8.0),
      padding: const EdgeInsets.all(1.0),
      autofocus: true,
      label: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
      shape: RoundedRectangleBorder(),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
        color: Colors.black,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
