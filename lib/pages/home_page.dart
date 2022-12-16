import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/core/constants/key_constant.dart';
import 'package:weather_app/core/injection/injection.dart';
import 'package:weather_app/core/network/dio_config.dart';
import 'package:weather_app/cubit/location_cubit.dart';
import 'package:weather_app/data/data_sources/weather_data_source.dart';
import 'package:weather_app/data/models/location_body.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_location_usecase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;
  Placemark? placemark;
  final weatherCubit = di<WeatherCubit>();

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
    return BlocProvider<WeatherCubit>(
      create: (context) => weatherCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherSuccess) {
                return Text(state.response.parentCity.localizedName);
              }
              if (state is WeatherLoading) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await _determinePosition().then((value) {
            var locationBody = LocationBody(
          
                q: '${value.latitude},${value.longitude}');
            return weatherCubit.getLocation(locationBody);
          });
        }),
      ),
    );
  }
}
