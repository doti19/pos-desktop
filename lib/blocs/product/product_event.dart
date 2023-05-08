part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoginEvent extends ProductEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
