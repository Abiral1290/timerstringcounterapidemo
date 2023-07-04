import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

   final TextEditingController textEditingController = TextEditingController();

 final alphanumer = RegExp(r'^[0-9]{1,2}h:$',caseSensitive: false);
 final alphanumer1 = RegExp(r'^[0-9]{1,2}m:$',caseSensitive: false);
 final alphanumer2 = RegExp(r'^[0-9]{1,2}s$');
 final alphanumer3 = RegExp(r'^[0-9]{1,2}h:[0-9]{1,2}m:$',caseSensitive: false);
 final alphanumer4 = RegExp(r'^[0-9]{1,2}m:[0-9]{1,2}s$',caseSensitive: false);
 final alphanumer5 = RegExp(r'^[0-9]{1,2}h:[0-9]{1,2}m:[0-9]{1,2}s$',caseSensitive: false);

   Timer? _timer;
   int _hour =0;
   int _min =0;
   int _sec =0;


 void starterTimer(){

   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
     setState(() {
       if (_sec > 0) {
         _sec--;
       } else {
         if (_min > 0) {
           _min--;
           _sec = 59;
         } else {
           if (_hour > 0) {
             _hour--;
             _min = 59;
             _sec = 59;
           } else {
            // _isRunning = false;
             _timer?.cancel();
           }
         }
       }
     });
   });

   // _timer=  Timer.periodic(Duration(seconds: 1), (timer) {
   //   setState(() {
   //     _hour--;
   //     _sec--;
   //     _min--;
   //   });
   //
   // });
 }

   // void _startTimer() {
   //   setState(() {
   //     _isRunning = true;
   //   });
   //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
   //     setState(() {
   //       if (_seconds > 0) {
   //         _seconds--;
   //       } else {
   //         if (_minutes > 0) {
   //           _minutes--;
   //           _seconds = 59;
   //         } else {
   //           if (_hours > 0) {
   //             _hours--;
   //             _minutes = 59;
   //             _seconds = 59;
   //           } else {
   //             _isRunning = false;
   //             _timer?.cancel();
   //           }
   //         }
   //       }
   //     });
   //   });
   // }

 void parseTimeString( ){

   _timer?.cancel();
   if(alphanumer.hasMatch(textEditingController.text)){
     String ints=textEditingController.text.
     replaceAll(RegExp(r'h:$'), '');
     log(ints);
     _hour = int.parse(ints);
     starterTimer();
   }else if( alphanumer1.hasMatch(textEditingController.text)){
     _min = int.parse(textEditingController.text.
     replaceAll(RegExp(r'm:$'), ''));
     starterTimer();
   }else if( alphanumer2.hasMatch(textEditingController.text)){
     _sec = int.parse(textEditingController.text.
     replaceAll(RegExp(r's$'), ''));
     starterTimer();
   }
   else if( alphanumer3.hasMatch(textEditingController.text)){
     final iss = textEditingController.text.
     split(RegExp(r'h:'),);
     log(iss.toString());
     _hour = int.parse(iss[0]);
     _min = int.parse(iss.last.replaceAll(RegExp(r'm:'),
         ''));
     starterTimer();
   }else if( alphanumer4.hasMatch(textEditingController.text)){
     final iss = textEditingController.text.
     split(RegExp(r'm:'),);
     log(iss.toString());
     _hour = int.parse(iss[0]);
     _min = int.parse(iss.last.replaceAll(RegExp(r's'),
         ''));
     starterTimer();
   }
   else if( alphanumer5.hasMatch(textEditingController.text)){
     final iss = textEditingController.text.
     split(RegExp(r':'),);
     log(iss.toString());
     _hour = int.parse(iss[0].replaceAll(RegExp(r'h'),
   ''));
     _min = int.parse(iss[1].replaceAll(RegExp(r'm'),
         ''));
     _sec =int.parse(iss.last.replaceAll(RegExp(r's'),
         ''));
     starterTimer();
   }
   // if(alphanumer.hasMatch(textEditingController.text) ||
   //     alphanumer2.hasMatch(textEditingController.text) ||
   //     alphanumer3.hasMatch(textEditingController.text)
   // ){
   //   _hour=21;_min=23;_sec=32;
   //   starterTimer();
   //   const snackBar = SnackBar(
   //     content: Text('Counter Stared'),
   //   );
   //
   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
   // }else{
   //   const snackBar = SnackBar(
   //     content: Text('Please enter Valid String'),
   //   );
   //
   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
   // }

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_hour h: $_min m: $_sec s"),

           TextFormField(
             controller: textEditingController,
           //  onChanged: parseTimeString,
           ),
            ElevatedButton(onPressed: parseTimeString, child: Text('Start Counter'))
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
