import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataTwoScreen extends StatefulWidget {
  const LocalDataTwoScreen({Key? key}) : super(key: key);

  @override
  State<LocalDataTwoScreen> createState() => _LocalDataTwoScreenState();
}

class _LocalDataTwoScreenState extends State<LocalDataTwoScreen> {
  SharedPreferences? prefs;
  String? stringData;
  int? intData;
  bool? boolData;
  double? doubleData;
  List? listData;

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
    await prefs!.setString('counter', "1234567890");
    await prefs!.setInt("counter_two", 1234);
    await prefs!.setBool("counter_three", true);
    await prefs!.setDouble("counter_four", 2.5);
    await prefs!.setStringList("counter_five", <String>['Earth', 'Moon', 'Sun']);
  }

  getData() async {
    stringData = prefs!.getString('counter');
    intData = prefs!.getInt('counter_two');
    boolData = prefs!.getBool('counter_three');
    doubleData = prefs!.getDouble('counter_four');
    listData = prefs!.getStringList('counter_five');

    setState(() {});
  }

  removeData() {
    prefs!.remove('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Data Two"),
      ),
      body: Center(
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Data: $stringData",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Data Two: $stringData",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Data Three: $boolData",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Data Four: $doubleData",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Data Five: $listData",
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
