
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/model_tick.dart';

final tickProvider = StateProvider<AsyncValue<ModelTick>>((ref) {
  return const AsyncValue.loading();
});
