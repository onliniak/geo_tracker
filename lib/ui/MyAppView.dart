import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_tracker/data/WriteGPXFile.dart';
import 'package:geolocator/geolocator.dart';

import '../state/StartLocationService.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: FutureBuilder(
            // https://stackoverflow.com/questions/51983011/when-should-i-use-a-futurebuilder
            future: determinePosition(),
            builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: Text('Loading....'));
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(
                        child: MaterialButton(
                            onPressed: () {
                              writeCounter('''
    </trkseg>
  </trk>
</gpx>''', false);
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            child: const Text('''
                            STOP
                            
1. Włącz dowolną aplikację korzystającą z GPSu. 
2. Geo Tracker uruchomi się w tle i zapisze (co 10 sekund) aktualną lokalizację do pliku my.gpx
3. Kiedy skończysz, kliknij wielki STOP powyżej.
4. Nie musisz już narzekać, że Twoja ulubiona aplikacja nie potrafi zapisać trasy, jaką właśnie pokonałeś
5. Geo Tracker został stworzony do konkretnych zadań i nie jest aplikacją ogólnego przeznaczenia
                            ''')));
                  }
              }
            },
          ),
        ));
  }
}
