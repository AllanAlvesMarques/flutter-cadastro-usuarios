class Users{
  String? id;
  bool isFav = false;
  String? nome;
  String? telefone;
  String? celular;
  String? email;
  String? endereco;
  String? bairro;
  String? cidade;
  String? foto;

  Users(
    {
      this.id,
      this.isFav = false,
      this.nome,
      this.telefone,
      this.celular,
      this.email,
      this.endereco,
      this.bairro,
      this.cidade,
      this.foto,
    }
  );
}