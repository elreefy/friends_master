import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

Widget dividerSeparator() => Divider(
  thickness: 0.3,
  color: MyColors.dark,
);

Widget defaultFormField({
  required TextEditingController controller,
  FocusNode? focusNode,
  required TextInputType keyboardType,
  String? Function(String?)? validate,
  VoidCallback? onTap,
  ValueChanged<String>? onSubmit,
  VoidCallback? suffixPressed,
  Function(String?)? onChanged,
  required IconData prefixIcon,
  double borderRadius = 20,
   String? hint,
  String? label,
  IconData? suffixIcon,
  bool isPassword = false,
  // required bool isRtl,
}) =>
    TextFormField(

      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blue,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcon,
            color: MyColors.light.withOpacity(0.8),
          ),
        )
            : null,
      ),
      validator: validate,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      style: TextStyle(color:Colors.black,
          letterSpacing: 1),
    );
// //</editor-fold>
//
// // Widget buildProgressIndicator() => Center(
// //         child: CircularProgressIndicator(
// //       color: MyColors.primaryColor,
// //     ));
// Widget buildSearchLoadingIndicator() => Center(
//   child: Container(
//     width: 150,
//     child: LoadingIndicator(
//         indicatorType: Indicator.ballSpinFadeLoader,
//         colors: [
//           MyColors.green,
//           MyColors.card,
//           MyColors.red,
//           Colors.lightBlue,
//           Colors.purpleAccent,
//           Color(0xffF05454),
//           Color(0xffFEC260),
//           Color(0xffFFC100),
//         ],
//         strokeWidth: 2,
//         pathBackgroundColor: Colors.black),
//   ),
// );
// Widget buildProgressIndicator() => Center(
//   child: Container(
//     width: 100,
//     height: 40,
//     child: LoadingIndicator(
//         indicatorType: Indicator.ballBeat,
//         colors: [
//           MyColors.green,
//           MyColors.card,
//           MyColors.red,
//           Colors.lightBlue,
//           Colors.purpleAccent,
//           Color(0xffF05454),
//           Color(0xffFEC260),
//           Color(0xffFFC100),
//         ],
//         strokeWidth: 2,
//         pathBackgroundColor: Colors.black),
//   ),
// );
//
// // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
//
// void navigateTo(context, widget) => Navigator.push(
//     context,
//     PageRouteBuilder(transitionsBuilder: (BuildContext context,
//         Animation<double> animation,
//         Animation<double> secAnimation,
//         Widget child) {
//       var begin = Offset(1, 0);
//       var end = Offset(0, 0);
//       var tween = Tween(begin: begin, end: end);
//       var offsetAnimation = animation.drive(tween);
//       return SlideTransition(
//         position: offsetAnimation,
//         child: widget,
//       );
//     }, pageBuilder: (BuildContext context, Animation<double> animation,
//         Animation<double> secAnimation) {
//       return widget;
//     }));
//
// void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(
//     builder: (context) => widget,
//   ),
//       (Route<dynamic> route) => false,
// );
enum ToastStates { SUCCESS, ERROR, WARNING }

Color toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.yellow;
  }
}
//show toast using flutter toast
void showToast({
  required String msg,
  required ToastStates state,
  double fontSize = 16,
  int seconds = 5,
}) {
  BotToast.showText(
      text: msg,
      duration: Duration(seconds: seconds),
      contentColor: toastColor(state),
      clickClose: true,
      align: Alignment(0, -0.9));
}
// Widget myDivider() => Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     );
//
// Widget primaryButton({
//   required String text,
//   required VoidCallback onPressed,
//   double height = 60,
//   double width = double.infinity,
//   Color? background,
//   Color? textColor,
//   double radius = 30,
//   bool isUpperCase = true,
//   double fontSize = 18,
//   colors,
// }) =>
//     Container(
//       width: width,
//       height: height,
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       decoration: BoxDecoration(
//         color: MyColors.primary,
//         borderRadius: BorderRadius.circular(radius),
//         gradient: LinearGradientPainter(
//           colorSpace: ColorSpace.oklab,
//           colors: colors ??
//               [
//                 Color(0xffF05454),
//                 Color(0xffFEC260),
//                 Color(0xffFFC100),
//               ],
//         ),
//       ),
//       child: MaterialButton(
//         onPressed: onPressed,
//         child: Text(
//           isUpperCase ? text.toUpperCase() : text,
//           style: TextStyle(
//             color: textColor ?? MyColors.secondary,
//             fontWeight: FontWeight.bold,
//             fontFamily: "Cairo",
//             fontSize: fontSize,
//           ),
//         ),
//       ),
//     );

Widget divider() => Divider(
  color: Colors.grey[300],
  height: 20,
  thickness: 0.5,
  indent: 0,
  endIndent: 0,
);
Widget buildIconWithNumber({
  required bool condition,
  number,
  icon,
  iconColor,
  double size = 30,
  double radius = 12,
  double fontSize = 13,
  VoidCallback? onPressed,
  alignment = const Alignment(1.6, -0.8),
}) =>
    Column(
      children: [
        Stack(
          alignment: alignment,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: iconColor,
                size: size,
              ),
            ),
            if (condition)
              CircleAvatar(
                radius: radius,
                backgroundColor: MyColors.secondary,
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );

Text iconText(text) => Text(
  text,
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  ),
);

Widget backButton(context) => Row(children: [
  IconButton(
    icon: Icon(
      Icons.arrow_back,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  Text(
    "Back",
    style: TextStyle(
      color: MyColors.secondary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
]);