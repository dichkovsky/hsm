// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hsm_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HSMCardAdapter extends TypeAdapter<HSMCard> {
  @override
  final int typeId = 1;

  @override
  HSMCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HSMCard(
      id: fields[1] as String,
      cardNo: fields[2] as int,
      faceURL: fields[3] as String,
      soundURL: fields[4] as String,
      title: fields[5] as String,
      description: fields[6] as String,
      visualization: fields[7] as String,
      general: fields[8] as String,
      relationship: fields[9] as String,
      workFinance: fields[10] as String,
      health: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HSMCard obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.cardNo)
      ..writeByte(3)
      ..write(obj.faceURL)
      ..writeByte(4)
      ..write(obj.soundURL)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.visualization)
      ..writeByte(8)
      ..write(obj.general)
      ..writeByte(9)
      ..write(obj.relationship)
      ..writeByte(10)
      ..write(obj.workFinance)
      ..writeByte(11)
      ..write(obj.health);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HSMCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
