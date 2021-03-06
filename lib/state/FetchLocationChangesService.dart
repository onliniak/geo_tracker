import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../data/WriteGPXFile.dart';

void saveLocationAsGPX(LocationSettings locationSettings) {
  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position? position) {
    DateTime time = DateTime.now();
    writeGPX('''
    
      <trkpt lat="${position?.latitude.toString()}" lon="${position?.longitude.toString()}"><time>${time.year}-${time.month}-${time.day}T${time.hour}:${time.minute}:${time.second}Z</time></trkpt>''',
        false);
  });
}
