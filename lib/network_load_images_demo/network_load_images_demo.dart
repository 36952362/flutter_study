import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesSampleRoute extends StatelessWidget {
  static final String networkLoadImagesDemo = '网络下载图片展示';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(networkLoadImagesDemo),
      ),
      body: _buildBody(context),
    );
  }

  Widget _createTextChild(String title){
    return Text(
      title,
      style: TextStyle(fontSize: 15.0),
    );
  }

  Widget _createImageChild(String widgetType, String imageUrl){
    Widget _imageChild;
    switch(widgetType){
      case "Image":
        _imageChild = Image.network(imageUrl);
        break;
      case 'FadeInImage':
        _imageChild = Stack(
          children: <Widget>[
            Center(child:CircularProgressIndicator()),
            Center(
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl),
            ),
          ],
        );
        break;
      case 'CachedNetworkImage':
        _imageChild = CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: imageUrl,
        );
    }

    return Container(
      width: 80.0,
      height: 80.0,
      child: _imageChild,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _createTextChild('网络加载静态图片'),
        _createImageChild('Image', "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg?raw=true"),
        _createTextChild('网络加载动态图片'),
        _createImageChild('Image', "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566666019560&di=8223f3670eec943f5b7a7a21d1eb199c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201407%2F25%2F20140725175411_wuH5L.gif"),
        _createTextChild('使用占位符淡入图片'),
        _createImageChild('FadeInImage', "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg"),
        _createTextChild('缓存占位符淡入图片'),
        _createImageChild('CachedNetworkImage', "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg"),
      ],
    );
  }
}
