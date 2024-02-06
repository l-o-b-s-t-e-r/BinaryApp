class Meta {
  int total;
  int limit;
  int offset;

  Meta({
    required this.total,
    required this.limit,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      limit: json['limit'],
      offset: json['offset'],
    );
  }
}

class JsonApi {
  String version;

  JsonApi({
    required this.version,
  });

  factory JsonApi.fromJson(Map<String, dynamic> json) {
    return JsonApi(
      version: json['version'],
    );
  }
}

class Attributes {
  String name;
  String categoryType;
  String? description;
  bool isApproved;
  String slug;

  Attributes({
    required this.name,
    required this.categoryType,
    this.description,
    required this.isApproved,
    required this.slug,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      name: json['name'],
      categoryType: json['category_type'],
      description: json['description'],
      isApproved: json['is_approved'],
      slug: json['slug'],
    );
  }
}

class Links {
  Map<String, dynamic>? self;

  Links({this.self});

  factory Links.fromJson(Map<String, dynamic>? json) {
    return Links(
      self: json?['self'],
    );
  }
}

class Included {
  String id;
  String type;
  Attributes attributes;
  Links links;

  Included({
    required this.id,
    required this.type,
    required this.attributes,
    required this.links,
  });

  factory Included.fromJson(Map<String, dynamic> json) {
    return Included(
      id: json['id'],
      type: json['type'],
      attributes: Attributes.fromJson(json['attributes']),
      links: Links.fromJson(json['links']),
    );
  }
}

class Data {
  String id;
  String type;
  Attributes attributes;
  Links links;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
    required this.links,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      type: json['type'],
      attributes: Attributes.fromJson(json['attributes']),
      links: Links.fromJson(json['links']),
    );
  }
}

class Relationships {
  Data data;

  Relationships({
    required this.data,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) {
    return Relationships(
      data: Data.fromJson(json['data']),
    );
  }
}

class Business {
  String id;
  String type;
  Attributes attributes;
  Relationships relationships;

  Business({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      type: json['type'],
      attributes: Attributes.fromJson(json['attributes']),
      relationships: Relationships.fromJson(json['relationships']),
    );
  }
}

class BusinessesBody {
  Meta meta;
  JsonApi jsonapi;
  List<Included> included;
  List<Business> data;

  BusinessesBody({
    required this.meta,
    required this.jsonapi,
    required this.included,
    required this.data,
  });

  factory BusinessesBody.fromJson(Map<String, dynamic> json) {
    List<Included> includedList = [];
    for (var item in json['included']) {
      includedList.add(Included.fromJson(item));
    }

    List<Business> dataList = [];
    for (var item in json['data']) {
      dataList.add(Business.fromJson(item));
    }

    return BusinessesBody(
      meta: Meta.fromJson(json['meta']),
      jsonapi: JsonApi.fromJson(json['jsonapi']),
      included: includedList,
      data: dataList,
    );
  }
}
