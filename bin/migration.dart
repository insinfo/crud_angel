import 'package:angel_migration/angel_migration.dart';
import 'package:angel_migration_runner/angel_migration_runner.dart';
import 'package:angel_migration_runner/postgres.dart';

import 'package:crud_angel/models.dart';
import 'package:postgres/postgres.dart';

var migrationRunner = PostgresMigrationRunner(
  PostgreSQLConnection('127.0.0.1', 5432, 'crud',
      username: 'postgres', password: 's1sadm1n'),
  migrations: [
    PessoaMigration(),
  ],
);

main(List<String> args) => runMigrations(migrationRunner, args);
