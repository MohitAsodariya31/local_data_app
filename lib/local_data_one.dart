import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends StatefulWidget {
  const LocalData({Key? key}) : super(key: key);

  @override
  State<LocalData> createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  SharedPreferences? prefs;
  String? data;
  int? dataTwo;

  @override
  void initState() {
    // TODO: implement initState
    setInstance();
    super.initState();
  }

  setInstance() async {
    prefs = await SharedPreferences.getInstance();
    getData();
  }

  setData() async {
    await prefs!.setString('counter', "1234567890-");
    await prefs!.setInt("counter_two", 1234);
  }

  getData() async {
    if (prefs!.containsKey('counter')) {
      debugPrint("True");
      dataTwo = prefs!.getInt('counter_two');
      data = prefs!.getString('counter');
    } else {
      debugPrint("False");
      data = "00";
      dataTwo = 000;
    }
    setState(() {});
  }

  removeData() {
    prefs!.remove('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Data")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Data: $data",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Data Two: $dataTwo",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              setData();
            },
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            onPressed: () {
              getData();
            },
            child: const Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            onPressed: () {
              removeData();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
