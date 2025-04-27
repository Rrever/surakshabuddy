import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure this import is present


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EmergencyContactInfo2Widget(),
    );
  }
}

class EmergencyContactInfo2Widget extends StatefulWidget {
  const EmergencyContactInfo2Widget({super.key});

  @override
  State<EmergencyContactInfo2Widget> createState() =>
      _EmergencyContactInfo2WidgetState();
}

class _EmergencyContactInfo2WidgetState
    extends State<EmergencyContactInfo2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController1 = TextEditingController();
  final FocusNode textFieldFocusNode1 = FocusNode();
  final TextEditingController textController2 = TextEditingController();
  final FocusNode textFieldFocusNode2 = FocusNode();
  final TextEditingController textController3 = TextEditingController();
  final FocusNode textFieldFocusNode3 = FocusNode();
  final TextEditingController textController4 = TextEditingController();
  final FocusNode textFieldFocusNode4 = FocusNode();
  final TextEditingController textController5 = TextEditingController();
  final FocusNode textFieldFocusNode5 = FocusNode();
  final ExpandableController expandableExpandableController =
      ExpandableController(initialExpanded: false);
  final TextEditingController textController6 = TextEditingController();
  final FocusNode textFieldFocusNode6 = FocusNode();
  final TextEditingController textController7 = TextEditingController();
  final FocusNode textFieldFocusNode7 = FocusNode();
  final TextEditingController textController8 = TextEditingController();
  final FocusNode textFieldFocusNode8 = FocusNode();
  String? dropDownValue;

  @override
  void dispose() {
    textController1.dispose();
    textFieldFocusNode1.dispose();
    textController2.dispose();
    textFieldFocusNode2.dispose();
    textController3.dispose();
    textFieldFocusNode3.dispose();
    textController4.dispose();
    textFieldFocusNode4.dispose();
    textController5.dispose();
    textFieldFocusNode5.dispose();
    expandableExpandableController.dispose();
    textController6.dispose();
    textFieldFocusNode6.dispose();
    textController7.dispose();
    textFieldFocusNode7.dispose();
    textController8.dispose();
    textFieldFocusNode8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF333333),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Create Contact',
            style: GoogleFonts.interTight(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: TextButton(
                onPressed: () {
                  debugPrint('Button pressed ...');
                },
                child: Text(
                  'Save',
                  style: GoogleFonts.interTight(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 1,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x10000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.person,
                              color: Color(0xFFBDBDBD),
                              size: 40,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: textController1,
                    focusNode: textFieldFocusNode1,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: GoogleFonts.inter(
                        color: Color(0xFF757575),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEEEEEE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                    ),
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: textController2,
                    focusNode: textFieldFocusNode2,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: GoogleFonts.inter(
                        color: Color(0xFF757575),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEEEEEE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                    ),
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: textController3,
                    focusNode: textFieldFocusNode3,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Company',
                      labelStyle: GoogleFonts.inter(
                        color: Color(0xFF757575),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEEEEEE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                    ),
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Phone Number',
                            style: GoogleFonts.interTight(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Text(
                                        '+91',
                                        style: GoogleFonts.inter(
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xFF757575),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: textController4,
                                  focusNode: textFieldFocusNode4,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Add Phone pressed'),
                            icon: Icon(Icons.add, color: Colors.blue),
                            label: Text(
                              'Add Phone',
                              style: GoogleFonts.inter(
                                color: Colors.blue,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.interTight(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: textController5,
                            focusNode: textFieldFocusNode5,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              filled: true,
                              fillColor: Color(0xFFF5F5F5),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFEEEEEE),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => debugPrint('Add Email pressed'),
                            icon: Icon(Icons.add, color: Colors.blue),
                            label: Text(
                              'Add Email',
                              style: GoogleFonts.inter(
                                color: Colors.blue,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    color: Color(0xFFF5F5F5),
                    child: ExpandableNotifier(
                      controller: expandableExpandableController,
                      child: ExpandablePanel(
                        header: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.medical_services,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Medical Info',
                                      style: GoogleFonts.interTight(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  value: dropDownValue,
                                  items: [
                                    'A+',
                                    'A-',
                                    'B+',
                                    'B-',
                                    'AB+',
                                    'AB-',
                                    'O+',
                                    'O-'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  decoration: InputDecoration(
                                    hintText: 'Blood Group',
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: textController6,
                                  focusNode: textFieldFocusNode6,
                                  decoration: InputDecoration(
                                    labelText: 'Allergies',
                                    labelStyle: GoogleFonts.inter(
                                      color: Color(0xFF757575),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: textController7,
                                  focusNode: textFieldFocusNode7,
                                  decoration: InputDecoration(
                                    labelText: 'Medical Conditions',
                                    labelStyle: GoogleFonts.inter(
                                      color: Color(0xFF757575),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: textController8,
                                  focusNode: textFieldFocusNode8,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    labelText: 'Emergency Instructions',
                                    labelStyle: GoogleFonts.inter(
                                      color: Color(0xFF757575),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Add Address',
                                style: GoogleFonts.interTight(
                                  color: Color(0xFF333333),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF757575),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}