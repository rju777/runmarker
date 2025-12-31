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
  static final UserInfo _instance = UserInfo._read();
  // 工厂构造函数
  factory UserInfo(){
    return _instance;
  }
  // 私有化构造函数
  UserInfo._read(){
    read();
  }

  /// 读取-解析本地数据
  Future<void> read()async{
    try{
      // 读取本地文件：获取用户数据
      final data = await SaveTool.getFile(fileName: fileName, saveAsString: true);

      if(data == null){
        debugPrint('User Info: 用户首次启动');
        return;
      }

      // 赋值
      final jsonMap = await JSONTool.dynamicToJsonMap(data);

      firstLaunch = jsonMap['firstLaunch'];
      sex = jsonMap['sex'];
      birth = jsonMap['birth'];
      height = jsonMap['height'];
      weight = jsonMap['weight'];
      debugPrint('User Info: 读取本地文件成功，已初始化用户配置');
      return ;
    }catch(e){
      debugPrint('User Info: 读取本地文件错误，异常: $e');
      rethrow;
    }
  }

  /// 注册
  Future<void> register()async{
    try{
      if(!firstLaunch) return;
      firstLaunch = false;

      // 数据转 JSON
      final content = _toJSON();
      debugPrint('User Info: 数据转为 JSON 格式: $content');
      // 写入本地文件
      final file = await SaveTool.saveFile(fileName: fileName,saveAsString: true,text: content);
      debugPrint('User Info: 注册成功! $file');
    }catch(e){
      debugPrint('User Info: 注册错误，异常: $e');
    }
  }

  /// 转为 JSON 格式的 String
  String _toJSON(){
    return '[{"firstLaunch":$firstLaunch,"sex":$sex,"birth":$birth,"height":$height,"weight":$weight}]';
  }
}