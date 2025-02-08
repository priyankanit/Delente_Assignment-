class Stock {
  final String symbol;
  final String companyName;
  final double price;
  final double change;
  final double percentageChange;
  final double marketCap;
  final String sector;
  final int volume;
  final double oneDayReturn;
  final double oneWeekReturn;
  final double oneMonthReturn;
  final double oneYearReturn;
  final double openingPrice;
  final double open;
  final double high;
  final double low;
  final double previousClose;
  final double peRatio;
  final double dividendYield;
  final DateTime timestamp;
  final double roe;
  final double bookValue;
  final double faceValue;

  Stock({
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.change,
    required this.percentageChange,
    required this.marketCap,
    required this.sector,
    required this.volume,
    // required this.oneDayReturn,
    // required this.oneWeekReturn,
    // required this.oneMonthReturn,
    // required this.oneYearReturn,
    //required this.openingPrice,
    required this.open,
    required this.high,
    required this.low,
    required this.previousClose,
    required this.peRatio,
    required this.dividendYield,
    required this.timestamp,
    // required this.roe,
    // required this.bookValue,
    // required this.faceValue,
    this.oneDayReturn = 0.0,
    this.oneWeekReturn = 0.0,
    this.oneMonthReturn = 0.0,
    this.oneYearReturn = 0.0,
    this.openingPrice = 0.0,
    this.roe = 0.0,
    this.bookValue = 0.0,
    this.faceValue = 0.0,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'] ?? '',
      companyName: json['companyName'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      change: (json['change'] as num?)?.toDouble() ?? 0.0,
      percentageChange: (json['percentageChange'] as num?)?.toDouble() ?? 0.0,
      marketCap: (json['marketCap'] as num?)?.toDouble() ?? 0.0,
      sector: json['sector'] ?? '',
      volume: json['volume'] ?? 0,
      oneDayReturn: (json['oneDayReturn'] ?? 0).toDouble(),
      oneWeekReturn: (json['oneWeekReturn'] ?? 0).toDouble(),
      oneMonthReturn: (json['oneMonthReturn'] ?? 0).toDouble(),
      oneYearReturn: (json['oneYearReturn'] ?? 0).toDouble(),
      openingPrice: (json['openingPrice'] ?? 0).toDouble(),
      open: (json['open'] as num?)?.toDouble() ?? 0.0,
      high: (json['high'] as num?)?.toDouble() ?? 0.0,
      low: (json['low'] as num?)?.toDouble() ?? 0.0,
      previousClose: (json['previousClose'] as num?)?.toDouble() ?? 0.0,
      peRatio: (json['peRatio'] as num?)?.toDouble() ?? 0.0,
      dividendYield: (json['dividendYield'] as num?)?.toDouble() ?? 0.0,
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      roe: (json['roe'] ?? 0).toDouble(),
      bookValue: (json['bookValue'] ?? 0).toDouble(),
      faceValue: (json['faceValue'] ?? 0).toDouble(),
    );
  }
}
