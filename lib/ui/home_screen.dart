import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:madark/model/map_model.dart';
import 'package:madark/services/map/mapServices.dart';
import 'package:madark/ui/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  bool isLoading = true;
  bool isMapSelected= true;
  CameraPosition _kGooglePlex;
  Completer<GoogleMapController> _controller = Completer();
  Position position;
  List<Data> mapModel = List<Data>();
  List<Data> MapModelPaginated = List<Data>();
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 4.5),
        'assets/icons/pin.png');
  }

  getCurrentLocation() async{
    try{
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      position = Position(latitude: 24.723981,longitude: 46.691291);
    }
    catch(e){
      position = Position(latitude: 24.723981,longitude: 46.691291);
    }
    _kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
  }

  getMapData() async{
    if(mapModel.isNotEmpty){
      mapModel.clear();
      MapModelPaginated.clear();
    }

    mapModel = await MapServices().nearestSchools(position.latitude, position.longitude);
    /// we made this to use as a stack to pop the places that already i put in the markers list
    /// to avoid duplication on markers
    MapModelPaginated = List.from(mapModel);
  }

  initMarkers(){
    for(int i =0; i<10; i++){
      _markers.add(
          Marker(
            markerId: MarkerId("${mapModel[i].id}"),
            position: LatLng(mapModel[i].latitude, mapModel[i].longitude),
            icon: pinLocationIcon,
          )
      );
      /// pop the item as they already added to the _markers list
      MapModelPaginated.removeAt(i);
    }
  }

  getMoreData(LatLng now){
    for(int i=0; i<MapModelPaginated.length; i ++){
      double dis = calculateDistance(MapModelPaginated[i].latitude,MapModelPaginated[i].longitude,now.latitude,now.longitude);
      if(dis<=3){
        _markers.add(
            Marker(
              markerId: MarkerId("${MapModelPaginated[i].id}"),
              position: LatLng(MapModelPaginated[i].latitude, MapModelPaginated[i].longitude),
              icon: pinLocationIcon,
            )
        );
        MapModelPaginated.removeAt(i);
        setState(() {});
      }
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var pi = 0.017453292519943295;
    var cosin = cos;
    var result = 0.5 - cosin((lat2 - lat1) * pi)/2 +
        cosin(lat1 * pi) * cosin(lat2 * pi) *
            (1 - cosin((lon2 - lon1) * pi))/2;
    return 12742 * asin(sqrt(result));
  }


  getData() async{
    await getCurrentLocation();
    await getMapData();
    isLoading=false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMapPin();
    getData();
  }

  //TODO:: not implemeneted
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF58B6B1),
        title: Text("الرئيسية",style: Theme.of(context).textTheme.headline3,),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            //TODO:: remove this after debugging
            ///this is for just debugging
            Navigator.pushReplacementNamed(context, '/welcome');
          },
          child: Image.asset(
            "assets/icons/next.png",
            scale: 4,
          ),
        ),
        actions: [
          Image.asset("assets/icons/filter.png",scale: 3.5,)
        ],
      ),
      body: isLoading?
          Center(
            child: CircularProgressIndicator(),
          ):
      RefreshIndicator(
        onRefresh: () => getMapData(),
        child: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  zoomGesturesEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    initMarkers();
                    setState(() {});
                  },
                  onCameraMove: (camPos){
                    getMoreData(camPos.target);
                    setState(() {});
                  },
                  onCameraIdle: (){

                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          isMapSelected=false;
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                              border: Border.all(color: Color(0xFF58B6B1),),
                              color: Colors.white
                          ),
                          child: Image.asset("assets/icons/file.png", scale: 3.5,color: isMapSelected? Color(0xFFC8E6E5):Color(0xFF58B6B1),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          isMapSelected=true;
                          setState(() {});
                          //TODO:: shift screens
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
                              border: Border.all(color: Color(0xFF58B6B1)),
                              color: Colors.white
                          ),
                          child: Image.asset("assets/icons/map.png",scale: 3.5,color: isMapSelected? Color(0xFF58B6B1):Color(0xFFC8E6E5),),
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: InkWell(
                      onTap: () => print('not implemented yet'),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xFF58B6B1))
                          ),
                          alignment: Alignment.center,
                          child: Image.asset("assets/icons/supermarket.png",scale: 4,),
                        ),
                      ),
                    )
                )
              ],
            )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF58B6B1),
          unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/settings.png",scale: 4,),
            label: 'الاعدادات',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/heart.png",scale: 4,),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/profile.png",scale: 4,),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/submissions.png",scale: 4,),
            label: 'التقديمات',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

}

