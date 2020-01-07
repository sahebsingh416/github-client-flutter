import 'package:chopper/chopper.dart';

part 'services.chopper.dart';

@ChopperApi(baseUrl: "/repos")
abstract class Services extends ChopperService {

@Get(path: "/{username}/{reponame}/commits")
Future<Response> getCommits(@Path("username") String username, @Path("reponame") String reponame);

static Services create() { 
    final client = ChopperClient(
        baseUrl: "https://api.github.com",
        services: [
          _$Services(),
        ],
        converter: JsonConverter());
        return _$Services(client);
  }

}