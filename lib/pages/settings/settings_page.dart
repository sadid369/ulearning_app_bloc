import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    void removeUserData() async {
      bool isRemoveData = await Global.storageService
          .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      log(isRemoveData.toString());
      if (isRemoveData) {
        context.read<AppBloc>().add(TriggerAppEvents(index: 0));
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body:
          SingleChildScrollView(child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            ),
          );
        },
      )),
    );
  }
}
