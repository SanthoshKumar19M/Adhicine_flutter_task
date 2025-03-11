// import 'dart:math';

// import 'package:flutter/material.dart';

// class CommonFooter extends StatelessWidget {
//   final VoidCallback? onHomePressed;
//   final VoidCallback? onReportPressed;
//   final VoidCallback? onAddMedicinePressed;

//   const CommonFooter({
//     Key? key,
//     this.onHomePressed,
//     this.onReportPressed,
//     this.onAddMedicinePressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: onAddMedicinePressed ?? () {},
//         shape: const CircleBorder(),
//         child: const Icon(Icons.add, size: 30),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // bottomNavigationBar: BottomAppBar(
//       //   shape: const CircularNotchedRectangle(),
//       //   notchMargin: 8.0,
//       //   child: Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//       //     children: [
//       //       Column(
//       //         mainAxisSize: MainAxisSize.min,
//       //         children: [
//       //           IconButton(
//       //             icon: const Icon(Icons.home),
//       //             onPressed: onHomePressed ?? () {},
//       //           ),
//       //           Text("data")
//       //         ],
//       //       ),
//       //       const SizedBox(width: 48), // Space for the FAB
//       //       Column(
//       //         mainAxisSize: MainAxisSize.min,
//       //         children: [
//       //           IconButton(
//       //             icon: const Icon(Icons.signal_cellular_alt),
//       //             onPressed: onReportPressed ?? () {},
//       //           ),
//       //           Text("data")
//       //         ],
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.red,
//         elevation: 1,
//         items: [
//           BottomNavigationBarItem(icon: const Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: const Icon(Icons.signal_cellular_alt), label: "Reports"),
//         ],
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }

import 'package:adhicine/views/reports_screens/report_view.dart';
import 'package:flutter/material.dart';
import '../views/home.dart';
import 'network_listener.dart';

class CommonFooter extends StatelessWidget {
  final int currentIndex;

  const CommonFooter({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF6f8bef),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.signal_cellular_alt), label: "Reports"),
      ],
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NetworkListener(child: const HomePage())),
          );
        }
        if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NetworkListener(child: const ReportView())),
          );
        }
      },
    );
  }
}
