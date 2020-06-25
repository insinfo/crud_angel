library crud_angel.src.routes;

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/file.dart';
import 'controllers/controllers.dart' as controllers;
import '../models/pessoa.dart';

AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    await app.configure(controllers.configureServer);

    app.get('/', (req, res) => res.render('hello'));
    //lista pessoa
    app.get('/pessoas', (req, res) {
      var executor = req.container.make<QueryExecutor>();
      var query = PessoaQuery();
      return query.get(executor);
    });
    //cadastra pessoa
    app.post('/pessoas', (req, res) async {
      await req.parseBody();

      if (!req.bodyAsMap.containsKey('nome')) {
        throw AngelHttpException.badRequest(message: 'Missing "nome".');
      } else {
        var executor = req.container.make<QueryExecutor>();

        var p = PessoaQuery();
        p.values.nome = req.bodyAsMap['nome'] as String;
        p.values.telefone = req.bodyAsMap['telefone'] as String;
        var query = p;
        return await query.insert(executor);
      }
    });
    //update pessoa
    app.put('/pessoas/:id', (req, res) async {
      await req.parseBody();
      var id = int.tryParse(req.params['id'].toString());
      if (!req.bodyAsMap.containsKey('nome')) {
        throw AngelHttpException.badRequest(message: 'Missing "nome".');
      } else {
        var executor = req.container.make<QueryExecutor>();
        var p = PessoaQuery();
        p.values.nome = req.bodyAsMap['nome'] as String;
        p.values.telefone = req.bodyAsMap['telefone'] as String;
        var query = p;
        query.where.id.equals(id);
        return await query.update(executor);
      }
    });
    //obtem uma pessoa
    app.get('/pessoas/:id', (req, res) {
      var id = req.params['id'] as int;
      var executor = req.container.make<QueryExecutor>();
      var query = PessoaQuery()..where.id.equals(id);
      return query.get(executor);
    });
    //deleta uma lista de pessoas
    app.delete('/pessoas', (req, res) async {
      await req.parseBody();

      var items = req.bodyAsList;

      for (var i in items) {
        var item = i as Map;
        var executor = req.container.make<QueryExecutor>();
        var p = PessoaQuery();
        var query = p;
        query.where.id.equals(item['id'] as int);
        await query.delete(executor);
      }

      return items;
    });

    // Mount static server at web in development.
    // The `CachingVirtualDirectory` variant of `VirtualDirectory` also sends `Cache-Control` headers.
    //
    // In production, however, prefer serving static files through NGINX or a
    // similar reverse proxy.
    //
    // Read the following two sources for documentation:
    // * https://medium.com/the-angel-framework/serving-static-files-with-the-angel-framework-2ddc7a2b84ae
    // * https://github.com/angel-dart/static
    if (!app.environment.isProduction) {
      var vDir = VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory('web'),
      );
      app.fallback(vDir.handleRequest);
    }

    // Throw a 404 if no route matched the request.
    app.fallback((req, res) => throw AngelHttpException.notFound());

    // Set our application up to handle different errors.
    //
    // Read the following for documentation:
    // * https://github.com/angel-dart/angel/wiki/Error-Handling

    var oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
