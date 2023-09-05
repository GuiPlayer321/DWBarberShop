import 'package:dwbarbershop/src/core/restClient/rest_client.dart';
import 'package:dwbarbershop/src/repositories/user/user_repository.dart';
import 'package:dwbarbershop/src/repositories/user/user_repository_implements.dart';
import 'package:dwbarbershop/src/services/user_login/user_login_service.dart';
import 'package:dwbarbershop/src/services/user_login/user_login_service_implements.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));
