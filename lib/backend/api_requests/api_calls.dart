import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApipostCall {
  static Future<ApiCallResponse> call({
    String? str = '',
    int? vid,
    int? lang,
    int? gender,
    int? age,
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$str",
  "voice_id": $vid,
  "language": $lang,
  "gender": $gender,
  "age": $age
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apipost',
      apiUrl: 'https://client.camb.ai/apis/tts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'd397ee18-bd17-4755-830b-d3c7f9b25bd2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApipostoneCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'apipostone',
      apiUrl: 'https://client.camb.ai/apis/tts/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': 'd397ee18-bd17-4755-830b-d3c7f9b25bd2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiposttwoCall {
  static Future<ApiCallResponse> call({
    int? runId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiposttwo',
      apiUrl: 'https://client.camb.ai/apis/tts_result/$runId',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': 'd397ee18-bd17-4755-830b-d3c7f9b25bd2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
