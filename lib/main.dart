import 'package:flutter/material.dart';
import 'localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localizationService.loadLanguage('en'); // بارگذاری زبان پیش‌فرض
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizationService.translate('hello')),
        actions: [
          DropdownButton<String>(
            value: _selectedLanguage,
            items: [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'es', child: Text('Español')),
              DropdownMenuItem(value: 'fr', child: Text('Français')),
              DropdownMenuItem(value: 'de', child: Text('Deutsch')),
              DropdownMenuItem(value: 'fa', child: Text('فارسی')),
            ],
            onChanged: (value) async {
              if (value != null) {
                setState(() => _selectedLanguage = value);
                await localizationService.loadLanguage(value);
                setState(() {});
              }
            },
          )
        ],
      ),
      body: Center(child: Text(localizationService.translate('welcome'))),
    );
  }
}
