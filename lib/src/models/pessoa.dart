import 'package:angel_migration/angel_migration.dart';
import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:meta/meta.dart';
part 'pessoa.g.dart';

@serializable
@Orm(generateMigrations: true)
abstract class _Pessoa extends Model {
  @Column(type: ColumnType.text)
  @SerializableField(isNullable: true)
  String get nome;

  @Column(type: ColumnType.text)
  @SerializableField(isNullable: true)
  String get telefone;
}
