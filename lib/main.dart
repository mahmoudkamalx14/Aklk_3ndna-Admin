import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/functions/check_state_chenges.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/features/home/presentation/logic/bottom_nav_bar_cubit.dart';
import 'package:aklk_3ndna/features/home/presentation/view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkStateChanges();
  runApp(
    CustomMultiBlocProvider(),
  );
}

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnectionCubit()..checkConnectivity(),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..mealModel,
        ),
      ],
      child: const Aklk3ndna(),
    );
  }
}

class Aklk3ndna extends StatelessWidget {
  const Aklk3ndna({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
