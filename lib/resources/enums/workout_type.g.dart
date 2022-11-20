// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutTypeAdapter extends TypeAdapter<WorkoutType> {
  @override
  final int typeId = 6;

  @override
  WorkoutType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WorkoutType.barbellRow;
      case 1:
        return WorkoutType.benchPress;
      case 2:
        return WorkoutType.shoulderPress;
      case 3:
        return WorkoutType.deadLift;
      case 4:
        return WorkoutType.squat;
      default:
        return WorkoutType.barbellRow;
    }
  }

  @override
  void write(BinaryWriter writer, WorkoutType obj) {
    switch (obj) {
      case WorkoutType.barbellRow:
        writer.writeByte(0);
        break;
      case WorkoutType.benchPress:
        writer.writeByte(1);
        break;
      case WorkoutType.shoulderPress:
        writer.writeByte(2);
        break;
      case WorkoutType.deadLift:
        writer.writeByte(3);
        break;
      case WorkoutType.squat:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
