import 'dart:async';
import 'dart:io';

Future<File?> writeCounter(String counter, bool write) async {
  final file = File('/data/data/io.github.onliniak.geo_tracker/files/my.gpx');

  if (write == true) {
    return file.writeAsString(counter);
  }
  if (write == false) {
    // Write the file
    return file.writeAsString(counter, mode: FileMode.append);
  }
}
