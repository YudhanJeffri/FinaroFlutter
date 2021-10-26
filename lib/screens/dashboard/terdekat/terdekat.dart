import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TerdekatPage extends StatefulWidget {
  const TerdekatPage({Key key}) : super(key: key);

  @override
  _TerdekatPageState createState() => _TerdekatPageState();
}

class _TerdekatPageState extends State<TerdekatPage> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.534770, 109.120157),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGooglemapController;
  BitmapDescriptor customIcon;
  Set<Marker> markers;
  Position currentPosition;
  var geoLocator = Geolocator();
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatposition = LatLng(position.latitude, position.latitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatposition, zoom: 14);
    newGooglemapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              configuration, 'assets/images/stand_icon.png')
          .then((icon) {
        setState(() {
          customIcon = icon;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text("Terdekat", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: GoogleMap(
          markers: markers,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          onTap: (pos) {
            print(pos);
            Marker m = Marker(
                markerId: MarkerId('1'), icon: customIcon, position: pos);
            setState(() {
              markers.add(m);
            });
          },
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMap.complete(controller);
            newGooglemapController = controller;
            locatePosition();
          },
          initialCameraPosition: _kGooglePlex,
        ),
      ),
    );
  }
}
