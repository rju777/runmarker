import 'package:flutter/cupertino.dart';
import 'package:markrun/ui/core/ui/toogle.dart';

class LaunchProtocol extends StatefulWidget{
  bool isAccept = false;
  final String protocolStr = 'I have read and accepted the User Agreement and Privacy Policy';

  @override
  State<StatefulWidget> createState() => LaunchProtocolState();
}

class LaunchProtocolState extends State<LaunchProtocol>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 27),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Toggle(),
          const SizedBox(width: 6,),
          Expanded(
              child: Text(
                 widget.protocolStr,
                 softWrap: true,
                 textAlign:TextAlign.left,
          ))
        ],
      ),
    );
  }
}

