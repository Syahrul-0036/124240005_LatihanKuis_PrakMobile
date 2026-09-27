class User {
  final String email;
  final String password;

  const User({required this.email, required this.password});
}

const user1 = User(email: 'admin@admin.com', password: '123456');
