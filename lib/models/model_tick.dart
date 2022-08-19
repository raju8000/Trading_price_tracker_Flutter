class ModelTick {
  EchoReq? echoReq;
  String? msgType;
  Subscription? subscription;
  Tick? tick;

  ModelTick({echoReq, msgType, subscription, tick});

  ModelTick.fromJson(Map<String, dynamic> json) {
    echoReq = json['echo_req'] != null
        ?  EchoReq.fromJson(json['echo_req'])
        : null;
    msgType = json['msg_type'];
    subscription = json['subscription'] != null
        ?  Subscription.fromJson(json['subscription'])
        : null;
    tick = json['tick'] != null ?  Tick.fromJson(json['tick']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (echoReq != null) {
      data['echo_req'] = echoReq!.toJson();
    }
    data['msg_type'] = msgType;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    if (tick != null) {
      data['tick'] = tick!.toJson();
    }
    return data;
  }
}

class EchoReq {
  int? subscribe;
  String? ticks;

  EchoReq({subscribe, ticks});

  EchoReq.fromJson(Map<String, dynamic> json) {
    subscribe = json['subscribe'];
    ticks = json['ticks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['subscribe'] = subscribe;
    data['ticks'] = ticks;
    return data;
  }
}

class Subscription {
  String? id;

  Subscription({id});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Tick {
  double? ask;
  double? bid;
  int? epoch;
  String? id;
  int? pipSize;
  double? quote;
  String? symbol;

  Tick(
      {ask,
        bid,
        epoch,
        id,
        pipSize,
        quote,
        symbol});

  Tick.fromJson(Map<String, dynamic> json) {
    try{
    ask =  json['ask'];
    }catch(e){
      int tempAsk = json['ask'];
      ask = tempAsk.toDouble();
    }
    bid = json['bid'].toDouble();
    epoch = json['epoch'];
    id = json['id'];
    pipSize = json['pip_size'];
    quote = getDouble(json['quote']);
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ask'] = ask;
    data['bid'] = bid;
    data['epoch'] = epoch;
    data['id'] = id;
    data['pip_size'] = pipSize;
    data['quote'] = quote;
    data['symbol'] = symbol;
    return data;
  }

  double getDouble(dynamic data){
    try{
      double value =  data;
      return value;
    }catch(e){
      int tempValue = data;
      return tempValue.toDouble();
    }
  }
}
