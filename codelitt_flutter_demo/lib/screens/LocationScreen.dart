

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Codelitt's Location")),
      body: GoogleMap(onMapCreated: (GoogleMapController controller) {
        controller.addMarker(MarkerOptions(position: codelitPosition,
        infoWindowText: InfoWindowText("Address", "331 NW 26th St., Suite 305, Miami, FL 33127"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
        controller.animateCamera(CameraUpdate.newLatLngZoom(codelitPosition, 16));
      },
          options: GoogleMapOptions(
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,)
      ),
    );
  }

  final codelitPosition = LatLng(25.801585, -80.201775);
}