import 'package:postgres/postgres.dart';

class FetchDatabase {
  Connection? connection;

  FetchDatabase() {
    /*..Create Postgres Connection....*/
    getConnection();
  }

  Future<Connection>? getConnection() async {
    try {
      if (!connection!.isOpen || connection == null) {
        connection = await Connection.open(
          Endpoint(
            host: 'IP address',
            database: 'DB_name',
            username: 'DB_user',
            password: 'DB_password',
            isUnixSocket: false,
          ),
          // The postgres server hosted locally doesn't have SSL by default. If you're
          // accessing a postgres server over the Internet, the server should support
          // SSL and you should swap out the mode with `SslMode.verifyFull`.
          settings: ConnectionSettings(sslMode: SslMode.disable),
        );
      }
    } catch (exc) {
      exc.toString();
    }
    return connection!;
  }

//////////// ///////////////////
  List<List>? fetchDataFuture;
  Result? getDataResult;
  Future<List<List>?>? fetchProductsData(String? category) async {
    try {
      getDataResult = await connection!.runTx((session) {
        return session.execute(
          'select * from main.products where categoryDB = @categoryValue',
          parameters: {'categoryValue': category},
          ignoreRows: false,
          queryMode: QueryMode.simple,
          timeout: Duration(seconds: 30),
        );
      });
      if (getDataResult!.affectedRows > 0) {
        //
        fetchDataFuture = getDataResult!.toList();
      } else {
        fetchDataFuture = [];
      }
    } catch (exc) {
      //
      fetchDataFuture = null;
    }
    return fetchDataFuture!;
  }
}
