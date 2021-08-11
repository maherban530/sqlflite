import 'package:flutter/material.dart';
import 'package:sql_flite_test/db/notes_database.dart';
import 'package:sql_flite_test/model/note.dart';
import 'package:sql_flite_test/page/add.dart';
import 'package:sql_flite_test/page/note_detail_page.dart';
import 'package:sql_flite_test/widget/note_card_widget.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.amber.shade50,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Contact',
          ),
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'No Contact',
                      style: TextStyle(fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];

          return
              // GestureDetector(
              //   onTap: () async {
              //     await Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => NoteDetailPage(noteId: note.id!),
              //     ));

              //     refreshNotes();
              //   },
              Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
              child: ListTile(
                title: Text(
                  note.firstname,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.lastname),
                    Text(note.mobileno),
                    Text(note.email),
                    Text(note.address),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      await NotesDatabase.instance.delete(note.id);
                      refreshNotes();
                    },
                    icon: Icon(Icons.delete)),
              ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     // Text(
              //     //   time,
              //     //   style: TextStyle(color: Colors.grey.shade700),
              //     // ),
              //     SizedBox(height: 4),
              //     Text(
              //       note.title,
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ),
            // ),
            // NoteCardWidget(note: note, index: index),
          );
        },
      );
}
