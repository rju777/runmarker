import 'package:flutter/cupertino.dart';
import 'package:markrun/ui/core/ui/protocol/privacy_policy.dart';
import 'package:markrun/ui/core/ui/protocol/user_agreement.dart';
import 'package:markrun/ui/core/ui/toggle.dart';
import 'package:flutter/material.dart';

class LaunchProtocol extends StatefulWidget{
  final VoidCallback event;
  final String protocolStr = 'I have read and accepted the User Agreement and Privacy Policy';

  LaunchProtocol({
    required this.event,
    super.key
});

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
          Toggle(
            event: widget.event,
          ),
          const SizedBox(width: 6,),
          Expanded(
              child: SizedBox(
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'I have read and accepted the ',
                            style: TextStyle(
                                color: Colors.black,
                              fontSize: 11
                            )
                        ),
                        WidgetSpan(
                            child: UserAgreement()
                        ),
                        const TextSpan(
                            text: ' and ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11
                            )
                        ),
                        WidgetSpan(
                            child: PrivacyPolicy()
                        )
                      ]
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

