import 'package:flutter/material.dart';
import 'package:pos_desktop2/screens/menu_page/products/components/new_product/tabs/image_n_color_tab.dart';
import 'package:pos_desktop2/screens/menu_page/products/components/new_product/tabs/price_n_tax_tab.dart';
import 'package:pos_desktop2/screens/menu_page/products/components/new_product/tabs/stock_control_tab.dart';
import 'package:tab_container/tab_container.dart';

import '../../../../../config/my_colors.dart';
import 'tabs/details_tab.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: MyColors.mainContainer,
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Product",
                style: TextStyle(fontSize: 32.0, color: Colors.white54),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward,
                    size: 32.0, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        Expanded(
          child: TabContainer(
            color: MyColors.background,
            tabEdge: TabEdge.left,
            tabStart: 0.1,
            tabEnd: 0.6,
            tabExtent: 80,
            childPadding: const EdgeInsets.all(10.0),
            children: _getChildren4(),
            tabs: _getTabs4(),
            selectedTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            unselectedTextStyle: TextStyle(
              color: MyColors.primary,
              fontSize: 13.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: OutlinedButton.icon(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid)),
                ),
                onPressed: () {
                  // if (_formKey.currentState?.saveAndValidate() ?? false) {
                  //   debugPrint(_formKey.currentState?.value.toString());
                  // } else {
                  //   debugPrint(_formKey.currentState?.value.toString());
                  //   debugPrint('validation failed');
                  // }
                },
                icon: const Icon(Icons.check, color: Colors.grey),
                label: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: OutlinedButton.icon(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid)),
                ),
                onPressed: () {
                  // _formKey.currentState?.reset();
                },
                // color: Theme.of(context).colorScheme.secondary,
                icon: Icon(Icons.close, color: Colors.grey),
                label: Text(
                  'Reset',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

List<Widget> _getChildren4() => <Widget>[
      DetailsForm(),
      PriceAndTax(),
      StockControl(),
      ImageAndColor(),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Page 3',
              // style: Theme.of(context).textTheme.headline5?.copyWith(
              //       color: Colors.white,
              //     ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              '''Phasellus a rutrum lectus. Maecenas turpis nisi, imperdiet non tellus eget, aliquam bibendum urna. Nullam tincidunt aliquam sem, eget finibus mauris commodo nec. Sed pharetra varius augue, id dignissim tortor vulputate at. Nunc sodales, nisl a ornare posuere, dolor purus pulvinar nulla, vel facilisis magna justo id tortor. Aliquam tempus nulla diam, non faucibus ligula cursus id. Maecenas vitae lorem augue. Aliquam hendrerit urna quis mi ornare pharetra. Duis vitae urna porttitor, porta elit a, egestas nibh. Etiam sollicitudin tincidunt sem pellentesque fringilla. Aenean sed mauris non augue hendrerit volutpat. Praesent consectetur metus ex, eu feugiat risus rhoncus sed. Suspendisse dapibus, nunc vel rhoncus placerat, tellus odio tincidunt mi, sed sagittis dui nulla eu erat.''',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Page 3',
              // style: Theme.of(context).textTheme.headline5?.copyWith(
              //       color: Colors.white,
              //     ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              '''Phasellus a rutrum lectus. Maecenas turpis nisi, imperdiet non tellus eget, aliquam bibendum urna. Nullam tincidunt aliquam sem, eget finibus mauris commodo nec. Sed pharetra varius augue, id dignissim tortor vulputate at. Nunc sodales, nisl a ornare posuere, dolor purus pulvinar nulla, vel facilisis magna justo id tortor. Aliquam tempus nulla diam, non faucibus ligula cursus id. Maecenas vitae lorem augue. Aliquam hendrerit urna quis mi ornare pharetra. Duis vitae urna porttitor, porta elit a, egestas nibh. Etiam sollicitudin tincidunt sem pellentesque fringilla. Aenean sed mauris non augue hendrerit volutpat. Praesent consectetur metus ex, eu feugiat risus rhoncus sed. Suspendisse dapibus, nunc vel rhoncus placerat, tellus odio tincidunt mi, sed sagittis dui nulla eu erat.''',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ];

List<String> _getTabs4() {
  return <String>[
    'Details',
    'Price & tax',
    'Stock control',
    'Image & color',
    'Comments',
    'print stations'
  ];
}
