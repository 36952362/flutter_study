#备注[返回首页](../readme.md)

##001-设置代理
由于某些不可抗力的原因，国内用户在访问国外的某些网站或搜索Flutter第三包时需要配置Flutter代理。在环境变量中配置如下:

	export PUB_HOSTED_URL=https://pub.flutter-io.cn
	export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
	
##002-获取第三方包时提示等待释放锁
当你的项目异常关闭，或者由于不可抗力的原因，在使用`flutter packages get` 命令更新第三方包时可能会出现`Waiting for another flutter command to release the startup lock`

其解决方案时删除flutter SDK目录下的lockfile文件即可。具体位置在

	<fluttersdk>/bin/cache/lockfile
	
##003-设置屏幕方向
	//横屏
	SystemChrome.setPreferredOrientations(
	        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
	//竖屏
	SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);