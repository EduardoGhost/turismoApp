import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectLocationPage extends StatefulWidget {
  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(0, 0);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      _getCurrentLocation();
    } else if (status.isDenied || status.isRestricted) {
      PermissionStatus permissionStatus = await Permission.location.request();
      if (permissionStatus.isGranted) {
        _getCurrentLocation();
      } else {
        // Permissão negada
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permissão de localização foi negada.')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      // Permissão negada permanentemente, abrir configurações
      openAppSettings();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
        _loading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao obter localização: $e')),
      );
    }
  }

  void _onMapTap(LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
    });
  }

  void _onConfirmLocation() {
    Navigator.of(context).pop(_selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a Localização'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _onConfirmLocation,
          ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _selectedLocation,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('selected-location'),
            position: _selectedLocation,
          ),
        },
        onTap: _onMapTap,
      ),
    );
  }
}



