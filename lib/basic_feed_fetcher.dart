library basic_feed_fetcher;

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'api/social_media_api.dart';
import 'data/models/social_media_paging_models.dart';
import 'data/models/social_media_post_models.dart';

class InstagramBasicDisplay {
  InstagramBasicDisplay({required String key}) : _key = key {
    _init();
  }

  final String _key;

  final SocialMediaApi _socialMediaApi = SocialMediaApi();

  final InstagramPagingModel _instagramPagingModel = InstagramPagingModel();
  ValueListenable<List<InstagramPostModel>> get instagramPosts =>
      _instagramPagingModel.instagramPostModels;

  final Completer isReady = Completer();

  Future<void> _init() async {
    await _socialMediaApi.fetchInstagramPosts(
      key: _key,
      fillableInstagramPagingModel: _instagramPagingModel,
    );

    isReady.complete();
  }
}
