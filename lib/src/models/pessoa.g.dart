// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class PessoaMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('pessoas', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('nome');
      table.varChar('telefone');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('pessoas');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class PessoaQuery extends Query<Pessoa, PessoaQueryWhere> {
  PessoaQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = PessoaQueryWhere(this);
  }

  @override
  final PessoaQueryValues values = PessoaQueryValues();

  PessoaQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'pessoas';
  }

  @override
  get fields {
    return const ['id', 'created_at', 'updated_at', 'nome', 'telefone'];
  }

  @override
  PessoaQueryWhere get where {
    return _where;
  }

  @override
  PessoaQueryWhere newWhereClause() {
    return PessoaQueryWhere(this);
  }

  static Pessoa parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Pessoa(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        nome: (row[3] as String),
        telefone: (row[4] as String));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class PessoaQueryWhere extends QueryWhere {
  PessoaQueryWhere(PessoaQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        nome = StringSqlExpressionBuilder(query, 'nome'),
        telefone = StringSqlExpressionBuilder(query, 'telefone');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder nome;

  final StringSqlExpressionBuilder telefone;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, nome, telefone];
  }
}

class PessoaQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  String get nome {
    return (values['nome'] as String);
  }

  set nome(String value) => values['nome'] = value;
  String get telefone {
    return (values['telefone'] as String);
  }

  set telefone(String value) => values['telefone'] = value;
  void copyFrom(Pessoa model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    nome = model.nome;
    telefone = model.telefone;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Pessoa extends _Pessoa {
  Pessoa({this.id, this.createdAt, this.updatedAt, this.nome, this.telefone});

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  final String nome;

  @override
  final String telefone;

  Pessoa copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String nome,
      String telefone}) {
    return Pessoa(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        nome: nome ?? this.nome,
        telefone: telefone ?? this.telefone);
  }

  bool operator ==(other) {
    return other is _Pessoa &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.nome == nome &&
        other.telefone == telefone;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, nome, telefone]);
  }

  @override
  String toString() {
    return "Pessoa(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, nome=$nome, telefone=$telefone)";
  }

  Map<String, dynamic> toJson() {
    return PessoaSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const PessoaSerializer pessoaSerializer = PessoaSerializer();

class PessoaEncoder extends Converter<Pessoa, Map> {
  const PessoaEncoder();

  @override
  Map convert(Pessoa model) => PessoaSerializer.toMap(model);
}

class PessoaDecoder extends Converter<Map, Pessoa> {
  const PessoaDecoder();

  @override
  Pessoa convert(Map map) => PessoaSerializer.fromMap(map);
}

class PessoaSerializer extends Codec<Pessoa, Map> {
  const PessoaSerializer();

  @override
  get encoder => const PessoaEncoder();
  @override
  get decoder => const PessoaDecoder();
  static Pessoa fromMap(Map map) {
    return Pessoa(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        nome: map['nome'] as String,
        telefone: map['telefone'] as String);
  }

  static Map<String, dynamic> toMap(_Pessoa model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'nome': model.nome,
      'telefone': model.telefone
    };
  }
}

abstract class PessoaFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    nome,
    telefone
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String nome = 'nome';

  static const String telefone = 'telefone';
}
