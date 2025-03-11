import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme.dart';
import '../../widgets/common_footer.dart';
import '../../widgets/network_listener.dart';
import '../../widgets/reports_widgets/check_dashboard_widget.dart';
import '../../widgets/reports_widgets/check_history_widget.dart';
import '../../widgets/reports_widgets/medicine_card_widget.dart';
import '../../widgets/reports_widgets/todays_report_widget.dart';
import '../home.dart';
import '../medicine_screens/add_medicine_view.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  int _selectedDay = 1; // Track the currently selected day

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TodaysReportWidget(),
            const SizedBox(height: 16),
            const CheckDashboardWidget(),
            const SizedBox(height: 16),
            const CheckHistoryWidget(),
            const SizedBox(height: 16),

            // **Week Calendar Widget**
            WeekCalendar(
              selectedDay: _selectedDay,
              onDaySelected: (day) {
                setState(() {
                  _selectedDay = day;
                });
              },
            ),

            const SizedBox(height: 16),

            medicines.isEmpty ? _buildEmptyState() : _buildMedicineList(),
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
        child: const Icon(Icons.add, color: AppTheme.backgroundColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: _buildBottomNavigationBar(),
      bottomNavigationBar: const CommonFooter(currentIndex: 1),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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

  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     elevation: 1,
  //     currentIndex: 1,
  //     selectedItemColor: const Color(0xFF6f8bef),
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //       BottomNavigationBarItem(icon: Icon(Icons.signal_cellular_alt), label: "Reports"),
  //     ],
  //     type: BottomNavigationBarType.fixed,
  //     onTap: (index) {
  //       if (index == 0) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => NetworkListener(child: const HomePage())),
  //         );
  //       }
  //     },
  //   );
  // }
}

class WeekCalendar extends StatelessWidget {
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const WeekCalendar({Key? key, required this.selectedDay, required this.onDaySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(100, (index) {
          final day = index + 1;
          return DayCircle(
            day: day.toString(),
            isSelected: day == selectedDay,
            onTap: () => onDaySelected(day),
          );
        }),
      ),
    );
  }
}

class DayCircle extends StatelessWidget {
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCircle({Key? key, required this.day, this.isSelected = false, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              getDayAbbreviation(int.parse(day)),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.blue : Colors.grey[200],
              ),
              child: Center(
                child: Text(
                  day,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDayAbbreviation(int day) {
    final daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return daysOfWeek[(day - 1) % 7];
  }
}
