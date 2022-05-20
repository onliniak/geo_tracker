import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> writeGPX(String counter, bool write) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

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
