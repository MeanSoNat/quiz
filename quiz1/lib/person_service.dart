import 'package:quiz1/person_list_model.dart';
import 'package:quiz1/person_provider.dart';
import 'package:quiz1/personlistmodel.dart';

class PersonService {
  PersonProvider _personProvider = new PersonProvider();
  PersonProvider _persondata = new PersonProvider();

  Future<PersonList> getPersonList() {
    return _personProvider.getPersonList();
  }

  Future<Personmodel> getdata(String URL) {
    // print(URL);
    return _persondata.persondata(URL);
  }
}
