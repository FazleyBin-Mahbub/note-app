import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/widgets/add_task_field.dart';
import 'package:note_keeper_app/widgets/floating_action_btn.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<NoteDetail> createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  String? appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  _NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          controller: ScrollController(),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15, top: 10, bottom: 10, right: 8),
                        decoration: BoxDecoration(
                          color: Color(0xff252525),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      appBarTitle.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/add_note.png',
                width: 400,
                height: 300,
              ),
              Center(
                child: Text(
                  '$appBarTitle here!',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, top: 20),
              //   child: Text(
              //     'Click here to ${appBarTitle}',
              //     style: GoogleFonts.indieFlower(
              //       fontSize: 18,
              //       color: Colors.white.withOpacity(0.3),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 40.0),
              //   child: Image.asset(
              //     'assets/images/arrow.png',
              //     height: 100,
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: addedTask(
          onpressed: () {
            showModalBottomSheet(
              backgroundColor: backgroundColor.withOpacity(0.9),
              context: context,
              builder: (context) => AddNote(),
            );
          },
          taskButtonToolTip: 'Add Task',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget AddNote() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Add Your Task From Here!',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // title field
          addTaskField(
              controller: titleController,
              hintText: 'Title',
              fontSize: 28,
              cursorHeight: 40),
          SizedBox(
            height: 20,
          ),
          // description field
          addTaskField(
              controller: descController,
              hintText: 'Description...',
              fontSize: 17,
              cursorHeight: 45),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // save button
              taskButton(
                  color: Color(0xff30BE71), buttonText: 'Save', onClick: () {}),
              SizedBox(
                width: 20,
              ),
              // delete button
              taskButton(
                  color: Color(0xffFF0000),
                  buttonText: 'Delete',
                  onClick: () {})
            ],
          )
        ],
      );

  // save task and delete task button
  Widget taskButton(
          {required Color color,
          required String buttonText,
          required VoidCallback onClick}) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              ),
              backgroundColor: MaterialStateProperty.all(
                color,
              ),
            ),
            onPressed: onClick,
            child: Text(
              buttonText,
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
}
