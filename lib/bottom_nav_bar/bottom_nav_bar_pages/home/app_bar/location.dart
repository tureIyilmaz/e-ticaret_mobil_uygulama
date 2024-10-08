import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController mapController;
  final LatLng _initialPosition =
      const LatLng(41.0351, 28.8641); // İstanbul, Bağcılar koordinatları
  String _address = 'Seçili adres burada görünecek';
  LatLng _selectedLatLng = const LatLng(41.0351, 28.8641);
  bool _isLoading = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getAddressFromLatLng(LatLng coordinates) async {
    setState(() {
      _isLoading = true;
      _address = 'Adres bilgisi yükleniyor...';
    });

    // ignore: unrelated_type_equality_checks
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          coordinates.latitude,
          coordinates.longitude,
        ).timeout(const Duration(seconds: 20));

        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          setState(() {
            _address =
                "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
          });
        } else {
          setState(() {
            _address = 'Adres bilgisi alınamadı: Boş sonuç';
          });
        }
      } on TimeoutException {
        setState(() {
          _address = 'Adres bilgisi alınamadı: Zaman aşımı';
        });
      } catch (e) {
        setState(() {
          _address = 'Adres bilgisi alınamadı: $e';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _address = 'İnternet bağlantısı yok';
        _isLoading = false;
      });
    }
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _selectedLatLng = tappedPoint;
      _address = 'Adres bilgisi yükleniyor...';
    });

    _getAddressFromLatLng(tappedPoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adresini Seç')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: _address,
                    border: const OutlineInputBorder(),
                  ),
                ),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTap,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("selected-location"),
                  position: _selectedLatLng,
                  draggable: true,
                  onDragEnd: (newPosition) {
                    _onMapTap(newPosition);
                  },
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
