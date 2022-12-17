import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label!),
            onPressed: onPressed!,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : RaisedButton(
            child: Text(label!),
            //  textColor: Theme.of(context).textTheme.button!.color,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: onPressed!,
          );
  }
}
