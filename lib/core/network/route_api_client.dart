import 'package:dio/dio.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';
import 'package:movies/features/profile/data/models/user_profile_data_model/user_profile_data_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'route_api_client.g.dart';

@RestApi()
abstract class RouteApiClient {
  @factoryMethod
  factory RouteApiClient(Dio dio) = _RouteApiClient;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequset loginRequest);

  @POST(ApiConstants.register)
  Future<RegisterResposne> register(@Body() RegisterRequest registerRequest);
    @GET(ApiConstants.getprofile)
  Future<UserProfileDataModel> getUserProfileData(@Header("authorization") String token);
  }
