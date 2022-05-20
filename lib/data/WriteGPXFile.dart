import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File?> writeGPX(String counter, bool write) async {
  final directory = await getExternalStorageDirectory();
  final path = directory?.path;
  final file = File("$path/my.gpx");

  if (write == true) {
    return file.writeAsString(counter);
  }
  if (write == false) {
    // Write the file
    return file.writeAsString(counter, mode: FileMode.append);
  }
}
