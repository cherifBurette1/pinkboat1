import 'package:flutter/material.dart';
import 'package:flutterapp/Routing.dart';
import 'package:flutterapp/common/config.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import './Containers/signin.dart';
import './Widgets/sharedpref.dart';
import 'dart:io';
// import 'package:dynamic_theme/dynamic_theme.dart';

import 'theme_changer/test_theme_page.dart';
import 'theme_changer/theme_changer.dart';

dynamic chk;
dynamic chk1;
dynamic fingerchk;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await checkshared();
  await check2ndflag();
  await check3rdflag();
  runApp(App());
}

bool nnnn = false;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.light()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    if (chk == true) {
      if (chk1 == true) nnnn = true;
    } else {
      nnnn = false;
    }
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: AppTitle,
      home: mainrr(context),
      //  home: TestTheme(),
      theme: theme.getTheme(),
    );
  }
}
