import 'package:flutter/material.dart';
import 'package:valentina_soto_6_2021_2_p1/screens/notices.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _all = 'all';
  String _national = 'national';
  String _business = 'business';
  String _sports = 'sports';
  String _world = 'world';
  String _politics = 'politics';
  String _technology = 'technology';
  String _startup = 'startup';
  String _entertainment = 'entertainment';
  String _miscellaneous = 'miscellaneous';
  String _hatke = 'hatke';
  String _science = 'science';
  String _automobile = 'automobile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: _getBody(),
      drawer: _getDrawer(),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('logo.png'),
            fit: BoxFit.cover,
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Welcome to the news session',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _getDrawer() {
    return Drawer(
      child: Container(
        color: Colors.indigo[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Image(
              image: AssetImage('logo.png'),
            )),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('All'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Notice(category: _all)));
              },
            ),
            ListTile(
                leading: Icon(Icons.airport_shuttle),
                title: Text('Automobile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _automobile)));
                }),
                ListTile(
                leading: Icon(Icons.business_sharp),
                title: Text('Business'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _business)));
                }),
                ListTile(
                leading: Icon(Icons.attractions),
                title: Text('Entertainment'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _entertainment)));
                }),
                ListTile(
                leading: Icon(Icons.emoji_people),
                title: Text('Hatke'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _hatke)));
                }),
                ListTile(
                leading: Icon(Icons.miscellaneous_services_rounded),
                title: Text('Miscellaneous'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _miscellaneous)));
                }),
            ListTile(
                leading: Icon(Icons.flag),
                title: Text('National'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _national)));
                }),
                ListTile(
                leading: Icon(Icons.gavel),
                title: Text('Politics'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _politics)));
                }),
                ListTile(
                leading: Icon(Icons.biotech),
                title: Text('Science'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _science)));
                }),
                ListTile(
                leading: Icon(Icons.sports_score),
                title: Text('Sport'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _sports)));
                }),
                ListTile(
                leading: Icon(Icons.expand_less),
                title: Text('Startup'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _startup)));
                }),
                ListTile(
                leading: Icon(Icons.settings_input_antenna),
                title: Text('Tecnology'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _technology)));
                }),
                ListTile(
                leading: Icon(Icons.menu_sharp),
                title: Text('World'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notice(category: _world)));
                }),
          ],
        ),
      ),
    );
  }
}