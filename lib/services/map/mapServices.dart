import 'package:dio/dio.dart';
import 'package:madark/model/map_model.dart';

class MapServices{
  final url = "http://206.189.56.223/api/";
  final nearestSchoolsEndPoint = "visitors/schools/nearest";

  Future<List<Data>> nearestSchools(double lat, double long) async{
    Response response;
    MapModel mapModel = MapModel();
    List<Data> data;
    try{
      response = await Dio().get("$url$nearestSchoolsEndPoint?latitude=$lat&longitude=$long");
      mapModel = MapModel.fromJson(response.data);
      data = mapModel.data;


    }
    on DioError catch(e){
      print('error in MapServices->nearestSchools => ${e.response.data}');
    }
    return data;
  }

}