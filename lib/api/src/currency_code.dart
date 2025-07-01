/// Enum representing various currency codes with their respective symbols and names.
enum CurrencyCode {
  usd(symbol: r'$', name: 'United States Dollar', code: 'USD'),
  eur(symbol: '€', name: 'European Euro', code: 'EUR'),
  gbp(symbol: '£', name: 'Pound Sterling', code: 'GBP'),
  sgd(symbol: 'S\$', name: 'Singapore Dollar', code: 'SGD'),
  aed(symbol: 'د.إ', name: 'United Arab Emirates Dirham', code: 'AED'),
  aud(symbol: 'AU\$', name: 'Australian Dollar', code: 'AUD'),
  cad(symbol: 'CA\$', name: 'Canadian Dollar', code: 'CAD'),
  cny(symbol: '¥', name: 'Chinese Yuan Renminbi', code: 'CNY'),
  sek(symbol: 'Skr', name: 'Swedish Krona', code: 'SEK'),
  nzd(symbol: 'NZ\$', name: 'New Zealand Dollar', code: 'NZD'),
  mxn(symbol: 'MX\$', name: 'Mexican Peso', code: 'MXN'),
  rub(symbol: '₽', name: 'Russian Ruble', code: 'RUB'),
  all(symbol: 'Lek', name: 'Albanian Lek', code: 'ALL'),
  amd(symbol: '֏', name: 'Armenian Dram', code: 'AMD'),
  ars(symbol: 'AR\$', name: 'Argentine Peso', code: 'ARS'),
  awg(symbol: 'ƒ', name: 'Aruban Florin', code: 'AWG'),
  bbd(symbol: 'Bds\$', name: 'Barbadian Dollar', code: 'BBD'),
  bdt(symbol: 'Tk', name: 'Bangladeshi Taka', code: 'BDT'),
  bmd(symbol: '\$', name: 'Bermudian Dollar', code: 'BMD'),
  bnd(symbol: 'BN\$', name: 'Brunei Dollar', code: 'BND'),
  bob(symbol: 'Bs', name: 'Bolivian Boliviano', code: 'BOB'),
  bsd(symbol: 'B\$', name: 'Bahamian Dollar', code: 'BSD'),
  bwp(symbol: 'PKRs', name: 'Botswana Pula', code: 'BWP'),
  bzd(symbol: 'BZ\$', name: 'Belize Dollar', code: 'BZD'),
  chf(symbol: 'CHF', name: 'Swiss Franc', code: 'CHF'),
  cop(symbol: 'CO\$', name: 'Colombian Peso', code: 'COP'),
  crc(symbol: '₡', name: 'Costa Rican Colon', code: 'CRC'),
  cup(symbol: '\$', name: 'Cuban Peso', code: 'CUP'),
  czk(symbol: 'Kč', name: 'Czech Koruna', code: 'CZK'),
  dkk(symbol: 'Dkr', name: 'Danish Krone', code: 'DKK'),
  dop(symbol: 'RD\$', name: 'Dominican Peso', code: 'DOP'),
  dzd(symbol: 'DA', name: 'Algerian Dinar', code: 'DZD'),
  egp(symbol: 'EGP', name: 'Egyptian Pound', code: 'EGP'),
  etb(symbol: 'Br', name: 'Ethiopian Birr', code: 'ETB'),
  fjd(symbol: 'FJ\$', name: 'Fijian Dollar', code: 'FJD'),
  gip(symbol: '£', name: 'Gibraltar Pound', code: 'GIP'),
  gmd(symbol: 'D', name: 'Gambian Dalasi', code: 'GMD'),
  gtq(symbol: 'GTQ', name: 'Guatemalan Quetzal', code: 'GTQ'),
  gyd(symbol: 'G\$', name: 'Guyanese Dollar', code: 'GYD'),
  hkd(symbol: 'HK\$', name: 'Hong Kong Dollar', code: 'HKD'),
  hnl(symbol: 'HNL', name: 'Honduran Lempira', code: 'HNL'),
  hrk(symbol: 'kn', name: 'Croatian Kuna', code: 'HRK'),
  htg(symbol: 'G', name: 'Haitian Gourde', code: 'HTG'),
  huf(symbol: 'Ft', name: 'Hungarian Forint', code: 'HUF'),
  idr(symbol: 'Rp', name: 'Indonesian Rupiah', code: 'IDR'),
  ils(symbol: '₪', name: 'Israeli New Shekel', code: 'ILS'),
  inr(symbol: '₹', name: 'Indian Rupee', code: 'INR'),
  jmd(symbol: 'J\$', name: 'Jamaican Dollar', code: 'JMD'),
  kes(symbol: 'Ksh', name: 'Kenyan Shilling', code: 'KES'),
  kgs(symbol: 'Лв', name: 'Kyrgyzstani Som', code: 'KGS'),
  khr(symbol: 'KHR', name: 'Cambodian Riel', code: 'KHR'),
  kyd(symbol: '\$', name: 'Cayman Islands Dollar', code: 'KYD'),
  kzt(symbol: 'KZT', name: 'Kazakhstani Tenge', code: 'KZT'),
  lak(symbol: '₭', name: 'Lao Kip', code: 'LAK'),
  lbp(symbol: 'LB£', name: 'Lebanese Pound', code: 'LBP'),
  lkr(symbol: 'SLRs', name: 'Sri Lankan Rupee', code: 'LKR'),
  lrd(symbol: 'L\$', name: 'Liberian Dollar', code: 'LRD'),
  lsl(symbol: 'L', name: 'Lesotho Loti', code: 'LSL'),
  mad(symbol: 'MAD', name: 'Moroccan Dirham', code: 'MAD'),
  mdl(symbol: 'MDL', name: 'Moldovan Leu', code: 'MDL'),
  mkd(symbol: 'MKD', name: 'Macedonian Denar', code: 'MKD'),
  mmk(symbol: 'K', name: 'Myanmar Kyat', code: 'MMK'),
  mnt(symbol: '₮', name: 'Mongolian Tugrik', code: 'MNT'),
  mop(symbol: 'MOP\$', name: 'Macanese Pataca', code: 'MOP'),
  mur(symbol: 'MURs', name: 'Mauritian Rupee', code: 'MUR'),
  mvr(symbol: 'Rf', name: 'Maldivian Rufiyaa', code: 'MVR'),
  mwk(symbol: 'MK', name: 'Malawian Kwacha', code: 'MWK'),
  myr(symbol: 'RM', name: 'Malaysian Ringgit', code: 'MYR'),
  nad(symbol: 'N\$', name: 'Namibian Dollar', code: 'NAD'),
  ngn(symbol: '₦', name: 'Nigerian Naira', code: 'NGN'),
  nio(symbol: 'C\$', name: 'Nicaraguan Cordoba', code: 'NIO'),
  nok(symbol: 'Nkr', name: 'Norwegian Krone', code: 'NOK'),
  npr(symbol: 'NPRs', name: 'Nepalese Rupee', code: 'NPR'),
  pen(symbol: 'S/', name: 'Peruvian Sol', code: 'PEN'),
  pgk(symbol: 'K', name: 'Papua New Guinean Kina', code: 'PGK'),
  php(symbol: '₱', name: 'Philippine Peso', code: 'PHP'),
  pkr(symbol: 'PKRs', name: 'Pakistani Rupee', code: 'PKR'),
  qar(symbol: 'ر.ق', name: 'Qatari Riyal', code: 'QAR'),
  sar(symbol: 'SR', name: 'Saudi Arabian Riyal', code: 'SAR'),
  scr(symbol: 'SRe', name: 'Seychellois Rupee', code: 'SCR'),
  sll(symbol: 'Le', name: 'Sierra Leonean Leone', code: 'SLL'),
  sos(symbol: 'Ssh', name: 'Somali Shilling', code: 'SOS'),
  ssp(symbol: '£', name: 'South Sudanese Pound', code: 'SSP'),
  svc(symbol: '₡', name: 'Salvadoran Colón', code: 'SVC'),
  szl(symbol: 'L', name: 'Swazi Lilangeni', code: 'SZL'),
  thb(symbol: '฿', name: 'Thai Baht', code: 'THB'),
  ttd(symbol: 'TT\$', name: 'Trinidad and Tobago Dollar', code: 'TTD'),
  tzs(symbol: 'TSh', name: 'Tanzanian Shilling', code: 'TZS'),
  uyu(symbol: '\$U', name: 'Uruguayan Peso', code: 'UYU'),
  uzs(symbol: 'so\'m', name: 'Uzbekistani Som', code: 'UZS'),
  yer(symbol: 'YR', name: 'Yemeni Rial', code: 'YER'),
  zar(symbol: 'R', name: 'South African Rand', code: 'ZAR'),
  ghs(symbol: 'GH₵', name: 'Ghanaian Cedi', code: 'GHS');

  /// The symbol representing the currency (e.g., '₹' for INR).
  final String symbol;

  /// The full name of the currency (e.g., 'Indian Rupee' for INR).
  final String name;

  /// The ISO 4217 currency code (e.g., 'INR' for Indian Rupee).
  final String code;

  const CurrencyCode({
    required this.symbol,
    required this.name,
    required this.code,
  });



  /// Retrieves a [CurrencyCode] enum value from a given currency code string.
  /// Returns null if no matching currency code is found.
  static CurrencyCode? fromCode(String code) {
    return CurrencyCode.values.firstWhere(
      (currency) => currency.code == code.toUpperCase(),
      orElse: () => CurrencyCode.inr, // Default to INR if not found
    );
  }
}