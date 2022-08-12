// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   late bool _sucess;
//   late String _userEmail;
//
//   void _register() async {
//     final User user = (await _auth.createUserWithEmailAndPassword(
//             email: _emailController.text, password: _passwordController.text))
//         .user;
//
//     if (user != null) {
//       setState(() {
//         _sucess = true;
//         _userEmail = user.email;
//       });
//     } else {
//       setState(() {
//         _sucess = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
//                 child: const Text("SignUp",
//                     style:
//                         TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
//               )
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.only(top: 35, left: 20, right: 30),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                     labelText: 'EMAIL',
//                     labelStyle: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.green),
//                     )),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(
//                     labelText: 'PASSWORD',
//                     labelStyle: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.green),
//                     )),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 5.0,
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 height: 40,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(20),
//                   shadowColor: Colors.greenAccent,
//                   color: Colors.black,
//                   elevation: 7,
//                   child: GestureDetector(
//                       onTap: () async {
//                         _register();
//                       },
//                       child: const Center(
//                           child: Text('SIGNUP',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Montserrat')))),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Go Back',
//                         style: TextStyle(
//                             color: Colors.blueGrey,
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline)),
//                   )
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ));
//   }
// }
