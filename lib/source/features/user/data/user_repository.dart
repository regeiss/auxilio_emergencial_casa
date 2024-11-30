import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auxilio_emergencial/source/features/user/application/api_service.dart';
import 'package:auxilio_emergencial/source/features/user/domain/user.dart';

final apiService = Provider<UserApiService>((ref) => UserApiService());
final userDataProvider =
    FutureProvider<List<User>>((ref) => ref.read(apiService).getUser());
