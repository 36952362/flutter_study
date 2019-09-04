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
        ///appBar中添加一个列表按钮并监听点击事件
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => _onFavoriteRoute(context),
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  ///点击appBar上的列表按钮，跳转到展示收藏喜欢名字页面
  void _onFavoriteRoute(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => _favoriteListRoute(context)));
  }

  ///展示一个随机生成的公司名字的列表
  Widget _buildContent() {
    return ListView.builder(itemBuilder: (context, index) {
      return _generateListRow(context, index);
    });
  }

  ///列表项直接用分割线分割，每次使用第三方插件生成10个名字，当到达列表底部后再产生10个新的名字
  Widget _generateListRow(BuildContext context, int index) {
    if (index.isOdd) {
      return Divider();
    }

    ///由于中间有分割线，实际list的位置是index的一半
    final pos = index ~/ 2;

    if (pos >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }

    return _buildRowWidget(_suggestions[pos]);
  }

  ///每个列表项后面添加一个收藏图标并监听点击事件
  ///使用不同的图标和颜色标示是否收藏
  Widget _buildRowWidget(WordPair pair) {
    final selected = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase),
      trailing: Icon(
        selected ? Icons.favorite : Icons.favorite_border,
        color: selected ? Colors.red : null,
      ),
      onTap: () => _onTap(pair, selected),
    );
  }

  ///乒乓键控制是否收藏
  void _onTap(WordPair wordPair, bool selected) {
    setState(() {
      if (selected) {
        _saved.remove(wordPair);
      } else {
        _saved.add(wordPair);
      }
    });
  }


  Widget _favoriteListRoute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StartupNameRoute.favoriteName),
      ),
      body: _favoriteList(),
    );
  }

  ///显示收藏的名字
  Widget _favoriteList() {
    return ListView.builder(
      itemCount: _saved.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_saved.elementAt(index).asPascalCase),
        );
      },
    );
  }
}
