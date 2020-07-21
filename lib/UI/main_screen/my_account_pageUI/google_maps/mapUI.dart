import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set <Marker> _markers = new Set();

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تعديل الموقع'),
          backgroundColor: Colors.yellow[600],
        ),
        body: Column(children: [
          Expanded(
            flex: 9,
            child: Container(
              child: GoogleMap(
                markers: _markers,
                onTap: _handleTap,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                myLocationEnabled: true,

              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: FlatButton(
                      color: Colors.yellow[600],
                      onPressed: (){

                      },
                      child: Text("تأكيد",
                      style: TextStyle(
                        fontSize: 20.0
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          )

        ]),


    );
  }

  _handleTap(LatLng point) {

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      ));
    });
  }
  }

