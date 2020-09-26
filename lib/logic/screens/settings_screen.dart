import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: _settings().map((e) {
          switch (e.settingsItemType) {
            case SettingsItemType.text:
              return ListTile(
                title: Text(e.title),
                onTap: () {

                },
              );
            case SettingsItemType.switcher:
              return Text('No impl');
          }
        })
        .toList(),
      ),
    );
  }

  List<SettingsItem> _settings() {
    return [
      SettingsItem.clickableText(
        'About No impl',
        () {},
      ),
    ];
  }
}

class SettingsItem {
  String title;
  dynamic value;
  SettingsItemType settingsItemType;
  Function onTap;

  SettingsItem();

  factory SettingsItem.categoryHeader(
      String headerTitle
  ) {
    return SettingsItem()
        ..title = headerTitle;
  }

  factory SettingsItem.clickableText(
      String title,
      Function() onTap,
  ) {
    return SettingsItem()
        ..title = title
        ..settingsItemType = SettingsItemType.text
        ..onTap = onTap;
  }
}

enum SettingsItemType {
  text,
  switcher,
}
