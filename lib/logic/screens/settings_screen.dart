import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions/build_context_extensions.dart';
import '../cache/image_cache_manager.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _settingsItem(
          context.fChanWords().settingBugReport,
          Icon(Icons.bug_report),
          () => launch('https://github.com/fartem/fchan/issues'),
        ),
        _settingsItem(
          context.fChanWords().settingsClearImageCache,
          Icon(Icons.image_not_supported_outlined),
          () => ImageCacheManager().emptyCache(),
        ),
      ],
    );
  }

  Widget _settingsItem(
    String title,
    Icon leading,
    Function onTap,
  ) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap,
    );
  }
}
