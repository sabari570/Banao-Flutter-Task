import 'dart:convert';

import 'package:banao_flutter_tasks/models/lessonsModel.dart';
import 'package:banao_flutter_tasks/models/programsModel.dart';
import 'package:http/http.dart' as http;

Future<ItemData?> fetchProgramsData() async {
  try {
    String programsURL =
        "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
    var programResponse = await http.get(Uri.parse(programsURL));
    ItemData itemData = itemDataFromJson(programResponse.body);
    return itemData;
  } catch (e) {
    print("Exception is: ${e.toString()}");
    return null;
  }
}

Future<Lessons?> fetchLessonsData() async {
  try {
    String lessonsURL =
        "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
    var lessonResponse = await http.get(Uri.parse(lessonsURL));
    Lessons lessonsData = lessonsFromJson(lessonResponse.body);
    return lessonsData;
  } catch (e) {
    print("Exception is: ${e.toString()}");
    return null;
  }
}
