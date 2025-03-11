// import 'dart:async';
// import 'package:adhicine/core/theme.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class NetworkIssueWidget extends StatefulWidget {
//   @override
//   _NetworkIssueWidgetState createState() => _NetworkIssueWidgetState();
// }

// class _NetworkIssueWidgetState extends State<NetworkIssueWidget> {
//   late StreamSubscription<List<ConnectivityResult>> _subscription;

//   @override
//   void initState() {
//     super.initState();
//     _checkNetworkStatus();
//   }

//   void _checkNetworkStatus() {
//     _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
//       if (results.isEmpty || results.contains(ConnectivityResult.none)) {
//         _showNoConnectionDialog();
//       }
//     });
//   }

//   void _showNoConnectionDialog() {
//     showDialog(
//       // barrierColor: Colors.amber,
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16.0),
//           ),
//           contentPadding: EdgeInsets.zero,
//           content: Container(
//             width: MediaQuery.of(context).size.width * 0.8,
//             // padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Your Device is not",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "connected",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   'assets/images/robot_error.png', // Replace with actual image path
//                   height: 120,
//                 ),
//                 const SizedBox(height: 16),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Connect your device with",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle Bluetooth connection
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppTheme.primaryColor,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(16),
//                             ),
//                           ),
//                         ),
//                         child: const Icon(Icons.bluetooth, color: Colors.white),
//                       ),
//                     ),
//                     // Divider(),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle Wi-Fi connection
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppTheme.primaryColor,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(16),
//                             ),
//                           ),
//                         ),
//                         child: const Icon(Icons.wifi, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.shrink(); // This widget doesn't need to display anything
//   }
// }

// //  NEED TO WRK ON NETWORK ISSUE PNG
