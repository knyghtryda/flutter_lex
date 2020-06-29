// GENERATED CODE - DO NOT MODIFY BY HAND

part of flutter_lex;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LexResponse _$LexResponseFromJson(Map<String, dynamic> json) {
  return LexResponse(
    dialogState:
        _$enumDecodeNullable(_$DialogStateEnumMap, json['dialogState']),
    intentName: json['intentName'] as String,
    message: json['message'] as String,
    messageFormat:
        _$enumDecodeNullable(_$MessageFormatEnumMap, json['messageFormat']),
    responseCard: json['responseCard'] == null
        ? null
        : ResponseCard.fromJson(json['responseCard'] as Map<String, dynamic>),
    sentimentResponse: json['sentimentResponse'] == null
        ? null
        : SentimentResponse.fromJson(
            json['sentimentResponse'] as Map<String, dynamic>),
    sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    sessionId: json['sessionId'] as String,
    slots: (json['slots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    slotToElicit: json['slotToElicit'] as String,
  );
}

Map<String, dynamic> _$LexResponseToJson(LexResponse instance) =>
    <String, dynamic>{
      'dialogState': _$DialogStateEnumMap[instance.dialogState],
      'intentName': instance.intentName,
      'message': instance.message,
      'messageFormat': _$MessageFormatEnumMap[instance.messageFormat],
      'responseCard': instance.responseCard,
      'sentimentResponse': instance.sentimentResponse,
      'sessionAttributes': instance.sessionAttributes,
      'sessionId': instance.sessionId,
      'slots': instance.slots,
      'slotToElicit': instance.slotToElicit,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DialogStateEnumMap = {
  DialogState.ElicitIntent: 'ElicitIntent',
  DialogState.ConfirmIntent: 'ConfirmIntent',
  DialogState.ElicitSlot: 'ElicitSlot',
  DialogState.Fulfilled: 'Fulfilled',
  DialogState.ReadyForFulfillment: 'ReadyForFulfillment',
  DialogState.Failed: 'Failed',
};

const _$MessageFormatEnumMap = {
  MessageFormat.PlainText: 'PlainText',
  MessageFormat.CustomPayload: 'CustomPayload',
  MessageFormat.SSML: 'SSML',
  MessageFormat.Composite: 'Composite',
};

ResponseCard _$ResponseCardFromJson(Map<String, dynamic> json) {
  return ResponseCard(
    contentType: json['contentType'] as String,
    genericAttachments: (json['genericAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : GenericAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$ResponseCardToJson(ResponseCard instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'genericAttachments': instance.genericAttachments,
      'version': instance.version,
    };

SentimentResponse _$SentimentResponseFromJson(Map<String, dynamic> json) {
  return SentimentResponse(
    sentimentLabel: json['sentimentLabel'] as String,
    sentimentScore: json['sentimentScore'] as String,
  );
}

Map<String, dynamic> _$SentimentResponseToJson(SentimentResponse instance) =>
    <String, dynamic>{
      'sentimentLabel': instance.sentimentLabel,
      'sentimentScore': instance.sentimentScore,
    };

GenericAttachment _$GenericAttachmentFromJson(Map<String, dynamic> json) {
  return GenericAttachment(
    attachmentLinkUrl: json['attachmentLinkUrl'] as String,
    buttons: (json['buttons'] as List)
        ?.map((e) =>
            e == null ? null : Button.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageUrl: json['imageUrl'] as String,
    subTitle: json['subTitle'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$GenericAttachmentToJson(GenericAttachment instance) =>
    <String, dynamic>{
      'attachmentLinkUrl': instance.attachmentLinkUrl,
      'buttons': instance.buttons,
      'imageUrl': instance.imageUrl,
      'subTitle': instance.subTitle,
      'title': instance.title,
    };

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return Button(
    text: json['text'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ButtonToJson(Button instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload(
    inputText: json['inputText'] as String,
  );
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'inputText': instance.inputText,
    };
