// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_workout_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyWorkoutEntityAdapter extends TypeAdapter<DailyWorkoutEntity> {
  @override
  final int typeId = 4;

  @override
  DailyWorkoutEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyWorkoutEntity(
      workoutTime: fields[0] as int,
      workouts: (fields[1] as List).cast<WorkoutEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyWorkoutEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.workoutTime)
      ..writeByte(1)
      ..write(obj.workouts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyWorkoutEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
