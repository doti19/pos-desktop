// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product()
      ..name = fields[0] as String
      ..code = fields[1] as String
      ..barcode = (fields[2] as List).cast<String>()
      ..unitOfMeasurement = fields[3] as String
      ..group = fields[4] as String
      ..isActive = fields[5] as bool
      ..isDefaultQuantity = fields[6] as bool
      ..isService = fields[7] as bool
      ..age = fields[8] as String
      ..description = fields[9] as String
      ..cost = fields[10] as double
      ..markup = fields[11] as double
      ..salePrice = fields[12] as double
      ..doesPriceIncludeTax = fields[13] as bool
      ..isPriceChangeAllowed = fields[14] as bool
      ..supplier = fields[15] as String
      ..reorderPoint = fields[16] as int
      ..preferredQuantity = fields[17] as int
      ..lowStockWarning = fields[18] as bool
      ..lowStockWarningQuantity = fields[19] as int
      ..color = fields[20] as String
      ..image = fields[21] as Uint8List?
      ..comments = (fields[22] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.barcode)
      ..writeByte(3)
      ..write(obj.unitOfMeasurement)
      ..writeByte(4)
      ..write(obj.group)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.isDefaultQuantity)
      ..writeByte(7)
      ..write(obj.isService)
      ..writeByte(8)
      ..write(obj.age)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.cost)
      ..writeByte(11)
      ..write(obj.markup)
      ..writeByte(12)
      ..write(obj.salePrice)
      ..writeByte(13)
      ..write(obj.doesPriceIncludeTax)
      ..writeByte(14)
      ..write(obj.isPriceChangeAllowed)
      ..writeByte(15)
      ..write(obj.supplier)
      ..writeByte(16)
      ..write(obj.reorderPoint)
      ..writeByte(17)
      ..write(obj.preferredQuantity)
      ..writeByte(18)
      ..write(obj.lowStockWarning)
      ..writeByte(19)
      ..write(obj.lowStockWarningQuantity)
      ..writeByte(20)
      ..write(obj.color)
      ..writeByte(21)
      ..write(obj.image)
      ..writeByte(22)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
