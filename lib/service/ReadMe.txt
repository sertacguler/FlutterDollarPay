userRepository içirisndeki service'leri pagelerde aşağıdaki şekilde çağırabiliriz.

 Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    return users;
  }