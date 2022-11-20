// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutEntityAdapter extends TypeAdapter<WorkoutEntity> {
  @override
  final int typeId = 0;

  @override
  WorkoutEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutEntity(
      workoutType: fields[0] as WorkoutType,
      workoutTime: fields[1] as int,
      workoutSets: (fields[2] as List).cast<WorkoutSetEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.workoutType)
      ..writeByte(1)
      ..write(obj.workoutTime)
      ..writeByte(2)
      ..write(obj.workoutSets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
