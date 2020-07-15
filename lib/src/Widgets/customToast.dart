import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(BuildContext context, String msg,
    {Color bgColor, int duration = 2, Icon icon}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: bgColor ?? Colors.grey.shade900,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) icon,
        SizedBox(
          width: 12.0,
        ),
        Text(msg, style: TextStyle(color: Colors.white),),
      ],
    ),
  );
  FlutterToast(context)
    ..removeCustomToast()
    ..showToast(
        child: toast,
        toastDuration: Duration(seconds: duration),
        gravity: ToastGravity.BOTTOM);
}
