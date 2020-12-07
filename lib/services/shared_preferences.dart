import 'package:shared_preferences/shared_preferences.dart';

const String CURRENT_ID = 'current_note_id';
const String NOTEBOOK = 'notebook';

Future<String> getSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

setSharedPreference(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String> getCurrentId() => getSharedPreferences(CURRENT_ID);

setCurrentId(String id) => setSharedPreference(CURRENT_ID, id);

Future<String> getNotebookSharedPreference() => getSharedPreferences(NOTEBOOK);

setNotebookSharedPreference(String id) => setSharedPreference(NOTEBOOK, id);