
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_config.dart';
import '../../generated/l10n.dart';
import '../theme/bloc/theme_bloc.dart';
import '../theme/bloc/theme_event.dart';
import '../theme/bloc/theme_state.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(AppConfig.appName),
    actions: <Widget>[
      BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return Container(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      state.isDarkMode ? S.of(context).light_mode : S.of(context).dark_mode,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      context.read<ThemeBloc>().add(const ThemeChanged());
                    },
                  )
                ],
              )
          );
        },
      )
    ],
  );
}

Widget emptyWidget() {
  return const SizedBox.shrink();
}

Widget buildLoadingIndicator(bool isLoading) {
  if (isLoading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return emptyWidget();
  }
}
