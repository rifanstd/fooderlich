import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class Recipes {
  late final String uri;
  late final String label;

  Recipes(this.uri, this.label);

  Recipes.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uri': uri, 'label': label};
  }
}
