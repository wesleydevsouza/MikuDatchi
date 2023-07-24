// // data_display.dart

// import 'package:flutter/material.dart';
// import 'DataController.dart';

// class DataDisplay extends StatelessWidget {
//   final DataController dataController;

//   DataDisplay({required this.dataController});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('Food: ${dataController.food}'),
//         Text('Drink: ${dataController.drink}'),
//         Text('Fun: ${dataController.fun}'),
//         ElevatedButton(
//           onPressed: () {
//             dataController.incrementFood();
//           },
//           child: Text('Increment Food'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             dataController.incrementDrink();
//           },
//           child: Text('Increment Drink'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             dataController.incrementFun();
//           },
//           child: Text('Increment Fun'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             dataController.decrementFood();
//           },
//           child: Text('Decrement Food'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             dataController.decrementDrink();
//           },
//           child: Text('Decrement Drink'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             dataController.decrementFun();
//           },
//           child: Text('Decrement Fun'),
//         ),
//       ],
//     );
//   }
// }
