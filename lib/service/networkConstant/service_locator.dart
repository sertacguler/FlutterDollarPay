import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networkConstant/DioClient.dart';
import '../UserServices/UserApi.dart';
import '../UserServices/UserController.dart';
import '../UserServices/UserRepository.dart';
import '../VendorService/VendorApi.dart';
import '../VendorService/VendorController.dart';
import '../VendorService/VendorRepository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
  getIt.registerSingleton(UserController());

  getIt.registerSingleton(VendorApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(VendorRepository(getIt.get<VendorApi>()));
  getIt.registerSingleton(VendorController());
}
