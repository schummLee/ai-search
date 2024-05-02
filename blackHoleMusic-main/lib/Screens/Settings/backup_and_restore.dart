import 'package:blackhole/CustomWidgets/box_switch_tile.dart';
import 'package:blackhole/CustomWidgets/gradient_containers.dart';
import 'package:blackhole/CustomWidgets/snackbar.dart';
import 'package:blackhole/Helpers/backup_restore.dart';
import 'package:blackhole/Helpers/config.dart';
import 'package:blackhole/Helpers/picker.dart';
import 'package:blackhole/Services/ext_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class BackupAndRestorePage extends StatefulWidget {
  const BackupAndRestorePage({super.key});

  @override
  State<BackupAndRestorePage> createState() => _BackupAndRestorePageState();
}

class _BackupAndRestorePageState extends State<BackupAndRestorePage> {
  final Box settingsBox = Hive.box('settings');
  final MyTheme currentTheme = GetIt.I<MyTheme>();
  String autoBackPath = Hive.box('settings').get(
    'autoBackPath',
    defaultValue: '/storage/emulated/0/BlackHole/Backups',
  ) as String;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(
              context,
            )!
                .backNRest,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      )
    );
  }
}
