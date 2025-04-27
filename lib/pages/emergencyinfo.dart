import 'package:flutter/material.dart';

class EmergencyInfoPage extends StatefulWidget {
  const EmergencyInfoPage({super.key});

  @override
  State<EmergencyInfoPage> createState() => _EmergencyInfoPageState();
}

class _EmergencyInfoPageState extends State<EmergencyInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _medicalNotesController = TextEditingController();

  String? _bloodType;
  String? _organDonorStatus;
  List<String> _selectedAllergies = [];
  bool _isEditing = false;

  final List<String> _bloodTypes = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-', 'Unknown'
  ];

  final List<String> _commonAllergies = [
    'None', 'Dust', 'Pollen', 'Peanuts', 'Dairy', 
    'Eggs', 'Seafood', 'Insect stings', 'Penicillin', 'Sulfa Drugs'
  ];

  @override
  void initState() {
    super.initState();
    // Load saved data (in a real app, this would come from a database)
    _loadSavedData();
  }

  void _loadSavedData() {
    // Mock data - replace with actual data loading
    setState(() {
      _addressController.text = "302 B, Blue Orchid Apartments, Pune";
      _bloodType = "A+";
      _selectedAllergies = ["Dust", "Pollen"];
      _medicationsController.text = "Paracetamol, Metformin";
      _organDonorStatus = "Yes";
      _medicalNotesController.text = "Diabetic patient";
    });
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing && _formKey.currentState!.validate()) {
        _saveData();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Emergency info saved successfully")),
        );
      }
    });
  }

  void _saveData() {
    // Save to database or state management
    debugPrint("Saved data:");
    debugPrint("Address: ${_addressController.text}");
    debugPrint("Blood Type: $_bloodType");
    debugPrint("Allergies: $_selectedAllergies");
    debugPrint("Medications: ${_medicationsController.text}");
    debugPrint("Organ Donor: $_organDonorStatus");
    debugPrint("Medical Notes: ${_medicalNotesController.text}");
  }

  void _showAllergySelection() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Select Allergies"),
            content: SingleChildScrollView(
              child: Column(
                children: _commonAllergies.map((allergy) {
                  return CheckboxListTile(
                    title: Text(allergy),
                    value: _selectedAllergies.contains(allergy),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedAllergies.add(allergy);
                        } else {
                          _selectedAllergies.remove(allergy);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _allergiesController.text = _selectedAllergies.join(", ");
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Information"),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEditing,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address Field
              _buildEditableField(
                label: "🏠 Address",
                controller: _addressController,
                hintText: "Enter your permanent/local address",
                isEditing: _isEditing,
              ),
              const SizedBox(height: 20),

              // Blood Type Dropdown
              _buildDropdownField(
                label: "🩸 Blood Type",
                value: _bloodType,
                items: _bloodTypes,
                isEditing: _isEditing,
                onChanged: (value) => setState(() => _bloodType = value),
              ),
              const SizedBox(height: 20),

              // Allergies Field
              _buildEditableField(
                label: "⚠ Allergies",
                controller: _allergiesController,
                hintText: "Select your allergies",
                isEditing: _isEditing,
                onTap: _isEditing ? _showAllergySelection : null,
                readOnly: true,
              ),
              const SizedBox(height: 20),

              // Medications Field
              _buildEditableField(
                label: "💊 Medications",
                controller: _medicationsController,
                hintText: "Add any medications you are currently taking",
                isEditing: _isEditing,
              ),
              const SizedBox(height: 20),

              // Organ Donor Radio Buttons
              _buildRadioOptions(
                label: "❤ Organ Donor",
                value: _organDonorStatus,
                options: const ["Yes", "No", "I don't know / Prefer not to say"],
                isEditing: _isEditing,
                onChanged: (value) => setState(() => _organDonorStatus = value),
              ),
              const SizedBox(height: 20),

              // Medical Notes Field
              _buildEditableField(
                label: "📋 Medical Notes",
                controller: _medicalNotesController,
                hintText: "Add any important medical notes",
                isEditing: _isEditing,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required bool isEditing,
    VoidCallback? onTap,
    bool readOnly = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: isEditing ? const Icon(Icons.edit) : null,
            filled: !isEditing,
            fillColor: Colors.grey[100],
          ),
          readOnly: !isEditing || readOnly,
          onTap: onTap,
          maxLines: maxLines,
          validator: (value) {
            if (isEditing && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required bool isEditing,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: isEditing ? onChanged : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: !isEditing,
            fillColor: Colors.grey[100],
          ),
          disabledHint: Text(value ?? "Not specified"),
        ),
      ],
    );
  }

  Widget _buildRadioOptions({
    required String label,
    required String? value,
    required List<String> options,
    required bool isEditing,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (!isEditing)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(value ?? "Not specified"),
          ),
        if (isEditing)
          Column(
            children: options.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: value,
                onChanged: onChanged,
                dense: true,
                contentPadding: EdgeInsets.zero,
              );
            }).toList(),
          ),
      ],
    );
  }
}