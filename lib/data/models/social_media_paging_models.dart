import 'package:flutter/foundation.dart';

import 'social_media_post_models.dart';

class InstagramPagingModel {
  InstagramPagingModel({
    required List<InstagramPostModel> instaPostModels,
    this.nextPostsUrl,
  }) : _instagramPostModels = ValueNotifier(instaPostModels);

  InstagramPagingModel.errored()
      : _instagramPostModels = ValueNotifier([InstagramPostModel.errored()]),
        nextPostsUrl = null;

  final ValueNotifier<List<InstagramPostModel>> _instagramPostModels;
  ValueListenable<List<InstagramPostModel>> get instagramPostModels => _instagramPostModels;

  final Uri? nextPostsUrl;
}
