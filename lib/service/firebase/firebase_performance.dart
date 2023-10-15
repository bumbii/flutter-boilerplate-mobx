import 'package:firebase_performance/firebase_performance.dart';

Future<void> initFirebasePerformance() async {
  final FirebasePerformance performance = FirebasePerformance.instance;
  performance.setPerformanceCollectionEnabled(true);
}
