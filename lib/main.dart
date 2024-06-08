import 'package:flutter/material.dart';
import 'package:gemini_chat_app/provider/chat_provider.dart';
import 'package:gemini_chat_app/provider/settings_provider.dart';
import 'package:gemini_chat_app/screens/home_screen.dart';
import 'package:gemini_chat_app/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await ChatProvider.initHive();
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) =>ChatProvider()),
        ChangeNotifierProvider(create: (context) =>SettingsProvider()),
    ],
     child:  const MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
   setTheme();
    super.initState();
  }
  void setTheme(){
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.getSavedSettings();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<SettingsProvider>().isDarkMode
       ? darkTheme
      : lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

