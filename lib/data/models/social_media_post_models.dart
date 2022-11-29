import '../constants/const_values.dart';
import '../enums/social_media_enums.dart';

class InstagramPostModel {
  const InstagramPostModel({
    // this.caption,
    // this.id,
    required this.instaMediaType,
    required this.mediaUrl,
    // this.mediaPermaUrl,
    required this.thumbnailUrl,
    // this.timestamp,
    // this.username,
  });

  InstagramPostModel.errored()
      : instaMediaType = InstaMediaType.image,
        mediaUrl = Uri.parse(ConstValues.noAvailableImageUrl),
        thumbnailUrl = Uri.parse(ConstValues.noAvailableImageUrl);

  // /// The Media's caption text. Not returnable for Media in albums.
  // final String? caption;
  //
  // /// The Media's ID.
  // final String? id;

  /// The Media's type
  final InstaMediaType instaMediaType;

  /// The Media's URL.
  final Uri mediaUrl;

  // /// The Media's permanent URL.
  // ///
  // /// Will be omitted if the Media contains copyrighted material, or has been flagged for a copyright violation.
  // final Uri? mediaPermaUrl;

  /// The Media's thumbnail image URL.
  ///
  /// Only available on VIDEO Media.
  final Uri thumbnailUrl;

  // /// The Media's publish date in ISO 8601 format.
  // final DateTime? timestamp;
  //
  // /// The Media owner's username.
  // final String? username;

  factory InstagramPostModel.fromMap(Map<String, String> postData) {
    final InstaMediaType instaMediaType;
    switch (postData['media_type']) {
      case 'IMAGE':
        instaMediaType = InstaMediaType.image;
        break;
      case 'VIDEO':
        instaMediaType = InstaMediaType.video;
        break;
      default:
        instaMediaType = InstaMediaType.carouselAlbum;
    }

    return InstagramPostModel(
        instaMediaType: instaMediaType,
        mediaUrl: Uri.parse(postData['media_url'] ?? ''),
        thumbnailUrl: Uri.parse(postData['thumbnail_url'] ?? postData['media_url'] ?? ''));
  }
}
