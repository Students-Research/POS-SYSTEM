class Config {
  // final String _devBaseUrl =
  //     'https://antonxdemo.com/posSystem/public/api/';
  // final String _testBaseUrl =
  //     'https://antonxdemo.com/posSystem/public/api/';
  // final String _productionBaseUrl =
  //     'https://antonxdemo.com/posSystem/public/api/';

  late String _baseUrl = 'https://pointofsale.antonx.com/public/api/';

  /// Getters

  String get baseUrl => _baseUrl;

  /// Constructor
  // Config(this._env) {
  //   _setupBaseUrl();
  // }

  // _setupBaseUrl() {
  //   if (_env == Env.production) {
  //     _baseUrl = _productionBaseUrl;
  //   } else if (_env == Env.production) {
  //     _baseUrl = _testBaseUrl;
  //   } else if (_env == Env.production) {
  //     _baseUrl = _devBaseUrl;
  //   }
  // }
}
