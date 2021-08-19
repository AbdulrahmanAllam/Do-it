import 'package:do_it_flutter/model/local/local_data_source.dart';
import 'package:do_it_flutter/model/remote/remote_data_source.dart';

class Repository with RemoteDataSource, LocalDataSource{}
