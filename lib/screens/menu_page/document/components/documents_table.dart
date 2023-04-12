import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DocumentsTable extends StatefulWidget {
  const DocumentsTable({super.key});

  @override
  State<DocumentsTable> createState() => _DocumentsTableState();
}

class _DocumentsTableState extends State<DocumentsTable> {
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
      Employee(10001, 'James', 'Project Lead', 20000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10002, 'Kathryn', 'Manager', 30000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10003, 'Lara', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
          11, 12),
      Employee(10004, 'Michael', 'Designer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10005, 'Martin', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10006, 'Newberry', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10007, 'Balnc', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10008, 'Perry', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10009, 'Gable', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12),
      Employee(10010, 'Grimes', 'Developer', 15000, 1, 2, 3, 4, 5, 6, 7, 8, 9,
          10, 11, 12)
    ];
  }

  // final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  Map<String, double> columnWidths = {
    'id': double.nan,
    'name': double.nan,
    'designation': double.nan,
    'salary': double.nan,
    'a': double.nan,
    'b': double.nan,
    'c': double.nan,
    'd': double.nan,
    'e': double.nan,
    'f': double.nan,
    'g': double.nan,
    'h': double.nan,
    'i': double.nan,
    'j': double.nan,
    'k': double.nan,
    'l': double.nan,
  };
  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      // key: UniqueKey(),
      source: employeeDataSource,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'id',
            width: columnWidths['id']!,
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'ID',
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
              'Number',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'designation',
          width: columnWidths['designation']!,
          // width: 120,

          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'External document',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'salary',
          width: columnWidths['salary']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Document type',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'a',
          width: columnWidths['a']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'paid',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'b',
          width: columnWidths['b']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Customer',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'c',
          width: columnWidths['c']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Date',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'd',
          width: columnWidths['d']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'POS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'e',
          width: columnWidths['e']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Order number',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'f',
          width: columnWidths['f']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Payment type',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'g',
          width: columnWidths['g']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'User',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'h',
          width: columnWidths['h']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Discount',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'i',
          width: columnWidths['i']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Total',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'j',
          width: columnWidths['j']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Internal note',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'k',
          width: columnWidths['k']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Note',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GridColumn(
          columnName: 'l',
          width: columnWidths['l']!,
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Created',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      allowColumnsResizing: true,
      onColumnResizeUpdate: (details) {
        setState(() {
          columnWidths[details.column.columnName] = details.width;
        });
        return true;
      },
      allowSorting: true,
      showCheckboxColumn: true,
      selectionMode: SelectionMode.multiple,

      columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
      // columnSizer: _customColumnSizer,
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      // shrinkWrapColumns: true,
      // defaultColumnWidth: 120,
      // navigationMode: GridNavigationMode.cell,
      isScrollbarAlwaysShown: true,
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
      this.i,
      this.j,
      this.k,
      this.l);
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
  final int i;
  final int j;
  final int k;
  final int l;
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
              DataGridCell<int>(columnName: 'i', value: e.i),
              DataGridCell<int>(columnName: 'j', value: e.j),
              DataGridCell<int>(columnName: 'k', value: e.k),
              DataGridCell<int>(columnName: 'l', value: e.l),
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
