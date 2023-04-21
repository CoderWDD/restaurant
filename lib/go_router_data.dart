
class GoRouterData {
  final Map<String, String> query;
  final Map<String, String> params;
  final String location;
  final String state;

  const GoRouterData({
    this.query = const {},
    this.params = const {},
    this.location = '',
    this.state = '',
  });

  GoRouterData copyWith({
    Map<String, String>? query,
    Map<String, String>? params,
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