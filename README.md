# instagram_basic_display

An all-inclusive plugin, for fetching your own posts, from social media platforms such as Facebook, Instagram and Twitter.\
At the moment only the following platforms are supported:
 1. Instagram

More would follow in the future:
 1. Facebook
 2. Twitter

## Getting Started
### Obtain access_tokens
+ Instagram
    + Follow these steps at [developers.facebook.com](https://developers.facebook.com/docs/instagram-basic-display-api/overview#instagram-user-access-tokens).
        + Create your app with the appropriate permissions.
        + Obtain the final `user_access_token`.
+ Facebook
    + (Coming in the near future. Stay tuned!)
+ Twitter
    + (Coming in the near future. Stay tuned!)

### Store the key securely
These keys are vital to the security of you facebook app, and so should not be stored publicly.
You could use the following ways to store your keys:
 + Locally
   1. Use Environment variables.
   2. Use a secure storage package such as [Envied](https://pub.dev/packages/envied).
 + Online
   1. Use Firebase's Secure Storage.
   2. Use Firebase's Remote Config (for easier refreshing) of the keys.
   3. Any other server of your choice.

I am a fan of Remote Config + Envied (as backup).

### Depend on the package

Run this command:

With Flutter:

```shell
 $ flutter pub add instagram_basic_display
```

This will add a line like this to your package's pubspec.yaml (and run an implicit `flutter pub get`):

```yaml
dependencies:
  instagram_basic_display: ^0.0.1
```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

### Import the package

Now in your Dart code, you can use:

```dart
import 'package:instagram_basic_display/instagram_basic_display.dart';
```