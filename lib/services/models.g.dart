// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      location: json['location'] == null
          ? const GeoPoint(0, 0)
          : const GeoPointConverter().fromJson(json['location'] as GeoPoint),
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      user: json['user'] as String? ?? "",
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'location': const GeoPointConverter().toJson(instance.location),
      'title': instance.title,
      'description': instance.description,
      'user': instance.user,
    };
