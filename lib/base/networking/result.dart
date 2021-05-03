/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

// To parse this JSON data, do
//
//     final result = resultFromMap(jsonString);

import 'dart:convert';

class Result<T> {
  Result({
    this.status,
    this.error,
    this.text,
    this.messages,
    this.isError = false,
  });

  bool? status;
  bool? isError;
  String? error;
  String? text;
  String? messages;

  /// TO PARSE INTO MODEL USE .fromMap()
  T? body;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    text: json["text"] == null ? null : json["text"],
    messages: json["messages"] == null ? null : json["messages"],
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "text": text == null ? null : text,
    "messages": messages == null ? null : messages,
  };
}
