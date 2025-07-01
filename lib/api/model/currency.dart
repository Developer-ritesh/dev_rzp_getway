/// Represents a currency with its symbol, name, and code
class Currency {
  final String symbol;
  final String name;
  final String code;

  Currency({required this.symbol, required this.name, required this.code});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'code': code,
    };
  }

  @override
  String toString() {
    return 'Currency(symbol: $symbol, name: $name, code: $code)';
  }
}
