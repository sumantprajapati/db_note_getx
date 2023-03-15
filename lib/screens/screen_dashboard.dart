import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get/controllers.dart';
import '../models/model_notes.dart';
import 'package:intl/intl.dart';

class DashBoardScreen extends GetView<DashboardController> {
  static String pageId = "/dashboardScreen";
  final controllerr = Get.put(DashboardController());

  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        children: [
          Text('Swipe to Remove Note...'),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: controllerr.notesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controllerr.titleTextController.text =
                            controllerr.notesList[index].title;
                        controllerr.descTextController.text =
                            controllerr.notesList[index].description;
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10))),
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller:
                                              controllerr.titleTextController,
                                          decoration: const InputDecoration(
                                              hintText: 'Title',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller:
                                              controllerr.descTextController,
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                              hintText: 'description',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              if (controllerr.titleTextController.text !='' &&
                                                  controllerr.descTextController.text !='') {
                                                controllerr.updateNote(ModelNotes(
                                                  id: controllerr.notesList[index].id,
                                                  title: controllerr
                                                      .titleTextController.text
                                                      .toString(),
                                                  date:
                                                      DateTime.now().toString(),
                                                  description: controllerr
                                                      .descTextController.text
                                                      .toString(),
                                                ));
                                                Navigator.pop(context);
                                                controllerr.titleTextController.clear();
                                                controllerr.descTextController.clear();
                                              }
                                            },
                                            child: const Text(
                                              'Update Note',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete_forever),
                        ),
                        onDismissed: (DismissDirection direction) {
                          controllerr
                              .deleteNote(controllerr.notesList[index].id!);
                        },
                        key: ValueKey<int>(controllerr.notesList[index].id!),
                        child: Card(
                          child: ListTile(

                            contentPadding: const EdgeInsets.all(5),
                            title: Text(controllerr.notesList[index].title),
                            subtitle: Text(controllerr.notesList[index].description),
                            trailing: Text(DateFormat.MMMd().format(DateTime.parse(controllerr.notesList[index].date))),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controllerr.titleTextController.clear();
          controllerr.descTextController.clear();
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              isScrollControlled: true,
              isDismissible: true,
              context: context,
              builder: (context) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllerr.titleTextController,
                            decoration: const InputDecoration(
                                hintText: 'Title',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllerr.descTextController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                hintText: 'description',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (controllerr.titleTextController.text !=
                                        '' &&
                                    controllerr.descTextController.text != '') {
                                  controllerr.addNote(ModelNotes(
                                      title: controllerr
                                          .titleTextController.text
                                          .toString(),
                                      date: DateTime.now().toString(),
                                      description: controllerr
                                          .descTextController.text
                                          .toString()));
                                  controllerr.titleTextController.clear();
                                  controllerr.descTextController.clear();
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Add Note',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
