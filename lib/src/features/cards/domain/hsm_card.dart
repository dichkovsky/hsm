import 'package:equatable/equatable.dart';

typedef HSMCardID = String;

class HSMCard extends Equatable {
  final HSMCardID id;
  final int cardNo;
  final String faceURL;
  final String soundURL;
  final String title;
  final String description;
  final String visualization;
  final String general;
  final String relationship;
  final String workFinance;
  final String health;

  const HSMCard({
    required this.id,
    required this.cardNo,
    required this.faceURL,
    required this.soundURL,
    required this.title,
    required this.description,
    required this.visualization,
    required this.general,
    required this.relationship,
    required this.workFinance,
    required this.health,
  });

  @override
  List<Object?> get props => [id, cardNo, faceURL, title];

  @override
  bool? get stringify => true;

  factory HSMCard.fromMap(Map<String, dynamic> map) {
    return HSMCard(
      id: map['id'] as String,
      cardNo: map['cardNo']?.toInt() ?? 0,
      faceURL: map['faceURL'] as String,
      soundURL: map['soundURL'] as String,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      visualization: map['visualization'] ?? '',
      general: map['general'] ?? '',
      relationship: map['relationship'] ?? '',
      workFinance: map['workFinance'] ?? '',
      health: map['health'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'cardNo': cardNo,
        'faceURL': faceURL,
        'soundURL': soundURL,
        'title': title,
        'description': description,
        'visualization': visualization,
        'general': general,
        'relationship': relationship,
        'workFinance': workFinance,
        'health': health,
      };

  HSMCard copyWith({
    HSMCardID? id,
    int? cardNo,
    String? faceURL,
    String? soundURL,
    String? title,
    String? description,
    String? visualization,
    String? general,
    String? relations,
    String? workFinance,
    String? health,
  }) {
    return HSMCard(
      id: id ?? this.id,
      cardNo: cardNo ?? this.cardNo,
      faceURL: faceURL ?? this.faceURL,
      soundURL: soundURL ?? this.soundURL,
      title: title ?? this.title,
      description: description ?? this.description,
      visualization: visualization ?? this.visualization,
      general: general ?? this.general,
      relationship: relations ?? relationship,
      workFinance: workFinance ?? this.workFinance,
      health: health ?? this.health,
    );
  }
}
