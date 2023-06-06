import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../blocs/product/product_bloc.dart';
import '../../../../config/my_colors.dart';
import '../../../../models/product/product.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key});

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  // late ProductDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    // employeeDataSource = ProductDataSource(employees: employees);
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
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            context.read<ProductBloc>().add(const FetchAllProductEvent());
            // BlocProvider.of<ProductBloc>(context).add(const FetchAllProductEvent());
          }
          if (state is DisplayAllProductsState) {
            if (state.products.isNotEmpty) {
              return SfDataGrid(
                // key: UniqueKey(),

                source: ProductDataSource(products: state.products),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                columnWidthCalculationRange:
                    ColumnWidthCalculationRange.allRows,
                // columnSizer: _customColumnSizer,
                columnWidthMode: ColumnWidthMode.fitByColumnName,
                // shrinkWrapColumns: true,
                // defaultColumnWidth: 120,
                // navigationMode: GridNavigationMode.cell,
                isScrollbarAlwaysShown: true,
              );
            }
          }
          return Center(
              child: Text('empty'.toUpperCase(),
                  style: const TextStyle(fontSize: 21)));
        },
      ),
    );
  }
}

class ProductDataSource extends DataGridSource {
  ProductDataSource({required List<Product> products}) {
    _products = products
        .map<DataGridRow>((p) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'code', value: p.code),
              DataGridCell<String>(columnName: 'name', value: p.name),
              DataGridCell<String>(columnName: 'group', value: p.group),
              DataGridCell<String>(
                  columnName: 'barcode', value: p.barcode.join(', ')),
              DataGridCell<double>(columnName: 'cost', value: p.cost),
              DataGridCell<double>(
                  columnName: 'sale_price_before_tax', value: p.salePrice),
              const DataGridCell<int>(columnName: 'taxes', value: -1),
              DataGridCell<double>(
                  columnName: 'sale_price', value: p.salePrice),
              DataGridCell<String>(
                  columnName: 'active', value: p.isActive.toString()),
              DataGridCell<String>(
                  columnName: 'unit_of_measurement',
                  value: p.unitOfMeasurement),
              DataGridCell<String>(columnName: 'created', value: p.createdAt),
              DataGridCell<String>(columnName: 'updated', value: p.updatedAt),
            ]))
        .toList();
  }

  List<DataGridRow> _products = [];

  @override
  List<DataGridRow> get rows => _products;

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
