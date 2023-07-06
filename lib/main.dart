
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timerstringcounter/presentation/cubits/base/user/user_cubit.dart';
import 'package:timerstringcounter/presentation/view/timer_page.dart';
import 'package:timerstringcounter/presentation/view/userList.dart';
import 'package:timerstringcounter/utilis/locator.dart';

import 'domain/repositories/api_repository.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(
            locator<ApiRepository>()
        )..getCountryList()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TimerString/Api Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Api Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const UserList(),
      floatingActionButton: FloatingActionButton.large(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:  (context)=>const TimerPage()));
      },child: const Text('Timer'),),
    );
  }
}


