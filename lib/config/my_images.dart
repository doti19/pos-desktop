class MyImages {
  MyImages._();
  static final MyImages _instance = MyImages._();
  factory MyImages() => _instance;

  String image = 'assets/image';
  String logo = 'assets/images/logo.png';
  String kDefaultImage =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
}
