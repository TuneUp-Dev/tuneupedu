import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuneupedu/auth/services/checking_auth.dart';
import 'package:tuneupedu/firebase/firebase_options.dart';
import 'package:tuneupedu/routes/app_routes.dart';
import 'package:tuneupedu/theme/app_color.dart';
import 'package:tuneupedu/theme/app_text_theme.dart';
import 'package:tuneupedu/theme/theme_provider.dart';

Future<void> main() async {
  // String dbName = 'development';
  final themeProvider = ThemeProvider();
  await themeProvider.loadThemePreference();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      // name: dbName,
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDfSznlqZ7eYnemiJczvs4LrIg_8hOWMLc',
        appId: '1:1014929579030:web:3883b52fde89003a136937',
        messagingSenderId: '1014929579030',
        projectId: 'tuneupedu',
        authDomain: 'tuneupedu.firebaseapp.com',
        storageBucket: 'tuneupedu.firebasestorage.app',
        measurementId: 'G-NDVCQBPRK4',
      ),
    );
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    //await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    await Firebase.initializeApp(
      // name: dbName,
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.fuchsia) {
    await Firebase.initializeApp(
      // name: dbName,
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (_) => themeProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetMaterialApp(
      title: 'TuneUp Edu',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        drawerTheme: DrawerThemeData(
            backgroundColor: Theme.of(context).colorScheme.onSurface),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: CustomTextStyle.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface),
        ),
        textTheme: GoogleFonts.spinnakerTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.tertiary,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.gray),
          trackColor: WidgetStateProperty.all(
            AppColors.primary,
          ),
        ),
      ),
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        primaryColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          titleTextStyle: CustomTextStyle.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        textTheme: GoogleFonts.spinnakerTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const CheckingAuth(),
      getPages: AppRoutes.routes,
    );
  }
}
