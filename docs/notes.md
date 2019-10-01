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
	
##004-获取尺寸

	//屏幕宽高
	var screenSize = MediaQuery.of(context).size
	//状态栏高度
	var statusHeight = MediaQuery.of(context).padding.top;
	
##005-判断设备类型

	import 'dart:io';
	
	Platform.isIOS
	Platform.isAndroid
	Platform.isMacOS
	Platform.isWindows
	Platform.isLinux
	Platform.isFuchsia
##006-时间相关

	var today = DateTime.now();
	print('当前时间是：$today');
	
	var date1 = today.millisecondsSinceEpoch;
	print('当前时间戳：$date1');
	
	var date2 = DateTime.fromMillisecondsSinceEpoch(date1);
	print('时间戳转日期：$date2');
	
	// 拼接成date
	var dentistAppointment = new DateTime(2019, 6, 20, 17, 30,20);
	print(dentistAppointment);
	
	// 字符串转date
	DateTime date3 = DateTime.parse("2019-06-20 15:32:41");
	print(date3);
	// DateTime转formatString 
	// formatDate(DateTime ,[yyyy,'-',mm,'-',dd]);
	
	// 时间比较
	print(today.isBefore(date3));// 在之前
	print(today.isAfter(date3)); // 在之后
	print(date3.isAtSameMomentAs(date3));// 相同
	
	print(date3.compareTo(today));// 大于返回1；等于返回0；小于返回-1。
	// print(DateTime.now().toString());
	// print(DateTime.now().toIso8601String());
	
	// 时间增加
	var fiftyDaysFromNow = today.add(new Duration(days: 5));
	print('today加5天：$fiftyDaysFromNow');
	
	// 时间减少
	DateTime fiftyDaysAgo = today.subtract(new Duration(days: 5));
	print('today减5天：$fiftyDaysAgo');
	
	// 时间差 两个时间相差 小时数
	print('比较两个时间 差 小时数：${fiftyDaysFromNow.difference(fiftyDaysAgo)}');
	
	print('本地时区简码：${today.timeZoneName}');
	
	print('返回UTC与本地时差 小时数：${today.timeZoneOffset}');
	
	print('获取年月日：${today.year}');//month、day、hour、minute、second、millisecond、microsecond
	
	print('星期：${today.weekday}');// 返回星期几

##007-剪切板

	//赋值
	ClipboardData willSetData = ClipboardData(text:"剪切板的文字");
	Clipboard.setData(willSetData);
	
	//取值
	var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
	if(clipboardData != null){
		var data = clipboardData.text;
	}