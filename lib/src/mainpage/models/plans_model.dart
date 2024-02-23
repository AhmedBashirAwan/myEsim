
class PlanResponse {
  final String id;
  final String endTime;
  final String startTime;
  final String dateActivated;
  final String networkStatus;
  final int dataQuotaBytes;
  final List<String> countriesEnabled;
  final int dataBytesRemaining;

  PlanResponse({
    required this.id,
    required this.endTime,
    required this.startTime,
    required this.dateActivated,
    required this.networkStatus,
    required this.dataQuotaBytes,
    required this.countriesEnabled,
    required this.dataBytesRemaining,
  });

  factory PlanResponse.fromJson(Map<String, dynamic> json) {
    return PlanResponse(
      id: json['id'],
      endTime: json['end_time'],
      startTime: json['start_time'],
      dateActivated: json['date_activated'],
      networkStatus: json['network_status'],
      dataQuotaBytes: json['data_quota_bytes'],
      countriesEnabled: List<String>.from(json['countries_enabled']),
      dataBytesRemaining: json['data_bytes_remaining'],
    );
  }
}
