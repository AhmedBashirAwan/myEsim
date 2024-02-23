class SimPlans {
  final String id;
  final List<String> countriesEnabled;
  final int dataQuotaBytes;
  final int dataBytesRemaining;
  final String startTime;
  final String dateActivated;
  final String endTime;
  final String networkStatus;

  SimPlans({
    required this.id,
    required this.countriesEnabled,
    required this.dataQuotaBytes,
    required this.dataBytesRemaining,
    required this.startTime,
    required this.dateActivated,
    required this.endTime,
    required this.networkStatus,
  });

  factory SimPlans.fromJson(Map<String, dynamic> json) {
    return SimPlans(
      id: json['id'],
      countriesEnabled: List<String>.from(json['countries_enabled']),
      dataQuotaBytes: json['data_quota_bytes'],
      dataBytesRemaining: json['data_bytes_remaining'],
      startTime: json['start_time'],
      dateActivated: json['date_activated'],
      endTime: json['end_time'],
      networkStatus: json['network_status'],
    );
  }
}
