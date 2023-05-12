import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../config/my_colors.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());

  bool _commentHasError = false;
  final Map<String, Widget> _commentsWidgetList = {};
  final Map<String, String> _commentsText = {};
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
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
                children: <Widget>[
                  Expanded(
                    // width: 200,
                    child: FormBuilderTextField(
                      controller: _controller,
                      autovalidateMode: AutovalidateMode.always,
                      name: 'comment',
                      style: TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        labelText: 'Comment',
                        suffixIcon: _commentHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _commentHasError = !(_formKey
                                      .currentState?.fields['comment']
                                      ?.validate() ??
                                  false) ||
                              _commentsText.values.contains(val);
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
                      // onSubmitted: addComment(),
                    ),
                  ),
                  OutlinedButton.icon(
                    // style: ButtonStyle(
                    //     // foregroundColor:
                    //     //     MaterialStateProperty.all<Color>(Colors.white),

                    //     iconColor:
                    //         MaterialStateProperty.all<Color>(Colors.white)),
                    style: OutlinedButton.styleFrom(
                      disabledForegroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed:
                        _formKey.currentState?.fields['comment']?.value == '' ||
                                _commentHasError ||
                                _formKey.currentState?.fields['comment']
                                        ?.value ==
                                    null
                            ? null
                            : addComment,
                    icon: Icon(Icons.add, size: 20),
                    label: Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Column(
                children: _commentsWidgetList.values.toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  addComment() {
    setState(() {
      String id = UniqueKey().toString();

      _commentsWidgetList.putIfAbsent(id, () => comment(id: id));
      _commentsText.putIfAbsent(
          id, () => _formKey.currentState?.fields['comment']?.value);
      _controller.clear();
      // _formKey.currentState?.fields['comment']?.setValue('');
    });
  }

  removeComment(id) {
    setState(() {
      _commentsWidgetList.remove(id);
      _commentsText.remove(id);
    });
  }

  Widget comment({required String id}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          _formKey.currentState?.fields['comment']?.value,
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
            onPressed: () {
              removeComment(id);
            },
            icon: Icon(Icons.remove, size: 25, color: Colors.red)),
      ],
    );
  }
}
