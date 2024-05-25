import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/src/core/bloc_observer.dart';
import 'package:flutter_task/src/core/dependency_injection/di.dart';
import 'package:flutter_task/src/core/hive_service/hive_service.dart';
import 'package:flutter_task/src/core/router/router.dart';
import 'package:flutter_task/src/presentation/bloc_manager/manager_bloc.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DartPluginRegistrant.ensureInitialized();
      Bloc.observer = AppBlocObserver();
      await HiveService.instance.initHiveData();
      configureDependencies();
      runApp(const MyApp());
    },
    (error, stackTrace) async {
      debugPrint("\x1B[31mGlobal Error: $error\x1B[0m");
      debugPrint("\x1B[31mGlobal StackTrace: $stackTrace\x1B[0m");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerBloc(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Task',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "EG"),
            ],
            locale: Locale("ar", "EG"),
            initialRoute: AppRouterNames.rHome,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
