import 'package:flutter/material.dart';
import 'package:stockscan/data/fetchData.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stockscan/screens/DetailScreen.dart';

import '../../globals/constants.dart';
import '../model/dataModel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Scan Parser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHome(),
    );
  }
}



class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // variable to call a function from another class
  final FetchData _fetchData = FetchData();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Stock Scan Parser',textScaleFactor: 1.3,),
      ),
      // FutureBuilder used to call data and handle no data state
      body: FutureBuilder(
        future: _fetchData.loadData(),
        builder: (context,snapshot) {
        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: signals!.length,
              itemBuilder: (context, index) {
                return _buildSignalCard(signals![index]);
              },
              separatorBuilder: (ctx,index){
                return Divider(color: Colors.white,);
              },
            ),
          );
        }
        else{
          // show loader for no data state
          return const Center(child: CircularProgressIndicator());
        }
        }
      ),
    );
  }
// common widget for UI code re usability.
  Widget _buildSignalCard(dynamic signal) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    data: signal,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(signal['name'], style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white)),
              const SizedBox(height: 8.0),
              Text(signal['tag'], style: Theme.of(context).textTheme.subtitle2?.copyWith(color: turnGreen(signal['color']))),
              const SizedBox(height: 8.0),

            ],
          ),
        ),
      ),
    );
  }
}
