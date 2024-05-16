import 'package:freezed_annotation/freezed_annotation.dart';

import '../../extensions/helpers_extension.dart';
import 'closed_caption_format.dart';
import 'language.dart';

part 'closed_caption_track_info.freezed.dart';

part 'closed_caption_track_info.g.dart';

/// Metadata associated with a certain [ClosedCaptionTrack]
@freezed
class ClosedCaptionTrackInfo with _$ClosedCaptionTrackInfo {
  /// Initializes an instance of [ClosedCaptionTrackInfo]
  const factory ClosedCaptionTrackInfo(

      /// Manifest URL of the associated track.
      Uri url,

      /// Language of the associated track.
      Language language,
      {
      /// Whether the associated track was automatically generated.
      @Default(false) bool isAutoGenerated,

      /// Track format
      required ClosedCaptionFormat format}) = _ClosedCaptionTrackInfo;

  const ClosedCaptionTrackInfo._();

  /// Returns this auto-translated to another language.
  /// Keeping the same format.
  ClosedCaptionTrackInfo autoTranslate(String lang) {
    return ClosedCaptionTrackInfo(
        url.replaceQueryParameters({'tlang': lang}), Language(lang, lang),
        isAutoGenerated: isAutoGenerated, format: format);
  }

  @override
  String toString() => 'CC Track ($language)';

  ///
  factory ClosedCaptionTrackInfo.fromJson(Map<String, dynamic> json) =>
      _$ClosedCaptionTrackInfoFromJson(json);
}