import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String username = '';

  @observable
  String password = '';

  @computed
  bool get canLogin => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => username, validateUsername),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  void validateUsername(String value) {
    error.username = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  void dispose() {
    _disposers[0].reaction.dispose();
    _disposers[1].reaction.dispose();
  }

  void validateAll(BuildContext context) {
    validatePassword(password);
    validateUsername(username);
    if (canLogin) {
      Navigator.pushReplacementNamed(context, '/home', arguments: username);
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || password != null;
}
