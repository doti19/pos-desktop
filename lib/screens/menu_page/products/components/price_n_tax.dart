import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../config/my_colors.dart';

class PriceAndTax extends StatefulWidget {
  const PriceAndTax({super.key});

  @override
  State<PriceAndTax> createState() => _PriceAndTaxState();
}

class _PriceAndTaxState extends State<PriceAndTax> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());
  // bool _taxHasError = false;
  bool _costHasError = false;
  bool _markupHasError = false;
  bool _salePriceHasError = false;
  List<String> taxOptions = ['eth(15%)', 'eth1(30%)'];

  final Map<String, Widget> _taxesList = {};
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: MyColors.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Taxes',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          addWidget();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColors.secondaryAppColor)),
                        // hoverColor: MyColors.primaryVariant,
                        label: const Text("Add tax to product",
                            style: TextStyle(color: Colors.white)),
                        icon:
                            Icon(Icons.add, color: MyColors.primary, size: 25),
                      ),
                    ],
                  ),
                  Column(
                    children: _taxesList.values.toList(),
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'cost',

                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Cost',
                        suffixIcon: _costHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _costHasError = !(_formKey
                                  .currentState?.fields['cost']
                                  ?.validate() ??
                              false);
                        });
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
                  SizedBox(
                    width: 200,
                    child: FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'markup',

                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Markup',
                        suffixText: '%',
                        suffixStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: _markupHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _markupHasError = !(_formKey
                                  .currentState?.fields['markup']
                                  ?.validate() ??
                              false);
                        });
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
                  SizedBox(
                    width: 200,
                    child: FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'salePrice',

                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Sale price',
                        suffixIcon: _salePriceHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _salePriceHasError = !(_formKey
                                  .currentState?.fields['salePrice']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        //on the pro sw it can enter negative
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
                      title: const Text('Price includes tax',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      name: 'price_incl_tax',
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
                      title: const Text('Price change allowed',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      name: 'price_change_allowed',
                      decoration: InputDecoration(border: InputBorder.none),
                      activeColor: MyColors.primary,
                      activeTrackColor: MyColors.primaryVariant,
                      controlAffinity: ListTileControlAffinity.leading,
                      initialValue: false,
                      onChanged: _onChanged,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  addWidget() {
    setState(() {
      String id = UniqueKey().toString();

      _taxesList.putIfAbsent(id, () => enterTax(id: id));
    });
  }

  removeTax(id) {
    setState(() {
      // debugPrint(id);

      _taxesList.remove(id);
    });
  }

  Widget enterTax({required String id}) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: FormBuilderDropdown<String>(
            // key: UniqueKey(),
            dropdownColor: Colors.black87,
            focusColor: Colors.black12,
            name: 'tax_$id',

            decoration: const InputDecoration(
              fillColor: Colors.black12,
              filled: true,
              labelText: 'Choose tax to product',
              // suffix: _groupHasError
              //     ? const Icon(Icons.error)
              //     : const Icon(Icons.check),
              hintText: 'Select tax',
            ),
            initialValue: taxOptions[0],
            // validator: FormBuilderValidators.compose(
            //     [FormBuilderValidators.required()]),
            items: taxOptions
                .map((tax) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: tax,
                      child: Text(tax,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
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
        IconButton(
            onPressed: () {
              removeTax(id);
            },
            icon: Icon(Icons.remove, size: 25, color: Colors.red)),
      ],
    );
  }
}
