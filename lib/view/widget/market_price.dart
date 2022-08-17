import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/market_notifier.dart';
import '../../notifier/trade_notifier.dart';

class MarketPriceText extends ConsumerWidget {
  const MarketPriceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tickNotifier = ref.watch(tickProvider);
    var defaultValue = ref.read(socketProvider).defaultPrice;

    /// Price displaying widget
    return tickNotifier.maybeWhen(
      data:(data){
        var currentValue = data.tick!.quote!;

        ///Set color base on value
        Color color = currentValue > defaultValue? Colors.green : currentValue < defaultValue ? Colors.red : Colors.grey;

        return Text(data.tick?.quote.toString()??"",
          style: TextStyle(fontSize: 20,color:color ),);
      },
      orElse: () => const Center(
        child: Text("Loading...."),
      ),);
  }
}
