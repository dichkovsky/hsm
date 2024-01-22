import 'package:equatable/equatable.dart';

typedef MeditationID = String;

class Meditation extends Equatable {
  final MeditationID id;
  final String videoURL;
  final String title;
  final String description;

  Meditation({
    required this.id, 
    required this.videoURL, 
    required this.title, 
    required this.description
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}