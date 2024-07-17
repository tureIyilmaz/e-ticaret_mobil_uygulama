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
  final LatLng _center =
      const LatLng(41.0351, 28.8641); // İstanbul, Bağcılar koordinatları

  String _address = 'Seçili adres burada görünecek';
  LatLng _selectedLatLng = const LatLng(41.0351, 28.8641);
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> _getAddressFromLatLng(LatLng coordinates) async {
    setState(() {
      _isLoading = true;
      _address = 'Adres bilgisi yükleniyor...';
      _addressController.text = _address;
    });

    if (await _checkInternetConnection()) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          coordinates.latitude,
          coordinates.longitude,
        ).timeout(const Duration(seconds: 20)); // Zaman aşımı süresi 20 saniye

        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          setState(() {
            _address =
                "${placemark.street}, ${placemark.locality}, ${placemark.subLocality}, ${placemark.administrativeArea}, ${placemark.country}";
            _addressController.text = _address; // Update the text field
          });
        } else {
          setState(() {
            _address = 'Adres bilgisi alınamadı: Boş sonuç';
            _addressController.text = _address;
          });
        }
      } on TimeoutException catch (_) {
        setState(() {
          _address = 'Adres bilgisi alınamadı: Zaman aşımı';
          _addressController.text = _address;
        });
      } catch (e) {
        setState(() {
          _address = 'Adres bilgisi alınamadı: $e';
          _addressController.text = _address;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _address = 'İnternet bağlantısı yok';
        _addressController.text = _address;
        _isLoading = false;
      });
    }
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _selectedLatLng = tappedPoint;
      _address =
          'Adres bilgisi yükleniyor...'; // Placeholder while fetching the address
      _addressController.text = _address; // Update the text field
    });

    _getAddressFromLatLng(tappedPoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adresini Seç')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Adres',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
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
                target: _center,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("selected-location"),
                  position: _selectedLatLng,
                  draggable: true,
                  onDragEnd: (newPosition) {
                    setState(() {
                      _selectedLatLng = newPosition;
                      _address =
                          'Adres bilgisi yükleniyor...'; // Placeholder while fetching the address
                      _addressController.text =
                          _address; // Update the text field
                    });
                    _getAddressFromLatLng(newPosition);
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
