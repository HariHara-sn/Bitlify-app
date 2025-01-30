// import 'package:flutter/material.dart';

// enum AnimationStyles { defaultStyle, custom, none }

// class CustomBottomSheet extends StatefulWidget {
//   const CustomBottomSheet({super.key});

//   @override
//   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// }

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   late AnimationStyles _animationStyle;

//   @override
//   void initState() {
//     super.initState();
//     // Call a method when the screen is navigated to
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       a(); // This will be called after the widget is built
//     });
//     _animationStyle = AnimationStyles.defaultStyle;
//   }

//   void a() {
//     showModalBottomSheet<void>(
//       context: context,
//       sheetAnimationStyle: AnimationStyle(
//         duration: const Duration(seconds: 3),
//         reverseDuration: const Duration(seconds: 1),
//       ),
//       builder: (BuildContext context) {
//         return SizedBox.expand(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Text('Modal bottom sheet'),
//                 ElevatedButton(
//                   child: const Text('Close'),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Text(''); // This is a placeholder
//   }
// }

