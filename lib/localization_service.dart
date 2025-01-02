import 'dart:convert';
import 'package:flutter/services.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  factory LocalizationService() => _instance;
  LocalizationService._internal();

  Map<String, dynamic> _localizedStrings = {};

  Future<void> loadLanguage(String langCode) async {
    String jsonString =
        await rootBundle.loadString('assets/langs/$langCode.json');
    _localizedStrings = json.decode(jsonString);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

final localizationService = LocalizationService();
