import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/core/utils/constants.dart';
import 'package:tourism_app/features/splashScreen/presentation/splash_screen.dart';
import 'core/network/dio_helper.dart';
import 'core/network/local/cache.dart';
import 'core/network/local/hive_data_base.dart';
import 'core/themes/light.dart';
import 'core/utils/bloc_observe.dart';

//Widget appStartScreen = const SplashScreenOne();
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  // Hive
  //await Hive.initFlutter();
  // dio
  await DioHelper.init();

  userCache = await openHiveBox(userCacheBoxKey);

  //onBoardingValue = userCache?.get(onBoardingKey, defaultValue: true);
  //userCacheValue = LoginModel.fromJson(jsonDecode(await userCache!.get(userCacheKey, defaultValue: '{}')));
  //Constants.token = userCacheValue?.data?.token ?? '';
  // Constants.user = userCacheValue?.data?.type == 'developer';
  // checkInCache = userCache?.get(checkInKey, defaultValue: false);
  //log('user id ======> ${userCacheValue?.data?.id}');
  //log('user token ======> ${userCacheValue?.data?.token}');
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await NotificationUtility.initializeAwesomeNotification();
  // try {
  //   Constants.messageGlobal = await FirebaseMessaging.instance.getInitialMessage();
  //   if (Constants.messageGlobal?.data != null) {
  //     appStartScreen = const NavBArScreens();
  //   }
  //   log('appStartScreen $appStartScreen');
  // } catch (error) {
  //   log('$error');
  // }
  // selectTokens();
  // Constants.jsonServerKey = await loadJsonFile();
  runApp(
    DevicePreview(
      // enabled: false,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'SA'),
          ],
          path: 'assets/translation',
          startLocale: const Locale('en', 'US'),
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    arabicLanguage = context.locale.toString() == 'ar_SA';
    Constants.tablet = MediaQuery.of(context).size.width > 600;
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 840),
      // child: MultiBlocProvider(
      //   providers: const [
      //     // BlocProvider(create: (_) => ChatCubit()),
      //     // BlocProvider(create: (_) => BottomNavBarCubit()),
      //     // BlocProvider(create: (_) => ServiceDetailsCubit()),
      //   ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: navigatorKey,
        //locale: DevicePreview.locale(context),
        //builder: DevicePreview.appBuilder,
        theme: light,
        home: SplashScreen(),
      ),
    );
  }
}
//updates
