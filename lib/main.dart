import 'package:flutter/material.dart';

import 'data/WriteGPXFile.dart';
import 'ui/MyAppView.dart';

void main() {
  runApp(const MyApp());
  writeGPX('''<?xml version="1.0"?>
<gpx xmlns:wptx1="http://www.garmin.com/xmlschemas/WaypointExtension/v1" xmlns:gpxedw="http://www.gpxeditor.co.uk/xmlschemas/WaypointExtension/v1" xmlns:gpxedts="http://www.gpxeditor.co.uk/xmlschemas/TrackSegExtension/v1" xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" creator="GPXEditor" version="1.1" xmlns="http://www.topografix.com/GPX/1/1">
  <trk>
    <name>Example GPX Document</name>
    <trkseg> ''', true);
}
