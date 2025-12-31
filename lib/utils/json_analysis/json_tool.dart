import 'dart:convert';

import 'package:flutter/cupertino.dart';

class JSONTool{
  /// dynamic 数据转为 JSON-Map 类型，确保为 Map 格式
  /// [jsonData] dynamic 类型数据
  static Map<String,dynamic> dynamicToJsonMap(dynamic jsonData){
    try{
      // 校验
      if(jsonData == null) {
        debugPrint('JSON Tool: 要转为 JSON-Map 的 dynamic 数据为空!');
        return {};
      }

      final jsonStr = jsonData as String;
      if(jsonStr.isEmpty){
        debugPrint('JSON Tool: JSON 字符串为空!');
        return {};
      }

      // String 转 JSON-Map
      final dynamic json = jsonDecode(jsonStr);
      if(json is Map<String,dynamic>){
        debugPrint('JSON Tool: JSON 字符串成功转为 JSON-Map!');
        return json;
      }else{
        debugPrint('JSON Tool: JSON 字符串不能转为 JSON-Map，请检查 JSON 数据存储类型是 Map/List !');
        return {};
      }
    }catch(e){
      debugPrint('JSON Tool: 解析 dynamic 为 JSON-Map 失败，异常: $e');
      rethrow;
    }
  }
}