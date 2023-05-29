import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../config/my_colors.dart';

class StockControl extends StatefulWidget {
  final formKey;
  const StockControl({required this.formKey, super.key});

  @override
  State<StockControl> createState() => _StockControlState();
}

class _StockControlState extends State<StockControl> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  // final widget.formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());
  // bool _taxHasError = false;
  // bool _reorderPointHasError = false;
  // bool _preferredQuantityHasError = false;
  // bool _lowStockWarningQuantityHasError = false;
  List<String> supplierOptions = ['none', 'Unknown'];
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
                name: 'supplier',

                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  labelText: 'Supplier',
                  // suffix: _groupHasError
                  //     ? const Icon(Icons.error)
                  //     : const Icon(Icons.check),
                  hintText: 'Select supplier',
                ),
                initialValue: supplierOptions[0],
                // validator: FormBuilderValidators.compose(
                //     [FormBuilderValidators.required()]),
                items: supplierOptions
                    .map((supply) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: supply,
                          child: Text(supply,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
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
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: 'reorderPoint',

                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  labelText: 'Reorder point',
                  // suffixIcon: _reorderPointHasError
                  //     ? const Icon(Icons.error, color: Colors.red)
                  //     : const Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  // setState(() {
                  //   _reorderPointHasError = !(widget
                  //           .formKey.currentState?.fields['reorderPoint']
                  //           ?.validate() ??
                  //       false);
                  // });
                },
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.min(0)
                ]),
                initialValue: '0',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: 'preferredQuantity',

                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  labelText: 'Preferred quantity',
                  suffixStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  // suffixIcon: _preferredQuantityHasError
                  //     ? const Icon(Icons.error, color: Colors.red)
                  //     : const Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  // setState(() {
                  //   _preferredQuantityHasError = !(widget
                  //           .formKey.currentState?.fields['preferredQuantity']
                  //           ?.validate() ??
                  //       false);
                  // });
                },
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  // FormBuilderValidators.max(70),
                  FormBuilderValidators.min(0)
                ]),
                initialValue: '0',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 150,
              child: FormBuilderSwitch(
                title: const Text('Low stock warning',
                    style: TextStyle(fontWeight: FontWeight.normal)),
                name: 'lowStockWarning',
                decoration: const InputDecoration(border: InputBorder.none),
                activeColor: MyColors.primary,
                activeTrackColor: MyColors.primaryVariant,
                controlAffinity: ListTileControlAffinity.leading,
                initialValue: false,
                onChanged: _onChanged,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: 'lowStockWarningQuantity',

                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  labelText: 'Low stock warning quantity',
                  suffixStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  // suffixIcon: _lowStockWarningQuantityHasError
                  //     ? const Icon(Icons.error, color: Colors.red)
                  //     : const Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  // setState(() {
                  //   _lowStockWarningQuantityHasError = !(widget.formKey
                  //           .currentState?.fields['lowStockWarningQuantity']
                  //           ?.validate() ??
                  //       false);
                  // });
                },
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  // FormBuilderValidators.max(70),
                  FormBuilderValidators.min(0)
                ]),
                enabled: false,
                initialValue: '0',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Reset to default'))
          ],
        ),
      ),
    );
  }
}
