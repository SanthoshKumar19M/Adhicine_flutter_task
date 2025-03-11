import 'package:adhicine/views/medicine_screens/add_medicine_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intl/intl.dart';
import '../core/theme.dart';
import '../widgets/common_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/common_footer.dart';
import '../widgets/reports_widgets/medicine_card_widget.dart';
import 'reports_screens/report_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _selectedDate;
  final int _selectedIndex = 0;
  DateTime startDate = DateTime.now();
  List<Map<String, dynamic>> medicines = [
    {
      "medicineName": "Calpol 500mg Tablet",
      "timing": "Before Breakfast",
      "day": "Day 01",
      "status": "Taken",
      "icon": Icons.notifications_none,
      "color": Colors.green,
      "daytiming": "Morning 08:00 am",
    },
    {
      "medicineName": "Calpol 500mg Tablet",
      "timing": "Before Breakfast",
      "day": "Day 27",
      "status": "Missed",
      "icon": Icons.notifications_none,
      "color": Colors.red,
      "daytiming": "Morning 08:00 am",
    },
    {
      "medicineName": "Calpol 500mg Tablet",
      "timing": "After Food",
      "day": "Day 01",
      "status": "Snoozed",
      "icon": Icons.notifications_none,
      "color": Colors.orange,
      "daytiming": "Afternoon 02:00 pm",
    },
    {
      "medicineName": "Calpol 500mg Tablet",
      "timing": "Before sleep",
      "day": "Day 03",
      "status": "Snoozed",
      "icon": Icons.notifications_none,
      "color": Colors.orange,
      "daytiming": "Night 02:00 pm",
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Harry', medicinesLeft: 5, profileImageUrl: ""),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60, // Adjust height as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(_selectedDate.subtract(Duration(days: 1))),
                    // style: TextStyle(color: Colors.white), // White text
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        _selectedDate = _selectedDate!.subtract(Duration(days: 1));
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[800], // Dark background
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    child: Text(
                      DateFormat('EEEE, MMM d').format(_selectedDate!),
                      style: TextStyle(color: Colors.white), // White text
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _selectedDate = _selectedDate!.add(Duration(days: 1));
                      });
                    },
                  ),
                  Text(
                    DateFormat('E').format(_selectedDate.add(Duration(days: 1))),
                    // style: TextStyle(color: Colors.white), // White text
                  ),
                ],
              ),
            ),
            // EasyDateTimeLine(
            //   initialDate: _selectedDate,
            //   onDateChange: (selectedDate) {
            //     setState(() {
            //       _selectedDate = selectedDate;
            //     });
            //   },
            //   dayProps: EasyDayProps(
            //     height: 60, // Adjust height to fit the row layout
            //     width: 90, // Adjust width to fit the text properly
            //     activeDayStyle: DayStyle(
            //       borderRadius: 10,
            //       decoration: BoxDecoration(
            //         color: Colors.teal, // Selected date background color
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       dayStrStyle: const TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //       dayNumStyle: const TextStyle(
            //         fontSize: 18, // Slightly larger font for date
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            //     inactiveDayStyle: DayStyle(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Colors.white, // Background color for inactive days
            //         border: Border.all(color: Colors.grey.shade300),
            //       ),
            //       dayStrStyle: const TextStyle(
            //         fontSize: 14,
            //         color: Colors.grey,
            //       ),
            //       dayNumStyle: const TextStyle(
            //         fontSize: 18,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            //   headerProps: const EasyHeaderProps(
            //     showMonthPicker: false, // Hide the month selection switch
            //     showHeader: false, // Hide the upper day text
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: medicines.isEmpty ? _buildEmptyState() : _buildMedicineList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.secondaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicineView()),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppTheme.backgroundColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: _buildBottomNavigationBar(),
      bottomNavigationBar: const CommonFooter(currentIndex: 0),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/empty_box_svg.svg',
          height: 150,
        ),
        const SizedBox(height: 10),
        const Text(
          'Nothing Is Here, Add a Medicine',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMedicineList() {
    Map<String, List<Map<String, dynamic>>> groupedMedicines = {};
    for (var medicine in medicines) {
      groupedMedicines.putIfAbsent(medicine["daytiming"], () => []).add(medicine);
    }

    return ListView(
      padding: EdgeInsets.zero,
      children: groupedMedicines.entries.expand((entry) {
        return [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              entry.key,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...entry.value.map((medicine) => MedicineCardWidget(
                medicineName: medicine["medicineName"],
                timing: medicine["timing"],
                day: medicine["day"],
                status: medicine["status"],
                icon: medicine["icon"],
                color: medicine["color"],
              )),
          const SizedBox(height: 16),
        ];
      }).toList(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF6f8bef),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.signal_cellular_alt), label: "Reports"),
      ],
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ReportView()),
          );
        }
      },
    );
  }
}
