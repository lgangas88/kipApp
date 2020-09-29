class SharedPreferencesType {
  String _key;
  dynamic _value;

  SharedPreferencesType(this._key, this._value);

  String get key => _key;
  dynamic get value => _value;
}