import 'package:balanced_meal/models/user_detils_model.dart';
import 'package:flutter/material.dart';

class UserdetailsScreen extends StatefulWidget {
  const UserdetailsScreen({super.key});

  @override
  State<UserdetailsScreen> createState() => _UserdetailsScreenState();
}

class _UserdetailsScreenState extends State<UserdetailsScreen> {
  String? selectedGender;
  List<String> gender = ["Male", "Female"];
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Enter your details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Gender",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFEAECF0), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                selectedItemBuilder: (BuildContext context) {
                  return gender.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList();
                },
                underline: SizedBox(),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),

                value: selectedGender,
                isExpanded: true,

                hint: Text("Choose your gender"),
                items: gender.map((String value) {
                  bool isSelected = selectedGender == value;
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: isSelected
                          ? BoxDecoration(
                              color: Color(0xFFFFEDE3),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check, color: Colors.orangeAccent),
                        ],
                      ),
                    ),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                  // Handle gender selection
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Weight",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            TextField(
              onChanged: (_) => setState(() {}),
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your weight",

                suffix: Text("Kg"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Height",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            TextField(
              onChanged: (_) => setState(() {}),
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your height",
                suffix: Text("Cm"),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Age",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            TextField(
              onChanged: (_) => setState(() {}),
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your age",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: () {
                  if (int.tryParse(_weightController.text) != null &&
                      int.tryParse(_heightController.text) != null &&
                      int.tryParse(_ageController.text) != null &&
                      selectedGender != null) {
                    return Color(0xFFF25700);
                  }
                  return Color(0xFFFFEDE3);
                }(),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (int.tryParse(_weightController.text) != null &&
                      int.tryParse(_heightController.text) != null &&
                      int.tryParse(_ageController.text) != null &&
                      selectedGender != null) {
                        Navigator.of(context).pushNamed(
                          'createorder',
                          arguments: 
                            UserDetailsModel(
                              gender: selectedGender!,
                              weight: int.parse(_weightController.text),
                              height: int.parse(_heightController.text),
                              age: int.parse(_ageController.text),
                            )
                          
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please fill all the fields with integer values.",
                        ),backgroundColor: Colors.red,
                        
                      ),
                    );
                  }
                });
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
