import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'place.freezed.dart';
part 'place.g.dart';

/// Garden Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
@JsonSerializable(explicitToJson: true)
class Place with _$Place {
  const factory Place({
    required String id,
    required String name,
    required String description,
    @JsonKey(
    fromJson: _geoPointFromJson,
    toJson: _geoPointToJson,)
    required GeoPoint location, 
    required String placeType,
    required String imagePath,
    required String ownerID,
    //required String chapterID,
    required String lastUpdate,
    @Default([]) List<String> editorIDs,
    @Default([]) List<String> visitorIDs,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  static GeoPoint _geoPointFromJson(Map<String, dynamic> json) =>
        const GeoPointConverter().fromJson(json['location']);

    static Map<String, dynamic> _geoPointToJson(GeoPoint geoPoint) =>
        {'location': const GeoPointConverter().toJson(geoPoint)};


   /* factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: GeoPoint(
        (json['location']['latitude'] as num).toDouble(),
        (json['location']['longitude'] as num).toDouble(),
      ),
      placeType: json['placeType'] as String,
      imagePath: json['imagePath'] as String,
      lastUpdate: json['lastUpdate'] as String,
      ownerID: json['ownerID'] as String,
      editorIDs: (json['editorIDs'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      visitorIDs: (json['visitorIDs'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    ); 
   } */
  

/*   static Future<List<Place>> checkInitialData() async {
  String content = await rootBundle.loadString("assets/images/places.json");
  List<dynamic> initialData = json.decode(content);
  List<Place> places = [];

  for (var jsonData in initialData) {
    if (kDebugMode) {
      print('Original JSON: $jsonData');
    }
    // Convert List<double> to GeoPoint
    GeoPoint location = GeoPoint(jsonData['location'][0], jsonData['location'][1]);
    // Create Place instance with GeoPoint
    Place place = Place.fromJson(jsonData.copyWith(location: location));
    if (kDebugMode) {
      print('Converted Place: $place');
    }
    places.add(place);
  }
  return places;
} */

 // Test that the json file can be converted into entities.
  static Future<List<Place>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/images/places.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Place.fromJson(jsonData)).toList();
  } 



}


class GeoPointConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    return GeoPoint(
      (json["location"]['latitude'] as num).toDouble(),
      (json["location"]['longitude'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson(GeoPoint object) {
    return {
      'latitude': object.latitude,
      'longitude': object.longitude,
    };
  }
}



