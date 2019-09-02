import 'package:flutter/material.dart';

class LayoutSample1Route extends StatelessWidget {
  static final String layoutSampleRoute = '构建布局1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(layoutSampleRoute),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: <Widget>[
        _headWidget(context),
        _addressWidget(context),
        _contactWidget(context),
        _descriptionWidget(context),
      ],
    );
  }

  Widget _headWidget(BuildContext context) {
    return Image.asset(
      "images/lake.jpg",
      height: 220.0,
      fit: BoxFit.cover,
    );
  }

  Widget _addressWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
  }

  Column _buildContactColumn(BuildContext context, IconData icon, String label){
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );

  }

  Widget _contactWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildContactColumn(context, Icons.call, 'CALL'),
          _buildContactColumn(context, Icons.near_me, 'ROUTE'),
          _buildContactColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _descriptionWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _FavoriteState();

}

class _FavoriteState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: Icon(_isFavorited?Icons.star: Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }


  void _toggleFavorite() {
    setState(() {
      if(_isFavorited){
        _favoriteCount--;
      }else{
        _favoriteCount++;
      }
      _isFavorited = !_isFavorited;
    });
  }
}
