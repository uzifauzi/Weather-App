import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;
  Placemark? placemark;

  Future<void> geocoding(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    log(placemarks[0].administrativeArea ?? '-');
    log(placemarks[0].subAdministrativeArea ?? '-');
    log(placemarks[0].locality ?? '-');
    log(placemarks[0].subLocality ?? '-');
    log(placemarks[0].street ?? '-');
    log(placemarks[0].name ?? '-');

    setState(() {
      placemark = placemarks[0];
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Text('${position?.latitude}, ${position?.longitude}'),
          //Text('${placemark?.subLocality}'),
          FutureBuilder(
            future: _determinePosition(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log('${snapshot.data?.latitude}, ${snapshot.data?.longitude}');
                return Text(
                    '${snapshot.data?.latitude}, ${snapshot.data?.longitude}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              // position = await _determinePosition();

              // log('${position?.latitude}, ${position?.longitude}');
              // geocoding();

              // setState(() {});

              await _determinePosition().then(
                (value) => geocoding(value.latitude, value.longitude),
              );
            },
            child: Text('data'),
          )
        ],
      ),
    );
  }
}
