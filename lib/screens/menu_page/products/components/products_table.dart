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
      Employee(10001, 'James', 'Project Lead', 20000, 1, 2, 3, 4, 5, 6, 7, 8),
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
    'group': double.nan,
    'barcode': double.nan,
    'cost': double.nan,
    'sale_price_before_tax': 150,
    'taxes': double.nan,
    'sale_price': double.nan,
    'active': double.nan,
    'unit_of_measurement': 150,
    'created': double.nan,
    'updated': double.nan,
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
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Code',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
          GridColumn(
            columnName: 'name',
            width: columnWidths['name']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Name',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'group',
            width: columnWidths['group']!,
            // width: 120,

            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Group',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'barcode',
            width: columnWidths['barcode']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Barcode',
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
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Cost',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'sale_price_before_tax',
            width: columnWidths['sale_price_before_tax']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Sale price before tax',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'taxes',
            width: columnWidths['taxes']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Taxes',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'sale_price',
            width: columnWidths['sale_price']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Sale price',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'active',
            width: columnWidths['active']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Active',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'unit_of_measurement',
            width: columnWidths['unit_of_measurement']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Unit of measurement',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'created',
            width: columnWidths['created']!,
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Created',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridColumn(
            columnName: 'updated',
            width: columnWidths['updated']!,
            label: Container(
              // padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Updated',
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
    this.f,
    this.g,
    this.h,
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
  final int f;
  final int g;
  final int h;
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
              DataGridCell<int>(columnName: 'f', value: e.f),
              DataGridCell<int>(columnName: 'g', value: e.g),
              DataGridCell<int>(columnName: 'h', value: e.h),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
