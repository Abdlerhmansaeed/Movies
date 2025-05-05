import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'torrent.g.dart';

@JsonSerializable()
class Torrent extends Equatable {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  @JsonKey(name: 'is_repack')
  final String? isRepack;
  @JsonKey(name: 'video_codec')
  final String? videoCodec;
  @JsonKey(name: 'bit_depth')
  final String? bitDepth;
  @JsonKey(name: 'audio_channels')
  final String? audioChannels;
  final int? seeds;
  final int? peers;
  final String? size;
  @JsonKey(name: 'size_bytes')
  final int? sizeBytes;
  @JsonKey(name: 'date_uploaded')
  final String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int? dateUploadedUnix;

  const Torrent({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return _$TorrentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TorrentToJson(this);

  @override
  List<Object?> get props {
    return [
      url,
      hash,
      quality,
      type,
      isRepack,
      videoCodec,
      bitDepth,
      audioChannels,
      seeds,
      peers,
      size,
      sizeBytes,
      dateUploaded,
      dateUploadedUnix,
    ];
  }
}
