import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class SaveTool{
  /// 获取本地文件
  /// [fileName] 文件名.文件格式
  /// [saveAsString] 是否保存为字符串形式？（文本类型推荐）
  static Future<dynamic> getFile({
    required String fileName,
    required bool saveAsString,
  })async{
    try{
      final file = await _localFile(fileName);

      if(!await file.exists()){
        debugPrint('Save Tool: 文件 $fileName 不存在');
        return null;
      }

      if(saveAsString){
        final String content = await file.readAsString();
        debugPrint('Save Tool: 文件 $fileName 读取成功!');
        return content;
      }
      else{
        final Uint8List bytes = await file.readAsBytes();
        debugPrint('Save Tool: 文件 $fileName 读取成功!');
        return bytes;
      }
    }on FileSystemException catch(e){
      debugPrint('Save Tool: 读取文件 $fileName 失败，异常: $e');
      rethrow;
    }
  }

  /// 保存文件至本地
  /// [fileName] 文件名.文件格式
  /// [saveAsString] 是否保存为字符串形式？（文本类型推荐）
  /// [text] String 类型存储传入的数据值
  /// [bytes] Uint8List 类型传入的数据值
  static Future<File> saveFile({
    required String fileName,
    required  bool saveAsString,
      String? text,
      Uint8List? bytes
  })async{
    // 参数校验
    if(saveAsString && (text == null || text.isEmpty)) {
      throw ArgumentError('Save Tool: 保存字符串文件时，text 参数不能为空!');
    }
    if(!saveAsString && (bytes == null || bytes.isEmpty)) {
      throw ArgumentError('Save Tool: 保存字节流文件时，bytes 参数不能为空!');
    }

    try{
      // 建立链接
      final file = await _localFile(fileName);

      if(saveAsString){
        // 存为字符串类型
        debugPrint('Save Tool: 文件 $fileName 保存成功!');
        return file.writeAsString(text!);
      }else{
        // 存为字节流
        debugPrint('Save Tool: 文件 $fileName 保存成功!');
        return file.writeAsBytes(bytes!.toList());
      }
    }on FileSystemException catch(e){
      debugPrint('Save Tool: 保存文件 $fileName 失败，异常: $e');
      rethrow;
    }
  }

  /// 删除本地文件（慎用！！！）
  /// [fileName] 文件名.文件格式
  static Future<bool> deleteFile({ required String fileName})async{
    try{
      final file = await _localFile(fileName);

      if(!await file.exists()){
        debugPrint('Save Tool: 文件 $fileName 不存在');
        return false;
      }else{
        await file.delete();
        debugPrint('Save Tool: 文件 $fileName 删除成功!');
        return true;
      }
    }catch(e){
      debugPrint('Save Tool: 文件 $fileName 删除失败，异常: $e');
      rethrow;
    }
  }

  /// 获取本地的存储路径
  static Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// 创建指向存储的文件的 File 引用
  /// [fileName] 保存至本地的文件名称：text.txt
  static Future<File> _localFile(String fileName) async{
    final path = await _localPath;
    return File('$path/$fileName');
  }
}