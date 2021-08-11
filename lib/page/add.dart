import 'package:flutter/material.dart';
import 'package:sql_flite_test/db/notes_database.dart';
import 'package:sql_flite_test/model/districtModel.dart';
import 'package:sql_flite_test/model/note.dart';
import 'package:sql_flite_test/model/stateModel.dart';

class AddEditNotePage extends StatefulWidget {
  final Note note;

  const AddEditNotePage({
    Key key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  List<AnimationItems> animationList;
  List<District> district;
  int selectstateid;
  int selectdistrictid;

  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  Map<String, String> _CountryState = {
    "aa": "A",
    "aaa": "A",
    "BBB": "B",
    "BB": "B",
    "CC": "D",
    "DDD": "D",
    "hh": "D"
  };
  List<String> _state = [];
  String _selectedLocation;
  String _selectedState;

  final _formKey = GlobalKey<FormState>();
  // late bool isImportant;
  // late int number;
  String firstname;
  String lastname;
  String mobileno;
  String emailaddress;
  String address;

  @override
  void initState() {
    super.initState();

    animationList = allAnimationItems;
    district = allDistrict;
    // isImportant = widget.note?.isImportant ?? false;
    // number = widget.note?.number ?? 0;
    // title = widget.note?.title ?? '';
    // description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Add Contact"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTitle(),
                        SizedBox(height: 10),
                        buildDescription(),
                        SizedBox(height: 10),
                        buildmobileno(),
                        SizedBox(height: 10),
                        buildemail(),
                        SizedBox(height: 10),
                        buildaddress(),
                        SizedBox(height: 10),

                        DropdownButton(
                          hint: Text("select State"),
                          value: selectstateid,
                          onChanged: (value) {
                            setState(() {
                              selectstateid = value;
                            });
                          },
                          items: animationList.map(
                            (item) {
                              return DropdownMenuItem(
                                value: item.stateid,
                                child: new Text(item.statename),
                              );
                            },
                          ).toList(),
                        ),
                        /////////

                        DropdownButton(
                          hint: Text("select District"),
                          value: selectdistrictid,
                          onChanged: (value) {
                            setState(() {
                              selectdistrictid = value;
                            });
                          },
                          items: district.map(
                            (it) {
                              return DropdownMenuItem(
                                value: it.districtid,
                                child: new Text(it.districtname),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildButton(),
            ],
          ),
        ),
      );

  Widget buildButton() {
    // final isFormValid = firstname.isNotEmpty && description.isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              // onPrimary: Colors.white,
              // primary: isFormValid ? null : Colors.grey.shade700,
              ),
          onPressed: () async {
            final isValid = _formKey.currentState.validate();

            if (isValid) {
              await addNote();
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit'),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              // onPrimary: Colors.white,
              // primary: isFormValid ? null : Colors.grey.shade700,
              ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: firstname,
        decoration: InputDecoration(
          hintText: 'First Name',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (first) => first != null && first.isEmpty
            ? 'The First Name cannot be empty'
            : null,
        onChanged: (fn) => setState(() => firstname = fn),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: lastname,
        decoration: InputDecoration(
          hintText: 'Last Name',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (last) => last != null && last.isEmpty
            ? 'The Last Name cannot be empty'
            : null,
        onChanged: (ln) => setState(() => lastname = ln),
      );

  Widget buildmobileno() => TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        initialValue: mobileno,
        decoration: InputDecoration(
          hintText: 'Mobile Number',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (mobile) => mobile != null && mobile.isEmpty
            ? 'The Mobile Number cannot be empty'
            : null,
        onChanged: (fn) => setState(() => mobileno = fn),
      );
  Widget buildemail() => TextFormField(
        maxLines: 1,
        initialValue: emailaddress,
        decoration: InputDecoration(
          hintText: 'Email Address',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (email) => email != null && email.isEmpty
            ? 'The Email Address cannot be empty'
            : null,
        onChanged: (fn) => setState(() => emailaddress = fn),
      );
  Widget buildaddress() => TextFormField(
        maxLines: 3,
        initialValue: address,
        decoration: InputDecoration(
          hintText: 'Address',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (address) => address != null && address.isEmpty
            ? 'The Address cannot be empty'
            : null,
        onChanged: (fn) => setState(() => address = fn),
      );

  Future addNote() async {
    final note = Note(
      firstname: firstname,
      lastname: lastname,
      mobileno: mobileno,
      email: emailaddress,
      address: address,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}
