final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, firstname, lastname, mobileno, email, address, time
  ];

  static final String id = '_id';

  static final String firstname = 'firstname';
  static final String lastname = 'lastname';
  static final String mobileno = 'mobileno';
  static final String email = 'email';
  static final String address = 'address';
  static final String time = 'time';
}

class Note {
  final int id;

  final String firstname;
  final String lastname;
  final String mobileno;
  final String email;
  final String address;

  final DateTime createdTime;

  const Note({
    this.id,
    this.firstname,
    this.lastname,
    this.mobileno,
    this.email,
    this.address,
    this.createdTime,
  });

  Note copy({
    int id,
    String firstname,
    String lastname,
    String mobileno,
    String email,
    String address,
    DateTime createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        mobileno: mobileno ?? this.mobileno,
        email: email ?? this.email,
        address: address ?? this.address,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object> json) => Note(
        id: json[NoteFields.id] as int,
        firstname: json[NoteFields.firstname] as String,
        lastname: json[NoteFields.lastname] as String,
        mobileno: json[NoteFields.mobileno] as String,
        email: json[NoteFields.email] as String,
        address: json[NoteFields.address] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object> toJson() => {
        NoteFields.id: id,
        NoteFields.firstname: firstname,
        NoteFields.lastname: lastname,
        NoteFields.mobileno: mobileno,
        NoteFields.email: email,
        NoteFields.address: address,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
