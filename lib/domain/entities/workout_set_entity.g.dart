// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutSetEntityAdapter extends TypeAdapter<WorkoutSetEntity> {
  @override
  final int typeId = 2;

  @override
  WorkoutSetEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutSetEntity(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutSetEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.setCount)
      ..writeByte(1)
      ..write(obj.repeatCount)
      ..writeByte(2)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutSetEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
