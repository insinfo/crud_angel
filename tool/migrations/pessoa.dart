import 'package:angel_migration/angel_migration.dart';

class PessoaMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('pessoas', (table) {
      table.serial('id').primaryKey();
      table.text('nome');
      table.text('telefone');
      table.date('created_at');
      table.date('updated_at');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('pessoas');
  }
}
