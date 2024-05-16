import 'package:youtube_explode_dart/src/channels/channel_uploads_list.dart';
import 'package:youtube_explode_dart/src/reverse_engineering/pages/channel_page.dart';
import 'package:youtube_explode_dart/src/reverse_engineering/pages/watch_page.dart';

import '../common/common.dart';
import '../extensions/helpers_extension.dart';
import '../playlists/playlists.dart';
import '../reverse_engineering/pages/channel_about_page.dart';
import '../reverse_engineering/pages/channel_upload_page.dart';
import '../reverse_engineering/youtube_http_client.dart';
import '../videos/video.dart';
import '../videos/video_id.dart';
import 'channel.dart';
import 'channel_id.dart';
import 'channel_uploads_list.dart';
import 'channels.dart';
import 'username.dart';
import 'video_sorting.dart';

/// Queries related to YouTube channels.
class ChannelClient {
  final YoutubeHttpClient _httpClient;

  /// Initializes an instance of [ChannelClient]
  const ChannelClient(this._httpClient);

  /// Gets the metadata associated with the specified channel.
  /// [id] must be either a [ChannelId] or a string
  /// which is parsed to a [ChannelId]
  Future<Channel> get(dynamic id) async {
    id = ChannelId.fromString(id);
    var channelPage = await ChannelPage.get(_httpClient, id.value);

    return Channel(id, channelPage.channelTitle, channelPage.channelLogoUrl,
        channelPage.subscribersCount);
  }

  /// Gets the metadata associated with the channel of the specified user.
  /// [username] must be either a [Username] or a string
  /// which is parsed to a [Username]
  Future<Channel> getByUsername(dynamic username) async {
    username = Username.fromString(username);

    var channelPage =
        await ChannelPage.getByUsername(_httpClient, username.value);
    return Channel(ChannelId(channelPage.channelId), channelPage.channelTitle,
        channelPage.channelLogoUrl, channelPage.subscribersCount);
  }

  /// Gets the info found on a YouTube Channel About page.
  /// [id] must be either a [ChannelId] or a string
  /// which is parsed to a [ChannelId]
  Future<ChannelAbout> getAboutPage(dynamic channelId) async {
    channelId = ChannelId.fromString(channelId);

    final aboutPage = await ChannelAboutPage.get(_httpClient, channelId.value);

    return ChannelAbout(
        aboutPage.description,
        aboutPage.viewCount,
        aboutPage.joinDate,
        aboutPage.title,
        [
          for (var e in aboutPage.avatar)
            Thumbnail(Uri.parse(e['url']), e['height'], e['width'])
        ],
        aboutPage.country,
        aboutPage.channelLinks);
  }

  /// Gets the info found on a YouTube Channel About page.
  /// [username] must be either a [Username] or a string
  /// which is parsed to a [Username]
  Future<ChannelAbout> getAboutPageByUsername(dynamic username) async {
    username = Username.fromString(username);

    var channelAboutPage =
        await ChannelAboutPage.getByUsername(_httpClient, username.value);

    // TODO: Expose metadata from the [ChannelAboutPage] class.
    var id = channelAboutPage.initialData;
    return ChannelAbout(
        id.description,
        id.viewCount,
        id.joinDate,
        id.title,
        [
          for (var e in id.avatar)
            Thumbnail(Uri.parse(e['url']), e['height'], e['width'])
        ],
        id.country,
        id.channelLinks);
  }

  /// Gets the metadata associated with the channel
  /// that uploaded the specified video.
  Future<Channel> getByVideo(dynamic videoId) async {
    videoId = VideoId.fromString(videoId);
    var videoInfoResponse = await WatchPage.get(_httpClient, videoId.value);
    var playerResponse = videoInfoResponse.playerResponse!;

    var channelId = playerResponse.videoChannelId;
    return get(ChannelId(channelId));
  }

  /// Enumerates videos uploaded by the specified channel.
  /// If you want a full list of uploads see [getUploadsFromPage]
  Stream<Video> getUploads(dynamic channelId) {
    channelId = ChannelId.fromString(channelId);
    var playlistId = 'UU${(channelId.value as String).substringAfter('UC')}';
    return PlaylistClient(_httpClient).getVideos(PlaylistId(playlistId));
  }

  /// Enumerates videos uploaded by the specified channel.
  /// This fetches thru all the uploads pages of the channel so it is
  /// recommended to use _.take_ (or any other method) to limit the
  /// search result. Every page has 30 results.
  ///
  /// Note that this endpoint provides less info about each video
  /// (only the Title and VideoId).
  Future<ChannelUploadsList> getUploadsFromPage(dynamic channelId,
      [VideoSorting videoSorting = VideoSorting.newest]) async {
    channelId = ChannelId.fromString(channelId);
    final page = await ChannelUploadPage.get(
        _httpClient, (channelId as ChannelId).value, videoSorting.code);

    final channel = await get(channelId);

    return ChannelUploadsList(
        page.uploads
            .map((e) => Video(
                e.videoId,
                e.videoTitle,
                channel.title,
                channelId,
                e.videoUploadDate.toDateTime(),
                null,
                '',
                e.videoDuration,
                ThumbnailSet(e.videoId.value),
                null,
                Engagement(e.videoViews, null, null),
                false))
            .toList(),
        channel.title,
        channelId,
        page,
        _httpClient);
  }
}
