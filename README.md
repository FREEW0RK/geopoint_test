# geopoint_test
Try to get and write firebase geopoints to and from JSON using freeezed (or manually whatever works) that I can use these geopoints automatically to create custom marker via Google maps. I would also like to use geoflutterfire to create markers in the map directly, but can't find a version that works with my package versions. 

I would also be grateful for any kind of code that works with a custom datatype in by fromJson and toJson in freezed. Maybe I could translate it to geopoints then. 



Running the build goves this error: 


S D:\APPDEV\geopoint_test\geopoint_test> flutter pub run build_runner build --delete-conflicting-outputs
Deprecated. Use `dart run` instead.
Resolving dependencies... (7.1s)
Got dependencies.
Building package executable... (18.2s)
Built build_runner:build_runner.
[INFO] Generating build script completed, took 892ms
[INFO] Precompiling build script... completed, took 29.8s
[INFO] Building new asset graph completed, took 11.0s
[INFO] Checking for unexpected pre-existing outputs. completed, took 11ms
[WARNING] No actions completed for 15.3s, waiting on:
  - riverpod_generator on lib/main.dart
  - riverpod_generator on test/widget_test.dart
  - riverpod_generator on lib/place.dart

[INFO] Generating SDK summary completed, took 25.9s
[WARNING] No actions completed for 34.5s, waiting on:
  - riverpod_generator on lib/place.dart

[SEVERE] json_serializable on lib/place.dart:

Could not generate `fromJson` code for `location`.
To support the type `GeoPoint` you can:
* Use `JsonConverter`
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonConverter-class.html* Use `JsonKey` fields `fromJson` and `toJson`
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonKey/fromJson.html   
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonKey/toJson.html     
package:geopoint_test/place.freezed.dart:27:16
   ╷
27 │   GeoPoint get location => throw _privateConstructorUsedError;
   │                ^^^^^^^^
   ╵
[INFO] Running build completed, took 1m 18s
[INFO] Caching finalized dependency graph completed, took 328ms
[SEVERE] Failed after 1m 19s
PS D:\APPDEV\geopoint_test\geopoint_test>



Thank you very much for any kind of help!!
