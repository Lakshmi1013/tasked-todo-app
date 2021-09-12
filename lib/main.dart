import 'package:flutter/material.dart';
import '/widgets/tasks_tile.dart';
import './widgets/sub_heading.dart';
import 'provider/taskedapp_provider.dart';
import 'screens/item_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StateProvider(),
      child: MaterialApp(
        title: 'Tasked App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.deepOrangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int variabkeofthela = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 120,
        title: SubHeading(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: goToNewItemView,
      ),
      body: TasksTile(),
    );
  }

// handling navigation to task creation screen
  void goToNewItemView() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ItemView();
    }));
  }
}
