import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:song_viewer/blocs/file_system/file_system_bloc.dart';
import 'package:song_viewer/blocs/load_data/load_data_bloc.dart';
import 'package:song_viewer/blocs/memory/memory_bloc.dart';
import 'package:song_viewer/screens/initial.dart';

import 'constants/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadDataBloc()..add(LoadDataEventLoadData()),
        ),
        BlocProvider(create: (context) => FileSystemBloc()),
        BlocProvider(
          create: (context) => MemoryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Song Viewer',
        theme: AppTheme.themeData,
        home: InitialScreen(),
      ),
    );
  }
}
