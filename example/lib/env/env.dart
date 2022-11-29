import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'INSTAGRAM_API_KEY')
  static const instagramApiKey = _Env.instagramApiKey;
  @EnviedField(varName: 'FACEBOOK_API_KEY')
  static const facebookApiKey = _Env.facebookApiKey;
  @EnviedField(varName: 'TWITTER_API_KEY')
  static const twitterApiKey = _Env.twitterApiKey;
}
