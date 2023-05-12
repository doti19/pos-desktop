import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../config/my_colors.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({super.key});

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  bool _nameHasError = true;
  bool _groupHasError = false;

  void _onChanged(dynamic val) => debugPrint(val.toString());

  List<String> groupOptions = ['Products', 'Products/stg'];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
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
                      _nameHasError =
                          !(_formKey.currentState?.fields['name']?.validate() ??
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
                const SizedBox(
                  height: 15,
                ),
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
                  initialValue: groupOptions[0],
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required()]),
                  items: groupOptions
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
                      _groupHasError = !(_formKey.currentState?.fields['group']
                              ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
              ],
            )),
      ),
    );
  }
}
