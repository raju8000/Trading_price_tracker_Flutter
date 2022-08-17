import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/model_active_symbol.dart';
import '../../notifier/market_notifier.dart';

class DropDown<T> extends ConsumerStatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  ConsumerState<DropDown<T>> createState() => _DropDownState();
}

class _DropDownState<T> extends ConsumerState<DropDown<T>> {

  late T dropDownValue;
  List<T> items = [];

  @override
  Widget build(BuildContext context) {
    var socketNotifier = ref.watch(socketProvider);
    var activeSymbolsByMarketName = socketNotifier.uniqueActiveSymbolByMarketName;
    Iterable<String>? marketNames = activeSymbolsByMarketName.keys;

    ///Market places
    if(T == String) {
      if (marketNames.isNotEmpty) {
        items = (marketNames.toList() as List<T>);
        dropDownValue = (socketNotifier.selectedMarket as T);
      }
      ///Symbols as per selected market
    }else{
      if (marketNames.isNotEmpty && activeSymbolsByMarketName.isNotEmpty) {
        items = (activeSymbolsByMarketName[socketNotifier.selectedMarket] as List<T>);
        dropDownValue = (socketNotifier.selectedSymbol as T);
      }
    }

    ///Generic dropdown
    return items.isNotEmpty? InputDecorator(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(

          value: dropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down),

          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: T == String ? Text(item as String):  Text((item as ActiveSymbols).symbol??""),
            );
          }).toList(),

          onChanged: (T? newValue) {
            socketNotifier.updateValue<T>(newValue as T);
          },
        ),
      ),
    ):Container();

  }
}