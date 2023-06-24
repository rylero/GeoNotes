import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}

@JsonSerializable()
class Note {
  @GeoPointConverter()
  final GeoPoint location;

  final String title;
  final String description;
  final String user;

  Note({
    this.location = const GeoPoint(0, 0),
    this.title = "",
    this.description = "",
    this.user = "",
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
