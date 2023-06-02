import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/getx_loclization/lang_controller.dart';

class LanguageWidget extends StatelessWidget {
  final LocaleController languageControl = Get.find();

  LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      underline: Container(),
      value: languageControl.currentLocale,
      items: const [
        DropdownMenuItem<Locale>(
          value: Locale('en', 'US'),
          child: Text('English'),
        ),
        DropdownMenuItem<Locale>(
          value: Locale('ur', 'PK'),
          child: Text('Urdu'),
        ),
      ],
      onChanged: (Locale? selectedLocale) {
        languageControl.updateLocale(selectedLocale!);
      },
    );
  }
}
