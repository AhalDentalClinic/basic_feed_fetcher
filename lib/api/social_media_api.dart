import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

import '../data/constants/const_values.dart';
import '../data/models/social_media_paging_models.dart';
import '../data/models/social_media_post_models.dart';

class SocialMediaApi {
  final _dio = Dio();
  final _talker = Talker(loggerOutput: debugPrint);

  Future<void> fetchInstagramPosts({
    required String key,
    required InstagramPagingModel fillableInstagramPagingModel,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.getUri(
        Uri(
          scheme: ConstValues.httpsSchema,
          host: ConstValues.instagramHost,
          path: ConstValues.instagramPath,
          queryParameters: {
            ConstValues.instagramFields.key: ConstValues.instagramFields.value,
            ConstValues.instagramAccessToken: key,
          },
        ),
      );
      if (response.statusCode == ConstValues.successStatusCode) {
        final List<Map<String, dynamic>> postsPart =
            ((response.data as Map<String, dynamic>)['data'] as List).cast<Map<String, dynamic>>();
        final String cursorPart =
            (((response.data as Map)['paging'] as Map)['cursors'] as Map)['after'] as String;
        fillableInstagramPagingModel.setInstagramPostModels(
          postsPart
              .map((final instaPostModel) =>
                  InstagramPostModel.fromMap(instaPostModel.cast<String, String>()))
              .cast<InstagramPostModel>()
              .toList(),
        );
        fillableInstagramPagingModel.nextPostUrl = Uri.parse(cursorPart);
      } else {
        _talker
            .critical('Non successful response code received from fetching: $response.statusCode');
        fillableInstagramPagingModel.setInstagramPostModels([InstagramPostModel.errored()]);
      }
    } on Exception catch (error, stackTrace) {
      fillableInstagramPagingModel.setInstagramPostModels([InstagramPostModel.errored()]);
      _talker.handleException(error, stackTrace, 'Something went wrong');
    }
  }
}
