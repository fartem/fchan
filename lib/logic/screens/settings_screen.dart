import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/words/fchan_words.dart';
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
              title: fChanWords.settingsItemClearImageCache,
              leading: Icon(Icons.image_not_supported_outlined),
              onTap: () => ImageCacheManager().emptyCache(),
            ),
            _settingsSection(
              fChanWords.settingsCategoryInfo,
            ),
            _settingsClickableItem(
              title: fChanWords.settingItemBugReport,
              leading: Icon(Icons.bug_report),
              onTap: () => launch('https://github.com/fartem/fchan/issues'),
            ),
            _settingsInfoItem(
              title: fChanWords.settingItemAuthor,
              subtitle: 'fartem',
              icon: Icon(Icons.person),
              onTap: () => launch('https://github.com/fartem'),
            ),
            _settingsInfoItem(
              title: fChanWords.settingItemVersion,
              subtitle: snapshot.data!.version,
              icon: Icon(Icons.info_outline),
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
  Widget _settingsClickableItem({
    required String title,
    required Icon leading,
    required Function onTap,
  }) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap as void Function()?,
    );
  }

  // ignore: avoid-returning-widgets
  Widget _settingsInfoItem({
    required String title,
    required String subtitle,
    required Icon icon,
    Function? onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: icon,
      onTap: onTap as void Function()?,
    );
  }
}
