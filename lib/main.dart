import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Sliver'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          /*
          SliverToBoxAdapter(
            child: ListTile(
              title: Text('Header'),
            ),
          ),
          */
          BodyContent(),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text('Footer'),
            ),
          ),
        ],
      ),
    );
  }
}

class BodyContent extends StatefulWidget {
  @override
  BodyContentState createState() => BodyContentState();
}

class BodyContentState extends State<BodyContent> {
  bool useList = false;

  @override
  Widget build(BuildContext context) {
    if (useList) {
      return SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            ListTile(
              title: Text('Using SliverList'),
              subtitle: Text('Tap to use SliverToBoxAdapter'),
              onTap: () => setState(() => useList = false),
            ),
          ],
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: ListTile(
          title: Text('Using SliverToBoxAdapter'),
          subtitle: Text('Tap to use SliverList'),
          onTap: () => setState(() => useList = true),
        ),
      );
    }
  }
}
