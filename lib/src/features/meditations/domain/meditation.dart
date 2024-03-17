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
  final String coverURL;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String subTitle;
  @HiveField(6)
  final String description;
  @HiveField(7)
  final int duration;

  const Meditation({
    required this.id, 
    required this.audioURL, 
    required this.coverURL, 
    required this.title, 
    required this.subTitle, 
    required this.description,
    required this.duration
  });
  
  @override
  List<Object?> get props => [id, audioURL, coverURL, title];

  @override
  bool? get stringify => true;

  factory Meditation.fromMap(Map<String, dynamic> map) {
    return Meditation(
      id: map['id'] as String,
      audioURL: map['audioURL'] as String,
      coverURL: map['coverURL'] as String,
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      description: map['description'] ?? '',
      duration: map['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'audioURL': audioURL,
        'coverURL': coverURL,
        'title': title,
        'subTitle': subTitle,
        'description': description,
        'duration': duration,
      };

  Meditation copyWith({
    MeditationID? id,
    String? audioURL,
    String? coverURL,
    String? title,
    String? subTitle,
    String? description,
    int? duration,
  }) {
    return Meditation(
      id: id ?? this.id,
      audioURL: audioURL ?? this.audioURL,
      coverURL: coverURL ?? this.coverURL,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      duration: duration ?? this.duration,
    );
  }
}