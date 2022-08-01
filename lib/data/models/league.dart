import 'dart:convert';

class League {
  String id;
  String name;
  League({
    required this.id,
    required this.name,
  });

  League copyWith({
    String? id,
    String? name,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory League.fromJson(String source) => League.fromMap(json.decode(source));

  @override
  String toString() => 'League(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is League &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
