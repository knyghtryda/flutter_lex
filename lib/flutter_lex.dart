library flutter_lex;

import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'flutter_lex.g.dart';

///The different types of responses a [LexResponse] can be
enum DialogState {
  ElicitIntent,
  ConfirmIntent,
  ElicitSlot,
  Fulfilled,
  ReadyForFulfillment,
  Failed,
}

enum MessageFormat { PlainText, CustomPayload, SSML, Composite }

///The base class for [AmazonLex].
///
///Create a local instance to use.
///Note that this defaults to us-east-1 as the region.
class AmazonLex {
  final String _accessKey;
  final String _secretKey;
  final String _url;
  final String _region;
  final String _serviceName;

  AmazonLex(String accessKey, String secretKey,
      {String url = 'https://runtime.lex.us-east-1.amazonaws.com',
      String region = 'us-east-1',
      String serviceName = 'lex'})
      : this._accessKey = accessKey,
        this._secretKey = secretKey,
        this._url = url,
        this._region = region,
        this._serviceName = serviceName;

  Future<LexResponse> postResponse({
    @required String text,
    @required String botName,
    @required String botAlias,

    ///[userId] is the unique ID for the current user/session/etc
    ///This can be fixed, generated randomly, or taken from a known source.
    String userId = 'testuser123',
  }) async {
    assert(text != null);
    assert(botName != null);
    assert(botAlias != null);
    AwsSigV4Client client = AwsSigV4Client(
      _accessKey,
      _secretKey,
      _url,
      region: _region,
      serviceName: _serviceName,
    );
    final signedRequest = SigV4Request(
      client,
      method: 'POST',
      path: '/bot/$botName/alias/$botAlias/user/$userId/text',
      headers: Map<String, String>.from({
        'Content-Type': 'application/json; charset=utf-8',
      }),
      body: Map<String, dynamic>.from({"inputText": text}),
    );

    final response = await http.post(
      signedRequest.url,
      headers: signedRequest.headers,
      body: signedRequest.body,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value = json.decode(response.body);
      return LexResponse.fromJson(value);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return null;
    }
  }
}

@JsonSerializable(nullable: true)
class LexResponse {
  final DialogState dialogState;
  final String intentName, message;
  final MessageFormat messageFormat;
  final ResponseCard responseCard;
  final SentimentResponse sentimentResponse;
  final Map<String, String> sessionAttributes;
  final String sessionId;
  final Map<String, String> slots;
  final String slotToElicit;
  LexResponse(
      {this.dialogState,
      this.intentName,
      this.message,
      this.messageFormat,
      this.responseCard,
      this.sentimentResponse,
      this.sessionAttributes,
      this.sessionId,
      this.slots,
      this.slotToElicit});
  factory LexResponse.fromJson(Map<String, dynamic> json) =>
      _$LexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LexResponseToJson(this);
}

@JsonSerializable(nullable: true)
class ResponseCard {
  final String contentType;
  final List<GenericAttachment> genericAttachments;
  final String version;
  ResponseCard({this.contentType, this.genericAttachments, this.version});
  factory ResponseCard.fromJson(Map<String, dynamic> json) =>
      _$ResponseCardFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCardToJson(this);
}

@JsonSerializable(nullable: true)
class SentimentResponse {
  final String sentimentLabel;
  final String sentimentScore;
  SentimentResponse({this.sentimentLabel, this.sentimentScore});
  factory SentimentResponse.fromJson(Map<String, dynamic> json) =>
      _$SentimentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SentimentResponseToJson(this);
}

@JsonSerializable(nullable: true)
class GenericAttachment {
  final String attachmentLinkUrl;
  final List<Button> buttons;
  final String imageUrl;
  final String subTitle;
  final String title;
  GenericAttachment(
      {this.attachmentLinkUrl,
      this.buttons,
      this.imageUrl,
      this.subTitle,
      this.title});
  factory GenericAttachment.fromJson(Map<String, dynamic> json) =>
      _$GenericAttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$GenericAttachmentToJson(this);
}

@JsonSerializable(nullable: true)
class Button {
  final String text, value;
  Button({this.text, this.value});
  factory Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonToJson(this);
}

@JsonSerializable(nullable: false)
class Payload {
  final String inputText;
  Payload({this.inputText});
  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
