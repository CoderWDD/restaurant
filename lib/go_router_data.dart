
class GoRouterData {
  Map<String, dynamic> query;
  Map<String, dynamic> params;
  String location;
  String state;

  GoRouterData({
    this.query = const {},
    this.params = const {},
    this.location = '',
    this.state = '',
  });

  GoRouterData copyWith({
    Map<String, dynamic>? query,
    Map<String, dynamic>? params,
    String? location,
    String? state,
  }) {
    return GoRouterData(
      query: query ?? this.query,
      params: params ?? this.params,
      location: location ?? this.location,
      state: state ?? this.state,
    );
  }

  bool get hasQuery => query.isNotEmpty;
  bool get hasParams => params.isNotEmpty;
  bool get hasState => state.isNotEmpty;
}