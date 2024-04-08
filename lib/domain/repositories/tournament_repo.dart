import 'package:dio/dio.dart';
import 'package:running_community_mobile/utils/get_it.dart';

import '../../utils/messages.dart';
import '../models/tournaments.dart';

final Dio _apiClient = getIt.get<Dio>();

class TournamentRepo {
  Future<Tournaments> getTournaments({String? title, String? startTime, String? endTime, double? minDistance, double? maxDistance, double? longitude, double? latitude, int? pageSize, int? pageNumber}) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (title != null) queryParameters['title'] = title;
      if (startTime != null) queryParameters['duration.startTime'] = startTime;
      if (endTime != null) queryParameters['duration.endTime'] = endTime;
      if (minDistance != null) queryParameters['distance.minDistance'] = minDistance;
      if (maxDistance != null) queryParameters['distance.maxDistance'] = maxDistance;
      if (longitude != null) queryParameters['address.longitude'] = longitude;
      if (latitude != null) queryParameters['address.latitude'] = latitude;
      if (pageSize != null) queryParameters['pageSize'] = pageSize;
      if (pageNumber != null) queryParameters['pageNumber'] = pageNumber;
      final response = await _apiClient.get('/api/tournaments', queryParameters: queryParameters);
      return Tournaments.fromJson(response.data);
    } on DioException catch (e) {
      print('Error at getTournaments: $e');
      throw Exception(msg_server_error);
    }
  }
}