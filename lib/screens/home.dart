import 'package:brewery_store/bloc/home_bloc.dart';
import 'package:brewery_store/models/brewery.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Brewery> breweryList = List();
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.insertList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        // child: _listViewBuilder(breweryList),
        child: StreamBuilder(
          stream: homeBloc.breweryList,
          builder:
              (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
            List<Brewery> data = snapshot.data;
            if (data != null) {
              breweryList = data;
            }
            return _listViewBuilder(breweryList);
          },
        ),
      ),
    );
  }

  Widget _listViewBuilder(List<Brewery> breweryList) {
    return breweryList.length > 0
        ? ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            separatorBuilder: (BuildContext context, int index) =>
                Container( color: Colors.white, child: const Divider( color: Colors.grey, ), ),
            //     Divider(
            //   height: 1,
            //   color: Colors.grey.shade800,
            // ),
            itemCount: breweryList.length,
            itemBuilder: (ctx, i) => Container(
                margin: EdgeInsets.all(8),
                child: _listItemBuilder(breweryList, i)),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  ListTile _listItemBuilder(List<Brewery> breweryList, int i) => ListTile(
        title: Text(breweryList[i].name),
        subtitle: Text(
            '${breweryList[i].street}, ${breweryList[i].city}, ${breweryList[i].state}, ${breweryList[i].postalCode}, ${breweryList[i].country}'),
        leading: CircleAvatar(
          child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                  child: Text(breweryList[i].breweryType.toLowerCase()))),
          backgroundColor: Colors.amber,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.phone,
                      size: 15, color: Colors.lightBlueAccent),
                  label: Text(
                    breweryList[i].phone,
                    style: TextStyle(color: Colors.lightBlueAccent),
                  )),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                breweryList[i].websiteUrl,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    decoration: TextDecoration.underline),
              ),
            ))
          ],
        ),
      );
}
