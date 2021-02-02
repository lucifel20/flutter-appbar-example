import 'package:flutter/material.dart';

void main() => runApp(AppbarExample());

class AppbarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter Appbar Example';
    const double APPBAR_HEIGHT = kToolbarHeight * 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(appTitle: APP_TITLE, appbarHeight: APPBAR_HEIGHT),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key, this.appTitle = '', this.appbarHeight = kToolbarHeight})
      : super(key: key);

  final String appTitle;
  final double appbarHeight;

  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  String _text = '';

  void pressButton() {
    setState(() => _text = 'Action Button is Pressed');
  }

  void pressTab(int tabIndex) {
    setState(() => _text = 'Tab ${tabIndex + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(widget.appbarHeight),
        child: DefaultTabController(
          length: 3,
          child: AppBar(
            leading: FlutterLogo(),
            title: Text(widget.appTitle),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_comment),
                onPressed: pressButton,
              ), // IconButton()
            ], // List<Widget>[]
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ], // List<Widget>[]
              onTap: pressTab,
            ), // TabBar()
          ), // AppBar()
        ), // DefaultTabController()
      ), // PreferredSize()
      body: Text(_text),
    ); // Scaffold()
  }
}
