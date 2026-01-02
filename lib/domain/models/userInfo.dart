import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:markrun/domain/models/sex.dart';
import 'package:markrun/utils/json_analysis/json_tool.dart';
import 'package:markrun/utils/save_files/save_files.dart';
import 'package:path_provider/path_provider.dart';

class UserInfo{
  /// 数据存储的名称
  static const String fileName = 'user_info.json';

  /// 是否首次登陆？
  bool firstLaunch = true;
  /// 身高/cm
  int height = 0;
  /// 体重/kg
  int weight = 0;
  /// 性别
  Sex sex = Sex.noSelect;
  /// 出生年月日：year-month-day
  String birth = '0000-00-00';

  // 单例模式
  static final UserInfo _instance = UserInfo._internal();
  static Future<UserInfo>? _initializedInstance;
  // 工厂构造函数
  factory UserInfo(){
    return _instance;
  }
  // 私有化构造函数
  UserInfo._internal();

  /// 初始化
  static Future<UserInfo> init()async{
    debugPrint('User Info: 开始执行init()');
    if(_initializedInstance == null){
      _initializedInstance = _instance.read();
    }
    return _initializedInstance!;
  }

  /// 读取-解析本地数据
  Future<UserInfo> read()async{
    try{
      // 读取本地文件：获取用户数据
      final data = await SaveTool.getFile(fileName: fileName, saveAsString: true);

      if(data == null){
        debugPrint('User Info: 用户首次启动');
        return this;
      }

      // 赋值
      final jsonMap = await JSONTool.dynamicToJsonMap(data);
      if(jsonMap is! Map<String,dynamic>){
        debugPrint('User Info: JSON 解析结果非 Map 类型');
        return this;
      }
      debugPrint('User Info: 用户信息: $jsonMap');

      firstLaunch = jsonMap['firstLaunch'] ?? true;
      switch(jsonMap['sex']){
        case 'noSelect':
          sex = Sex.noSelect;
          break;
        case 'woman':
          sex = Sex.woman;
          break;
        case 'man':
          sex = Sex.man;
          break;
      }
      birth = jsonMap['birth'] ?? '0000-00-00';
      height = jsonMap['height'] as int;
      weight = jsonMap['weight'] as int;
      debugPrint('User Info: 读取本地文件成功，已初始化用户配置');
      return this;
    }catch(e){
      debugPrint('User Info: 读取本地文件错误，异常: $e');
      return this;
    }
  }

  /// 注册
  Future<void> register()async{
    try{
      if(!firstLaunch) return;
      firstLaunch = false;

      // 数据转 JSON
      final jsonMap = _toJSON();
      final content = jsonEncode(jsonMap);
      debugPrint('User Info: 数据转为 JSON 格式: $content');
      // 写入本地文件
      final file = await SaveTool.saveFile(fileName: fileName,saveAsString: true,text: content);
      debugPrint('User Info: 注册成功! $file');
    }catch(e){
      debugPrint('User Info: 注册错误，异常: $e');
    }
  }

  /// 删除
  Future<void> delete()async{
    try{
      await SaveTool.deleteFile(fileName: fileName);
      debugPrint('User Info: 删除成功!');
    }catch(e){
      debugPrint('User Info: 删除错误，异常: $e');
    }
  }

  /// 转为 JSON 格式的 String
  Map<String,dynamic> _toJSON(){
    return {
      "firstLaunch":firstLaunch,
      "sex":sex.toString().split('.').last,
      "birth":birth,
      "height":height,
      "weight":weight
    };
  }
}