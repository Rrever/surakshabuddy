import 'package:flutter/material.dart';

class EmergencyContactPage extends StatefulWidget {
  const EmergencyContactPage({super.key});

  @override
   EmergencyContactPageState createState() =>  EmergencyContactPageState();
}

class  EmergencyContactPageState extends State<EmergencyContactPage> {
  bool syncWithSOS = false;

  List<Map<String, String>> contacts = [
    {
      'name': 'John Smith',
      'relation': 'Spouse',
      'phone': '+1 (555) 123-4567',
    },
    {
      'name': 'Sarah Johnson',
      'relation': 'Sister',
      'phone': '+1 (555) 987-6543',
    },
    {
      'name': 'Michael Williams',
      'relation': 'Friend',
      'phone': '+1 (555) 456-7890',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
        leading: BackButton(),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Emergency Contact'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 219, 149, 144),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/addemergencycontact');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Saved Contacts", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text("Sync with SOS"),
                    Switch(
                      value: syncWithSOS,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          syncWithSOS = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact['name']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(contact['relation']!, style: TextStyle(color: Colors.grey)),
                          Text(contact['phone']!),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green[100],
                                child: Icon(Icons.call, color: Colors.green),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.blue[100],
                                child: Icon(Icons.message, color: Colors.blue),
                              ),
                              Spacer(),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit, size: 18),
                                label: Text("Edit"),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete, size: 18, color: Colors.red),
                                label: Text("Delete", style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
