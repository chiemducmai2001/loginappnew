import 'package:flutter/material.dart';

Container SignInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child:   Text(
        isLogin ? "Login In" : "Sign Up",
        style: TextStyle(
            color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return Colors.white;
      })),
    ),
  );
}

// Container SignOutButton(BuildContext context, Function ontap) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 50,
//     margin: const EdgeInsets.all(20),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//     child: ElevatedButton(
//       onPressed: () {
//         ontap();
//       },
//       child: Text(
//         'Sign Out ',
//         style: TextStyle(
//             color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith((states) {
//         if (states.contains(MaterialState.pressed)) {
//           return Colors.black26;
//         }
//         return Colors.white;
//       })),
//     ),
//   );
// }
