import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesSampleRoute extends StatelessWidget {
  static final String imagesSampleRoute = '图片展示';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imagesSampleRoute),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '网络加载静态图片',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Container(
          width: 80.0,
          height: 80.0,
          child: Image.network(
              "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg?raw=true"),
        ),
        Text(
          '网络加载动态图片',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Container(
          width: 80.0,
          height: 80.0,
          child: Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566666019560&di=8223f3670eec943f5b7a7a21d1eb199c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201407%2F25%2F20140725175411_wuH5L.gif"),
        ),
        Text(
          '使用占位符淡入图片',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Container(
          width: 80.0,
          height: 80.0,
          child: Stack(
            children: <Widget>[
              Center(child:CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg"),
              ),
            ],
          ),
        ),
        Text(
          '缓存占位符淡入图片',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Container(
          width: 80.0,
          height: 80.0,
          child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg",
          ),
        ),

      ],
    );
  }
}
