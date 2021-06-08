import 'dart:convert';

import 'package:flutter/foundation.dart';

class Photo {
  final String id;
  final String secret;
  final String server;
  final String title;
  List<String>? tags;
  Photo({
    required this.id,
    required this.secret,
    required this.server,
    required this.title,
    this.tags,
  });

  Photo copyWith({
    String? id,
    String? secret,
    String? server,
    String? title,
    List<String>? tags,
  }) {
    return Photo(
      id: id ?? this.id,
      secret: secret ?? this.secret,
      server: server ?? this.server,
      title: title ?? this.title,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'secret': secret,
      'server': server,
      'title': title,
      'tags': tags,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      secret: map['secret'],
      server: map['server'],
      title: map['title'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(id: $id, secret: $secret, server: $server, title: $title, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Photo &&
        other.id == id &&
        other.secret == secret &&
        other.server == server &&
        other.title == title &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        secret.hashCode ^
        server.hashCode ^
        title.hashCode ^
        tags.hashCode;
  }
}

extension photoExt on Photo {
  String getUrl(String size) {
    return 'https://live.staticflickr.com/${this.server}/${this.id}_${this.secret}_$size.jpg';
  }
}
