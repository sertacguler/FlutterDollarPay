import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Dialog/DialogActionsEnum.dart';
import '../Dialog/ShowDialog.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  GoogleMapController? googleMapController;
  static LatLng _initialPosition = const LatLng(39.9988676, 32.8834089);

  Set<Marker> markers = {};

  double zoomValue = 14.0;

  late LatLng _cameraPosition;
  late double _cameraZoomValue;

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: _initialPosition, zoom: zoomValue),
          markers: markers.map((e) => e).toSet(),
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onTap: (LatLng latLng) async {
            print('LatLng value: ${latLng.latitude}, ${latLng.longitude}');
            Marker newMarker = Marker(
                markerId: MarkerId(latLng.toString()),
                position: LatLng(latLng.latitude, latLng.longitude),
                infoWindow: const InfoWindow(title: 'New Place'),
                icon: await getBitmapDescriptorFromSVGAsset(context,
                    'assets/svg/GreenMarker.svg' /*'assets/svg/RedMarker.svg'*/),
                onTap: () async {
                  final action = await Dialogs.dialog(
                      context, // Context
                      '', // Title
                      'Shell will be added to your locations', // Content
                      'Yes, add this location', // firstButton
                      'Cancel'); // secondButton
                  if (action == DialogAction.yes) {
                    setState(() => tappedYes = true);
                  } else {
                    setState(() => tappedYes = false);
                  }
                });
            setState(() {
              markers.add(newMarker);
            });
          },
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          onCameraMove: (cameraPosition) {
            _cameraPosition = cameraPosition.target;
            _cameraZoomValue = cameraPosition.zoom;
            print('MAPPP MOVEEE: $cameraPosition');
          }),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    var newPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 16);

    CameraUpdate update = CameraUpdate.newCameraPosition(newPosition);
    CameraUpdate zoom = CameraUpdate.zoomTo(16);

    googleMapController?.moveCamera(update);

    print('position value: $position');

    return position;
  }
}

Future<BitmapDescriptor> getBitmapDescriptorFromSVGAsset(
  BuildContext context,
  String svgAssetLink, {
  Size size = const Size(30, 30),
}) async {
  String svgString = await DefaultAssetBundle.of(context).loadString(
    svgAssetLink,
  );
  final drawableRoot = await svg.fromSvgString(
    svgString,
    'debug: $svgAssetLink',
  );
  final ratio = ui.window.devicePixelRatio.ceil();
  final width = size.width.ceil() * ratio;
  final height = size.height.ceil() * ratio;
  final picture = drawableRoot.toPicture(
    size: Size(
      width.toDouble(),
      height.toDouble(),
    ),
  );
  final image = await picture.toImage(width, height);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final uInt8List = byteData!.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(uInt8List);
}

// HowToUseGoogleMap ->  CurrentLocationScreen()

/*

  bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
          If (isIOS)
              return BitmapDescriptor.fromAsset('assets/icons/orange_pin.png');
         else
              return BitmapDescriptor.fromAsset(
              'assets/icons/3.0x/orange_pin.png');

*/