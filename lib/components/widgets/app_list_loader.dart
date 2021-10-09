import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';

class AppListLoader extends StatelessWidget {
  const AppListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 172,
        child: AppCenteredCircularProgressIndicator(),
      );
}
