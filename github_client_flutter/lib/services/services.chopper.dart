// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$Services extends Services {
  _$Services([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Services;

  @override
  Future<Response> getCommits(String username, String reponame) {
    final $url = '/repos/$username/$reponame/commits';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
