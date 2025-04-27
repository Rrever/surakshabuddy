import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Ensure this import is present

class SurakshaBuddyMap extends StatefulWidget {
  const SurakshaBuddyMap({super.key});

  @override
  SurakshaBuddyMapState createState() => SurakshaBuddyMapState();
}

class SurakshaBuddyMapState extends State<SurakshaBuddyMap> {
  late GoogleMapController mapController;
  bool showPoliceStations = true;
  bool showHospitals = true;
  bool showHotspots = true;
  bool showContacts = false;

  final LatLng _center = const LatLng(28.6139, 77.2090); // Default to Delhi coordinates

  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};
  final List<LocationItem> _nearbyLocations = [
    LocationItem("Delhi Police Station", "1.2 km", Icons.local_police),
    LocationItem("AIIMS Hospital", "2.5 km", Icons.local_hospital),
    LocationItem("Safdarjung Hospital", "3.1 km", Icons.local_hospital),
    LocationItem("Local Police Booth", "0.8 km", Icons.local_police),
  ];

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      // User location marker with pulsing circle
      _markers.add(
        Marker(
          markerId: MarkerId('user'),
          position: _center,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );

      _circles.add(
        Circle(
          circleId: CircleId('pulse'),
          center: _center,
          radius: 500,
          strokeWidth: 2,
          strokeColor: Colors.blue.withAlpha(128), // 0.5 opacity
          fillColor: Colors.blue.withAlpha(51), // 0.2 opacity
        ),
      );

      // Police stations (blue)
      if (showPoliceStations) {
        _markers.add(
          Marker(
            markerId: MarkerId('police1'),
            position: LatLng(28.6139 + 0.01, 77.2090 + 0.01),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(title: 'Police Station 1'),
          ),
        );
      }

      // Hospitals (green)
      if (showHospitals) {
        _markers.add(
          Marker(
            markerId: MarkerId('hospital1'),
            position: LatLng(28.6139 - 0.01, 77.2090 + 0.01),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(title: 'Hospital 1'),
          ),
        );
      }

      // Hotspots (red)
      if (showHotspots) {
        _markers.add(
          Marker(
            markerId: MarkerId('hotspot1'),
            position: LatLng(28.6139 + 0.01, 77.2090 - 0.01),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: 'Recent Incident'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: _markers,
            circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          
          // Top controls
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Live Safety Map',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilterChip(
                        label: Text('Police Stations'),
                        selected: showPoliceStations,
                        onSelected: (bool selected) {
                          setState(() {
                            showPoliceStations = selected;
                            _addMarkers();
                          });
                        },
                        selectedColor: Colors.blue[100],
                        checkmarkColor: Colors.blue[800],
                      ),
                      FilterChip(
                        label: Text('Hospitals'),
                        selected: showHospitals,
                        onSelected: (bool selected) {
                          setState(() {
                            showHospitals = selected;
                            _addMarkers();
                          });
                        },
                        selectedColor: Colors.green[100],
                        checkmarkColor: Colors.green[800],
                      ),
                      FilterChip(
                        label: Text('Hotspots'),
                        selected: showHotspots,
                        onSelected: (bool selected) {
                          setState(() {
                            showHotspots = selected;
                            _addMarkers();
                          });
                        },
                        selectedColor: Colors.red[100],
                        checkmarkColor: Colors.red[800],
                      ),
                      FilterChip(
                        label: Text('Contacts'),
                        selected: showContacts,
                        onSelected: (bool selected) {
                          setState(() {
                            showContacts = selected;
                          });
                        },
                        selectedColor: Colors.purple[100],
                        checkmarkColor: Colors.purple[800],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Floating action buttons
          Positioned(
            right: 16,
            bottom: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'sos',
                  onPressed: () => _showSOSDialog(),
                  backgroundColor: Colors.red,
                  mini: true,
                  child: Icon(Icons.emergency, color: Colors.white),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: 'report',
                  onPressed: () => _showReportDialog(),
                  backgroundColor: Colors.orange,
                  mini: true,
                  child: Icon(Icons.report, color: Colors.white),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: 'help',
                  onPressed: () => _showNearestHelp(),
                  backgroundColor: Colors.green,
                  mini: true,
                  child: Icon(Icons.help, color: Colors.white),
                ),
              ],
            ),
          ),
          
          // Bottom drawer
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.15,
            maxChildSize: 0.4,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _nearbyLocations.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      );
                    }
                    final item = _nearbyLocations[index - 1];
                    return ListTile(
                      leading: Icon(item.icon, color: Colors.blue[800]),
                      title: Text(item.name),
                      subtitle: Text(item.distance),
                      trailing: IconButton(
                        icon: Icon(Icons.call, color: Colors.green),
                        onPressed: () => _callLocation(item.name),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showSOSDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Send SOS Alert'),
        content: Text('Are you sure you want to send an emergency alert to your contacts and nearby authorities?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('SOS Alert Sent! Help is on the way!')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Send SOS'),
          ),
        ],
      ),
    );
  }

  void _showReportDialog() {
    // Implement report incident dialog
  }

  void _showNearestHelp() {
    // Implement nearest help functionality
  }

  void _callLocation(String locationName) {
    // Implement call functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Calling $locationName...')),
    );
  }
}

class LocationItem {
  final String name;
  final String distance;
  final IconData icon;

  LocationItem(this.name, this.distance, this.icon);
}