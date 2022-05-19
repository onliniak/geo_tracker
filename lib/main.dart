import 'package:flutter/material.dart';

import 'data/WriteGPXFile.dart';
import 'ui/MyAppView.dart';

void main() {
  runApp(const MyApp());
  writeCounter('''<?xml version="1.0" encoding="UTF-8"?>
<gpx
  version="1.1"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://www.topografix.com/GPX/1/1"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
  <trk>
    <name>Example GPX Document</name>
    <trkseg> ''', true);
}