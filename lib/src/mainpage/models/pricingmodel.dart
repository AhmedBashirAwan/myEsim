class PricingResponse {
  int result;
  int status;
  String requestId;
  String message;
  String developerMessage;
  List<PricingRegion> pricing;

  PricingResponse({
    required this.result,
    required this.status,
    required this.requestId,
    required this.message,
    required this.developerMessage,
    required this.pricing,
  });
  factory PricingResponse.fromJson(Map<String, dynamic> json) {
    return PricingResponse(
      result: json['result'],
      status: json['status'],
      requestId: json['request_id'],
      message: json['message'],
      developerMessage: json['developer_message'],
      pricing: (json['pricing'] as List)
          .map((item) => PricingRegion.fromJson(item))
          .toList(),
    );
  }
}

class PricingRegion {
  String regionIso2;
  String regionIso3;
  String regionName;
  String dataMbUsd;

  PricingRegion({
    required this.regionIso2,
    required this.regionIso3,
    required this.regionName,
    required this.dataMbUsd,
  });

  factory PricingRegion.fromJson(Map<String, dynamic> json) {
    return PricingRegion(
      regionIso2: json['region_iso2'],
      regionIso3: json['region_iso3'],
      regionName: json['region_name'],
      dataMbUsd: json['data_mb_usd'],
    );
  }
}