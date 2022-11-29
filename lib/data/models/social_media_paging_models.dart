import 'package:flutter/foundation.dart';

import 'social_media_post_models.dart';

class InstagramPagingModel {
  InstagramPagingModel() : _instagramPostModels = ValueNotifier(List.empty(growable: true));

  InstagramPagingModel.errored()
      : _instagramPostModels = ValueNotifier([InstagramPostModel.errored()]),
        _nextPostsUrl = null;

  final ValueNotifier<List<InstagramPostModel>> _instagramPostModels;
  ValueListenable<List<InstagramPostModel>> get instagramPostModels => _instagramPostModels;

  Uri? _nextPostsUrl;

  void setInstagramPostModels(List<InstagramPostModel> setPostModels) =>
      _instagramPostModels.value.addAll(setPostModels);
  set nextPostUrl(Uri? setNextPostUrl) => _nextPostsUrl = setNextPostUrl;
}
