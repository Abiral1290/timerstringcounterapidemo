import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);




  @override
  State<TimerPage> createState() => _TimerState();
}


class _TimerState extends State<TimerPage> {


  final TextEditingController textEditingController = TextEditingController();

  Duration myDuration = const Duration(days: 5);
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


  }


  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
  final snackBarStarted =const SnackBar(
    content: Text('Counter Started'),
  );
  final snackBarFailed =const SnackBar(
    content: Text('Enter a Correct time string'),
  );

  void parseTimeString( ){


    if(alphanumer.hasMatch(textEditingController.text)){
      String ints=textEditingController.text.
      replaceAll(RegExp(r'h:$'), '');
      log(ints);
      _hour = int.parse(ints);
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);

      starterTimer();
    }else if( alphanumer1.hasMatch(textEditingController.text)){
      _min = int.parse(textEditingController.text.
      replaceAll(RegExp(r'm:$'), ''));
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);
      starterTimer();
    }else if( alphanumer2.hasMatch(textEditingController.text)){
      _sec = int.parse(textEditingController.text.
      replaceAll(RegExp(r's$'), ''));
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);
      starterTimer();
    }
    else if( alphanumer3.hasMatch(textEditingController.text)){
      final iss = textEditingController.text.
      split(RegExp(r'h:'),);
      log(iss.toString());
      _hour = int.parse(iss[0]);
      _min = int.parse(iss.last.replaceAll(RegExp(r'm:'),
          ''));
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);
      starterTimer();
    }else if( alphanumer4.hasMatch(textEditingController.text)){
      final iss = textEditingController.text.
      split(RegExp(r'm:'),);
      log(iss.toString());
      _hour = int.parse(iss[0]);
      _min = int.parse(iss.last.replaceAll(RegExp(r's'),
          ''));
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);
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
      ScaffoldMessenger.of(context).showSnackBar(snackBarStarted);
      starterTimer();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailed);

    }


  }

  void stopTimer() {
    setState(() {
      _hour = 0;
      _min = 0;
      _sec = 0;
    });
    _timer?.cancel();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$_hour h: $_min m: $_sec s"),

          TextFormField(
            controller: textEditingController,
            //  onChanged: parseTimeString,
          ),
         const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            stopTimer();
            parseTimeString();
          }, child:const Text('Start Timer')),
          const SizedBox(height: 10,),
           ElevatedButton(onPressed: stopTimer, child:const Text('Stop Timer'))
        ],
      ),
    );
  }
}
