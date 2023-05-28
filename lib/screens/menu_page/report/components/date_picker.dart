import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../../../config/my_colors.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  final SliverGridDelegate grid =
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // return Container();
    return Container(
      width: screenWidth > 1000 ? screenWidth * 0.6 : screenWidth * 0.9,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SfDateRangePicker(
              monthViewSettings: const DateRangePickerMonthViewSettings(
                  firstDayOfWeek: 1,
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700))),
              selectionMode: DateRangePickerSelectionMode.range,
              selectionColor: MyColors.primary,

              // backgroundColor: Colors.white,
              // showNavigationArrow: true,
              showActionButtons: true,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              enableMultiView: true,
              endRangeSelectionColor: MyColors.secondaryAppColor,
              headerStyle: const DateRangePickerHeaderStyle(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              // rangeSelectionColor: MyColors.secondaryAppColorVariant,
              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(color: Colors.yellow),
              ),

              startRangeSelectionColor: MyColors.primary,
              todayHighlightColor: Colors.amber,
              rangeTextStyle: const TextStyle(color: Colors.white),
              yearCellStyle: const DateRangePickerYearCellStyle(
                textStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Colors.yellow),
              ),
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _myButton(
                        name: 'Today',
                        onPressed: () {
                          print('today');
                        },
                      ),
                      _myButton(
                        name: 'This Week',
                        onPressed: () {
                          print('This week');
                        },
                      ),
                      _myButton(
                        name: 'This month',
                        onPressed: () {
                          print('This month');
                        },
                      ),
                      _myButton(
                        name: 'This year',
                        onPressed: () {
                          print('This year');
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _myButton(
                        name: 'Yesterday',
                        onPressed: () {
                          print('Yesterday');
                        },
                      ),
                      _myButton(
                        name: 'Last week',
                        onPressed: () {
                          print('Last week');
                        },
                      ),
                      _myButton(
                        name: 'Last month',
                        onPressed: () {
                          print('Last month');
                        },
                      ),
                      _myButton(
                        name: 'Last Year',
                        onPressed: () {
                          print('Last Year');
                        },
                      ),
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget _myButton({required String name, required Function()? onPressed}) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          // minimumSize: const Size.fromHeight(15),
          // maximumSize: const Size(20, 20)
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
