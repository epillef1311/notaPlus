mixin AuthRepository {
  Future<bool> registerUser({
    required String nome,
    required String email,
    required String dataNascimento,
    required String password,
  });
}
