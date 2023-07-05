import 'package:mobx/mobx.dart';
part 'form_store.g.dart';

class FormStore = FormStoreBase with _$FormStore;

abstract class FormStoreBase with Store {
  @observable
  String email = '';
  @observable
  String password = '';

  @computed
  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
}
