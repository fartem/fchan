import 'package:fchan/components/words/fchan_words.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../cache/image_cache_manager.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CenteredCircularProgressIndicatorWidget();
        }
        final fChanWords = context.read<FChanWords>();
        return ListView(
          children: [
            _settingsSection(
              fChanWords.settingsCategoryStorage,
            ),
            _settingsClickableItem(
              fChanWords.settingsItemClearImageCache,
              Icon(Icons.image_not_supported_outlined),
              () => ImageCacheManager().emptyCache(),
            ),
            _settingsSection(
              fChanWords.settingsCategoryInfo,
            ),
            _settingsClickableItem(
              fChanWords.settingItemBugReport,
              Icon(Icons.bug_report),
              () => launch('https://github.com/fartem/fchan/issues'),
            ),
            _settingsInfoItem(
              fChanWords.settingItemAuthor,
              'fartem',
              Icon(Icons.person),
              () => launch('https://github.com/fartem'),
            ),
            _settingsInfoItem(
              fChanWords.settingItemVersion,
              snapshot.data!.version,
              Icon(Icons.info_outline),
              null,
            ),
          ],
        );
      },
    );
  }

  // ignore: avoid-returning-widgets
  Widget _settingsSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  // ignore: avoid-returning-widgets
  Widget _settingsClickableItem(
    String title,
    Icon leading,
    Function onTap,
  ) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap as void Function()?,
    );
  }

  // ignore: avoid-returning-widgets
  Widget _settingsInfoItem(
    String title,
    String subtitle,
    Icon leading,
    Function? onTap,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: leading,
      onTap: onTap as void Function()?,
    );
  }
}
