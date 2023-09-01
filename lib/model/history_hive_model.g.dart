// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelHiveAdapter extends TypeAdapter<HistoryModelHive> {
  @override
  final int typeId = 0;

  @override
  HistoryModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModelHive(
      playerXName: fields[1] as String,
      playerOName: fields[2] as String,
      winner: fields[3] as String,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModelHive obj) {
    writer
      ..writeByte(4)..writeByte(1)
      ..write(obj.playerXName)
      ..writeByte(2)
      ..write(obj.playerOName)
      ..writeByte(3)
      ..write(obj.winner)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HistoryModelHiveAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
