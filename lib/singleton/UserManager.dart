class UserManager {
  static final UserManager _instance = UserManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory UserManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  UserManager._internal() {
    // initialization logic
  }

  String name = 'Rohit';
  String gender = 'Male';
  String age = '29';

  // rest of class as normal, for example:
}
