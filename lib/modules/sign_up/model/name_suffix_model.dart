import 'dart:convert';

class NameSuffixModel {
  String? code;
  String? message;
  List<ResponseData>? responseData;

  NameSuffixModel({this.code, this.message, this.responseData});

  NameSuffixModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];

    if (json['ResponseData'] != null) {
      // Decode ResponseData if it's a string
      final rawData = json['ResponseData'];
      if (rawData is String) {
        // Decode JSON string to List
        final decodedData = jsonDecode(rawData) as List;
        responseData =
            decodedData.map((v) => ResponseData.fromJson(v)).toList();
      } else if (rawData is List) {
        // Directly process if it's already a List
        responseData = rawData.map((v) => ResponseData.fromJson(v)).toList();
      }
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['Message'] = message;
    if (responseData != null) {
      data['ResponseData'] = responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  String? nameTitleCode;
  String? nameTitle;
  String? nameTitleEnglish;

  ResponseData({this.nameTitleCode, this.nameTitle, this.nameTitleEnglish});

  ResponseData.fromJson(Map<String, dynamic> json) {
    nameTitleCode = json['name_title_code'];
    nameTitle = json['name_title'];
    nameTitleEnglish = json['name_title_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_title_code'] = nameTitleCode;
    data['name_title'] = nameTitle;
    data['name_title_english'] = nameTitleEnglish;
    return data;
  }
}
