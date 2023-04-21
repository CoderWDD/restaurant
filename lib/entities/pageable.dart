
class Pageable {
  Sort sort;
  int pageSize;
  int pageNumber;
  int offset;
  bool paged;
  bool unpaged;

  Pageable({
    required this.sort,
    required this.pageSize,
    required this.pageNumber,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: Sort.fromJson(json['sort']),
      pageSize: json['pageSize'],
      pageNumber: json['pageNumber'],
      offset: json['offset'],
      paged: json['paged'],
      unpaged: json['unpaged'],
    );
  }
}

class Sort {
  bool sorted;
  bool unsorted;
  bool empty;

  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json['sorted'],
      unsorted: json['unsorted'],
      empty: json['empty'],
    );
  }
}

class ApiResponseData<T> {
  List<T> content;
  Pageable pageable;
  int totalPages;
  int totalElements;
  bool last;
  Sort sort;
  int numberOfElements;
  bool first;
  int size;
  int number;
  bool empty;

  ApiResponseData({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.size,
    required this.number,
    required this.empty,
  });

  factory ApiResponseData.fromJson(Map<String, dynamic> json, List<T> Function(dynamic) fromJson) {
    return ApiResponseData(
      content: fromJson(json['content']),
      pageable: Pageable.fromJson(json['pageable']),
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      last: json['last'],
      sort: Sort.fromJson(json['sort']),
      numberOfElements: json['numberOfElements'],
      first: json['first'],
      size: json['size'],
      number: json['number'],
      empty: json['empty'],
    );
  }
}