import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class StartupNameRoute extends StatefulWidget {
  static final String startupName = '创业公司起名';
  static final String favoriteName = '喜欢的名字';

  @override
  State<StatefulWidget> createState() => _StartupNameRouteState();
}

class _StartupNameRouteState extends State<StartupNameRoute> {

  var _suggestions = List<WordPair>();
  var _saved = Set<WordPair>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StartupNameRoute.startupName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
              onPressed:()=>_onFavoriteRoute(context),
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _generateList(BuildContext context, int index) {
    if (index.isOdd) {
      return Divider();
    }

    final pos = index ~/ 2;

    if (pos >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }

    return _buildRow(_suggestions[pos]);
  }

  Widget _buildRow(WordPair pair) {
    final selected = _saved.contains(pair);

    return ListTile(
        title: Text(pair.asPascalCase),
        trailing: Icon(
            selected? Icons.favorite: Icons.favorite_border,
            color: selected? Colors.red: null,
        ),
        onTap: ()=>_onTap(pair, selected),
    );
  }


  Widget _buildContent() {
    return ListView.builder(itemBuilder: (context, index) {
      return _generateList(context, index);
    });
  }

  void _onTap(WordPair wordPair, bool selected){
    setState(() {
      if(selected){
        _saved.remove(wordPair);
      }else{
        _saved.add(wordPair);
      }
    });
  }

  void _onFavoriteRoute(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context)=>_onListFavorite(context))
    );
  }

  List<Widget> _favoriteList(){

    final tiles = _saved.map((pair){
      return ListTile(
          title: Text(pair.asPascalCase),
      );
    });

    return ListTile.divideTiles(context: context, tiles: tiles).toList();

  }

  Widget _onListFavorite(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(StartupNameRoute.favoriteName),
        ),
        body: ListView(
          children: _favoriteList(),
        ),
      );
  }
}
