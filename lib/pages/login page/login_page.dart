// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'signup.dart';
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       debugShowCheckedModeBanner: false,
//       routes: <String, WidgetBuilder>{
//         '/signup': (BuildContext context) => new SignupPage()
//       },
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   int _success = 1;
//   String _userEmail = "";
//
//   void _singIn() async {
//     final User user = (await _auth.signInWithEmailAndPassword(
//             email: _emailController.text, password: _passwordController.text))
//         .user;
//
//     if (user != null) {
//       setState(() {
//         _success = 2;
//         _userEmail = user.email;
//       });
//     } else {
//       setState(() {
//         _success = 3;
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
//                 child: const Text("Welcome to Foodies",
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
//               Container(
//                 alignment: const Alignment(1, 0),
//                 padding: EdgeInsets.only(top: 15, left: 20),
//                 child: const InkWell(
//                   child: Text(
//                     'Forgot Password',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Montserrat',
//                         decoration: TextDecoration.underline),
//                   ),
//                 ),
//               ),
//               Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     _success == 1
//                         ? ''
//                         : (_success == 2
//                             ? 'Successfully signed in $_userEmail'
//                             : 'Sign in failed'),
//                     style: const TextStyle(color: Colors.red),
//                   )),
//               const SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 height: 40,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(20),
//                   shadowColor: Colors.greenAccent,
//                   color: Colors.black,
//                   elevation: 7,
//                   child: GestureDetector(
//                       onTap: () async {
//                         _singIn();
//                       },
//                       child: const Center(
//                           child: Text('LOGIN',
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
//                       Navigator.of(context).pushNamed('/signup');
//                     },
//                     child: const Text('Register',
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
