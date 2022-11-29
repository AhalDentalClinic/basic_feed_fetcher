import 'dart:async';

import 'package:dio/dio.dart';

import '../data/constants/const_values.dart';
import '../data/models/social_media_paging_models.dart';
import '../data/models/social_media_post_models.dart';

class SocialMediaApi {
  final _dio = Dio();

  FutureOr<InstagramPagingModel> fetchInstagramPosts({
    required String key,
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
      if (response.statusCode != ConstValues.successStatusCode)
        return InstagramPagingModel.errored();

      final List<Map<String, dynamic>> postsPart =
          ((response.data as Map<String, dynamic>)['data'] as List).cast<Map<String, dynamic>>();
      final String cursorPart = ((response.data as Map)['paging'] as Map)['next'] as String;
      return InstagramPagingModel(
        instaPostModels: postsPart
            .map((final instaPostModel) =>
                InstagramPostModel.fromMap(instaPostModel.cast<String, String>()))
            .cast<InstagramPostModel>()
            .toList(),
        nextPostsUrl: Uri.parse(cursorPart),
      );
    } catch (error, stackTrace) {
      return InstagramPagingModel.errored();
    }
  }
}
