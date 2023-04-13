import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../config/my_colors.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key});

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  List<Employee> employees = <Employee>[];

  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    employees = getEmployees();
    employeeDataSource = EmployeeDataSource(employees: employees);
  }

  List<Employee> getEmployees() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000, 1, 2, 3, 4, 5),
      // Employee(10002, 'Kathryn', 'Manager', 30000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10003, 'Lara', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10004, 'Michael', 'Designer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10005, 'Martin', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10006, 'Newberry', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10007, 'Balnc', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10008, 'Perry', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10009, 'Gable', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8),
      // Employee(10010, 'Grimes', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8)
    ];
  }

  // final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  Map<String, double> columnWidths = {
    'code': double.nan,
    'name': double.nan,
    'quantity': double.nan,
    'unit_of_measure': 150,
    'cost_price': double.nan,
    'cost': double.nan,
    'cost_incl._tax': 150,
    'value': double.nan,
    'value_incl._tax': double.nan,
  };
  @override
  Widget build(BuildContext context) {
    return Ink(
      // height: double.infinity,
      // height: double.infinity,
      color: MyColors.mainContainer,
      child: SfDataGrid(
        // key: UniqueKey(),

        source: employeeDataSource,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'code',
              width: columnWidths['code']!,
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Code',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
            columnName: 'name',
            width: columnWidths['name']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Name',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'quantity',
            width: columnWidths['quantity']!,
            // width: 120,

            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Quantity',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'unit_of_measure',
            width: columnWidths['unit_of_measure']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Unit of measure',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'cost_price',
            width: columnWidths['cost_price']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Cost price',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'cost',
            width: columnWidths['cost']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Cost',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'cost_incl._tax',
            width: columnWidths['cost_incl._tax']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Cost incl. tax',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'value',
            width: columnWidths['value']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Value',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'value_incl._tax',
            width: columnWidths['value_incl._tax']!,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Value incl. tax',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        allowColumnsResizing: true,
        onColumnResizeUpdate: (details) {
          setState(() {
            if (details.width > 40) {
              columnWidths[details.column.columnName] = details.width;
            }
          });
          return true;
        },
        allowSorting: true,

        // showCheckboxColumn: true,
        selectionMode: SelectionMode.multiple,
        // defaultColumnWidth: double.maxFinite,
        columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
        // columnSizer: _customColumnSizer,
        columnWidthMode: ColumnWidthMode.fitByColumnName,
        // shrinkWrapColumns: true,
        // defaultColumnWidth: 120,
        // navigationMode: GridNavigationMode.cell,
        isScrollbarAlwaysShown: true,
      ),
    );
  }
}

class Employee {
  Employee(
    this.id,
    this.name,
    this.designation,
    this.salary,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
  );
  final int id;
  final String name;
  final String designation;
  final int salary;
  final int a;
  final int b;
  final int c;
  final int d;
  final int e;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employees}) {
    _employees = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              DataGridCell<int>(columnName: 'a', value: e.a),
              DataGridCell<int>(columnName: 'b', value: e.b),
              DataGridCell<int>(columnName: 'c', value: e.c),
              DataGridCell<int>(columnName: 'd', value: e.d),
              DataGridCell<int>(columnName: 'e', value: e.e),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        // alignment: (dataGridCell.columnName == 'id' ||
        //         dataGridCell.columnName == 'salary')
        //     ? Alignment.centerRight
        //     : Alignment.centerLeft,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          dataGridCell.value.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white),
          softWrap: false,
        ),
      );
    }).toList());
  }
}
