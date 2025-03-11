import '/core/theme.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/medicine_widgets/dose_item.dart';
import 'package:intl/intl.dart';

class AddMedicineView extends StatefulWidget {
  const AddMedicineView({super.key});

  @override
  State<AddMedicineView> createState() => _AddMedicineViewState();
}

class _AddMedicineViewState extends State<AddMedicineView> {
  int selectedCompartment = 1;
  double totalCount = 01;
  String selectedFrequency = "Everyday";
  String selectedTimesPerDay = "Three Time";

  String selectedMedicineType = "Tablet";
  DateTime? startDate;
  DateTime? endDate;
  String selectedFoodTiming = "Before Food";

  List<int> compartments = [1, 2, 3, 4, 5, 6, 7, 8];
  List<Color> colors = [
    Color(0xFFf9ceee),
    Color(0xFFc1b6ff),
    Color(0xFFff9696),
    Color(0xFFcefbbe),
    Color(0xFFf9c290),
    Color(0xFFbae6ff),
    Color(0xFFfffab2),
  ];
  List<String> medicineTypes = ["Tablet", "Capsule", "Cream", "Liquid"];
  List<String> timesPerDay = ["One Time", "Two Times", "Three Time", "Four Time"];
  List<String> frequencies = ["Everyday", "Alternate Days", "Weekly"];
  List<String> doses = ["Dose 1", "Dose 2", "Dose 3"];
  Color selectedColour = Color(0xFFf9ceee);
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  TextStyle style = TextStyle(fontWeight: FontWeight.bold);

  Widget _buildFoodTimingButton(String text) {
    return CustomButton(
      text: text,
      isSelected: selectedFoodTiming == text,
      onPressed: () {
        setState(() {
          selectedFoodTiming = text;
        });
        print("Selected: $text");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Medicines",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0, // Ensures minimal gap between back button and title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search Medicine Name",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            // Compartment Selection
            Text("Compartment", style: style),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                children: compartments.map((e) {
                  return ChoiceChip(
                    label: Text(e.toString()),
                    selected: selectedCompartment == e,
                    onSelected: (selected) {
                      setState(() => selectedCompartment = e);
                    },
                    selectedColor: Color(0xFFedf1ff), // Light blue background when selected
                    backgroundColor: Colors.white, // Normal background
                    showCheckmark: false,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    side: BorderSide(
                      color: selectedCompartment == e ? Colors.blue : Colors.grey, // Blue border for selected
                      width: 1.5,
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Color Selection
            Text("Colour", style: style),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                children: colors.map((color) {
                  bool isSelected = selectedColour == color;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColour = color;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.transparent, // Highlight selected color
                          width: 1.5, // Thickness of the border
                        ),
                      ),
                      // padding: const EdgeInsets.all(4), // Padding around CircleAvatar
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 24, // Size of the color circle
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Medicine Type Selection
            Text("Type", style: style),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: medicineTypes.map((type) {
                      return ChoiceChip(
                        showCheckmark: false,
                        label: Text(type),
                        selected: selectedMedicineType == type,
                        onSelected: (selected) {
                          setState(() {
                            selectedMedicineType = type;
                          });
                        },
                        selectedColor: selectedColour,
                        backgroundColor: selectedColour,
                        side: BorderSide(
                          color: selectedMedicineType == type ? Colors.blue : Colors.grey,
                          width: 1.5,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Quantity Selection
            Text("Quantity", style: style),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Take 1/2 Pill",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    // TextEditingController:,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Color(0xFF6f8bef),
                  ),
                  onPressed: () {
                    if (totalCount > 1) {
                      setState(() => totalCount--);
                    }
                  },
                ),
                // Text(totalCount.toString()), // Show count
                IconButton(
                  icon: const Icon(
                    Icons.add_box,
                    color: Color(0xFF6f8bef),
                  ),
                  onPressed: () {
                    if (totalCount < 100) {
                      setState(() => totalCount++);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Total Count
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Count"),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white, // Background color
                        ),
                        child: Text(
                          totalCount.toStringAsFixed(0).padLeft(2, '0'), // Formats number as "01", "02", etc.
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // const SizedBox(height: 10),
            Slider(
              value: totalCount,
              min: 01,
              max: 100,
              divisions: 99,
              label: totalCount.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  totalCount = value;
                });
              },
            ),
            // Center(child: Text("Total Count: ${totalCount.toStringAsFixed(0)}")),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("01"), Text("100")],
              ),
            ),
            const SizedBox(height: 16),

            // Set Date
            const Text("Set Date", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startDate != null ? DateFormat('dd-MMM-yy').format(startDate!) : "Start Date",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              endDate != null ? DateFormat('dd-MMM-yy').format(endDate!) : "End Date",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Frequency of Days
            CustomDropdown(
              label: "Frequency of Days",
              value: selectedFrequency,
              items: frequencies,
              onChanged: (value) {
                setState(() => selectedFrequency = value!);
              },
            ),
            const SizedBox(height: 16),

            // How Many Times a Day
            CustomDropdown(
              label: "How many times a Day",
              value: selectedTimesPerDay,
              items: timesPerDay,
              onChanged: (value) {
                setState(() => selectedTimesPerDay = value!);
              },
            ),
            const SizedBox(height: 10),

            // Dose Timings
            Column(
              children: doses.map((dose) => DoseItem(doseName: dose)).toList(),
            ),
            // const SizedBox(height: 16),

            // Food Timing Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFoodTimingButton("Before Food"),
                  SizedBox(width: 10),
                  _buildFoodTimingButton("After Food"),
                  SizedBox(width: 10),
                  _buildFoodTimingButton("Before Sleep"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Add Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6f8bef),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
