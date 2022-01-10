import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';

class TerdekatPage extends StatefulWidget {
  const TerdekatPage({Key key}) : super(key: key);

  @override
  _TerdekatPageState createState() => _TerdekatPageState();
}

class _TerdekatPageState extends State<TerdekatPage> {
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

/*   void getCurrentLocation() async {
    var position = await Geolocator().getCurrentPosition
  } */

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
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                        margin: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: new Text(
                                'Gerobak Mang OKE - Tunjung',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Row(
                              children: [
                                Text(
                                  "0,7 km",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Icon(Icons.star),
                                Text(
                                  "4.6 (33)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              children: [Text("Makanan Bakso")],
                            ),
                            Divider(color: Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => pesanSheet(),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(170, 40),
                                      shape: StadiumBorder()),
                                  child: Text(
                                    "Pesan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => detailSheet(),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey,
                                      fixedSize: const Size(170, 40),
                                      shape: StadiumBorder()),
                                  child: Text(
                                    "Lihat Detail",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ));
                  });
            },
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGooglemapController = controller;
              locatePosition();
            },
            initialCameraPosition: _kGooglePlex),
      ),

      /*  MaterialButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Text('heyooo'),
                        );
                      })) */
    );
  }

  Widget detailSheet() => Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: new Text(
              'Gerobak Mang OKE - Tunjung',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Row(
            children: [
              Text(
                "0,7 km",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Icon(Icons.star),
              Text(
                "4.6 (33)",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          ),
          Row(
            children: [Text("Makanan Bakso")],
          ),
          Row(children: [
            Text("Sedia : \n 1. Bakso kuah \n 2. Bakso bakar"),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text(
                "Bisa memilih tingkat pedas: \n Pedas gila, pedas nikmat, gak pedas"),
          ]),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => pesanSheet(),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 40), shape: StadiumBorder()),
                child: Text(
                  "Pesan",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TerdekatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    fixedSize: const Size(170, 40),
                    shape: StadiumBorder()),
                child: Text(
                  "Kembali",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ));
  Widget pesanSheet() => Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: IconButton(
                icon: Image.asset('assets/images/profile.png'),
                onPressed: () {}),
            title: Text.rich(
              TextSpan(
                  text: 'Dipesan oleh',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  children: [
                    TextSpan(
                      text: '\nYuskiah',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ]),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: IconButton(
                icon: Image.asset('assets/images/stand_icon.png'),
                onPressed: () {}),
            title: Text.rich(
              TextSpan(
                  text: 'Pedagang dalam perjalanan . . .',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  children: [
                    TextSpan(
                      text: '\nGerobak Mang OKE - Tunjung',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ]),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => detailPesanSheet(),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 40), shape: StadiumBorder()),
                child: Text(
                  "Oke",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          )
        ],
      ));
  Widget detailPesanSheet() => Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: IconButton(
                icon: Image.asset('assets/images/stand_icon.png'),
                onPressed: () {}),
            title: Text.rich(
              TextSpan(
                  text: 'Terima kasih, Yuskiah!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  children: [
                    TextSpan(
                      text: '\n4 Okt 2021, 13.10',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ]),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: HexColor("#EBEBEB"),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10, width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                  text: 'Total Pembayaran',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  children: [
                                    TextSpan(
                                      text: '\nRp20.000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: HexColor("#EBEBEB"),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Diskon",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "-2.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Poin",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "+5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gimana pesanannya?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: HexColor("#C4C4C4"),
                      ),
                      Icon(
                        Icons.star,
                        color: HexColor("#C4C4C4"),
                      ),
                      Icon(
                        Icons.star,
                        color: HexColor("#C4C4C4"),
                      ),
                      Icon(
                        Icons.star,
                        color: HexColor("#C4C4C4"),
                      ),
                      Icon(
                        Icons.star,
                        color: HexColor("#C4C4C4"),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TerdekatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 40), shape: StadiumBorder()),
                child: Text(
                  "Pesan lagi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TerdekatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    fixedSize: const Size(170, 40),
                    shape: StadiumBorder()),
                child: Text(
                  "Oke",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          )
        ],
      ));
}
