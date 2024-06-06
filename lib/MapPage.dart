import 'package:flutter/material.dart';
import 'package:flutter_application_2/aikey.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapUI extends StatefulWidget {
  const MapUI({super.key});

  @override
  State<MapUI> createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {
  final String apiKey = aikey().apiKey;
  final List<Marker> currentLocationMarkers = [];
  final List<Marker> searchMarkers = [];
  final List<Map<String, dynamic>> searchResults = [];
  LatLng currentLocation = LatLng(40.87784, -73.89163); // Default location
  MapController mapController = MapController();
  final PanelController panelController = PanelController();

  getAddresses(value, lat, lon) async {
    final Map<String, String> queryParameters = {'key': apiKey};
    queryParameters['lat'] = '$lat';
    queryParameters['lon'] = '$lon';
    var response = await http.get(Uri.https(
        'api.tomtom.com', '/search/2/search/$value.json', queryParameters));
    var jsonData = convert.jsonDecode(response.body);
    print('$jsonData');
    var results = jsonData['results'];
    setState(() {
      searchMarkers.clear(); // Clear old search markers
      searchResults.clear(); // Clear old search results
      for (var element in results) {
        var position = element['position'];
        var name = element['poi']['name'];
        var marker = Marker(
          point: LatLng(position['lat'], position['lon']),
          width: 50.0,
          height: 50.0,
          child: Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 30,
          ),
        );
        searchMarkers.add(marker);
        searchResults.add({
          'name': name,
          'location': LatLng(position['lat'], position['lon'])
        });
      }
      panelController.open(); // Open the sliding panel when search is performed
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      currentLocationMarkers.clear(); // Clear old current location marker
      currentLocationMarkers.add(Marker(
        point: currentLocation,
        width: 50.0,
        height: 50.0,
        child:  Icon(
          Icons.location_on,
          color: Colors.red,
          size: 30,
        ),
      ));
      mapController.move(currentLocation, 15.0);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cookie Map'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        backgroundColor: const Color.fromARGB(255, 3, 90, 161),  
      ),
      body: SlidingUpPanel(
        controller: panelController,
        panel: _buildPanel(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) {
                  print('$value');
                  getAddresses(value, currentLocation.latitude,
                      currentLocation.longitude);
                },
              ),
            ),
            Expanded(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: currentLocation,
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://api.tomtom.com/map/1/tile/basic/main/{z}/{x}/{y}.png?key=$apiKey',
                    additionalOptions: {
                      'apiKey': apiKey,
                    },
                  ),
                  MarkerLayer(markers: currentLocationMarkers + searchMarkers),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          _getCurrentLocation();
          panelController.close(); // Close the sliding panel when FAB is pressed
        },
        child: const Icon(Icons.my_location, color: Colors.white,),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        Container(
          width: 30,
          height: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 132, 203, 218),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Text(
                  searchResults[index]['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  mapController.move(searchResults[index]['location'], 15.0);
                  panelController.close();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
