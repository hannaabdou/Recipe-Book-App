// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddRecipeModelAdapter extends TypeAdapter<AddRecipeModel> {
  @override
  final int typeId = 0;

  @override
  AddRecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddRecipeModel(
      recipeId: fields[0] as int,
      recipeName: fields[1] as String,
      recipeDescription: fields[2] as String,
      recipeImgPath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddRecipeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.recipeName)
      ..writeByte(2)
      ..write(obj.recipeDescription)
      ..writeByte(3)
      ..write(obj.recipeImgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddRecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
