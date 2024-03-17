// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeditationAdapter extends TypeAdapter<Meditation> {
  @override
  final int typeId = 2;

  @override
  Meditation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meditation(
      id: fields[1] as String,
      audioURL: fields[2] as String,
      coverURL: fields[3] as String,
      title: fields[4] as String,
      subTitle: fields[5] as String,
      description: fields[6] as String,
      duration: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Meditation obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.audioURL)
      ..writeByte(3)
      ..write(obj.coverURL)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.subTitle)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeditationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
