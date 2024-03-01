import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'meditation.g.dart';

typedef MeditationID = String;

@HiveType(typeId: 2)
class Meditation extends Equatable {
  @HiveField(1)
  final MeditationID id;
  @HiveField(2)
  final String audioURL;
  @HiveField(3)
  final String videoURL;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String subTitle;
  @HiveField(6)
  final String description;

  const Meditation({
    required this.id, 
    required this.audioURL, 
    required this.videoURL, 
    required this.title, 
    required this.subTitle, 
    required this.description
  });
  
  @override
  List<Object?> get props => [id, audioURL, videoURL, title];

  @override
  bool? get stringify => true;

  factory Meditation.fromMap(Map<String, dynamic> map) {
    return Meditation(
      id: map['id'] as String,
      audioURL: map['audioURL'] as String,
      videoURL: map['videoURL'] as String,
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'audioURL': audioURL,
        'videoURL': videoURL,
        'title': title,
        'subTitle': subTitle,
        'description': description,
      };

  Meditation copyWith({
    MeditationID? id,
    String? audioURL,
    String? videoURL,
    String? title,
    String? subTitle,
    String? description,
  }) {
    return Meditation(
      id: id ?? this.id,
      audioURL: audioURL ?? this.audioURL,
      videoURL: videoURL ?? this.videoURL,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
    );
  }
}