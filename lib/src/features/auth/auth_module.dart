import 'package:estetica_model/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> authModule = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];
