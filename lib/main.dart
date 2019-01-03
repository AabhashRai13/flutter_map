import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Map(),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => new _MapState();
}

class _MapState extends State<Map> {
  MapController controller = new MapController();

  getPermission() async{


    GeolocationStatus geolocationStatus = await Geolocator().checkGeolocationPermissionStatus(

    );
    return result;
  }

 /* getLocation(){
    return getPermission().then((result) async{
      final coords =
          await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
    });
  }

  buildMap(){
    getLocation().then((response){
      if (response.isSuccessful){
        response.listen((value){
          controller.move(new LatLng(Value.location.latitude, value.location.longitude), 15.0);
        });
      }
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Leaflet Maps boi'),
        ),
        body: new FlutterMap(
             mapController: controller,
            options: new MapOptions(
                center: new LatLng(27.7172, 85.3240), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(27.7172, 85.3240),
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.red,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker Tapped');
                            },
                          ),
                        ))
              ])
            ])); // TODO: implement build
  }
}
