// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterBarModel extends Model {
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

  final Set<String> _selectedList = <String>{};

  Map<String, List<GeneralType>> get dataList {
    var result = <String, List<GeneralType>>{};
    result['_roomTypeList'] = _roomTypeList;
    result['_orientedList'] = _orientedList;
    result['_floorList'] = _floorList;
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['_roomTypeList']!;
    _orientedList = data['_orientedList']!;
    _floorList = data['_floorList']!;
    notifyListeners();
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
  }
}
