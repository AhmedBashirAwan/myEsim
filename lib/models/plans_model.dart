class PlanTypesResponse {
  int result;
  int status;
  String message;
  List<PlanType> planTypes;
  String requestId;
  String developerMessage;

  PlanTypesResponse({
    required this.result,
    required this.status,
    required this.message,
    required this.planTypes,
    required this.requestId,
    required this.developerMessage,
  });

  factory PlanTypesResponse.fromJson(Map<String, dynamic> json) {
    return PlanTypesResponse(
      result: json['result'],
      status: json['status'],
      message: json['message'],
      planTypes: (json['plan_types'] as List)
          .map((item) => PlanType.fromJson(item))
          .toList(),
      requestId: json['request_id'],
      developerMessage: json['developer_message'],
    );
  }
}

class PlanType {
  String uid;
  String name;
  int policyId;
  String policyName;
  int dataQuotaMb;
  int validityDays;
  int dataQuotaBytes;
  List<String> countriesEnabled;

  PlanType({
    required this.uid,
    required this.name,
    required this.policyId,
    required this.policyName,
    required this.dataQuotaMb,
    required this.validityDays,
    required this.dataQuotaBytes,
    required this.countriesEnabled,
  });

  factory PlanType.fromJson(Map<String, dynamic> json) {
    return PlanType(
      uid: json['uid'],
      name: json['name'],
      policyId: json['policy_id'],
      policyName: json['policy_name'],
      dataQuotaMb: json['data_quota_mb'],
      validityDays: json['validity_days'],
      dataQuotaBytes: json['data_quota_bytes'],
      countriesEnabled: List<String>.from(json['countries_enabled']),
    );
  }
}
