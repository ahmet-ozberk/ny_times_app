class NyTimesModelResultsMediaMediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  NyTimesModelResultsMediaMediaMetadata({
    this.url,
    this.format,
    this.height,
    this.width,
  });
  NyTimesModelResultsMediaMediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    format = json['format']?.toString();
    height = json['height']?.toInt();
    width = json['width']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['format'] = format;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

class NyTimesModelResultsMedia {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<NyTimesModelResultsMediaMediaMetadata?>? mediaMetadata;

  NyTimesModelResultsMedia({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });
  NyTimesModelResultsMedia.fromJson(Map<String, dynamic> json) {
    type = json['type']?.toString();
    subtype = json['subtype']?.toString();
    caption = json['caption']?.toString();
    copyright = json['copyright']?.toString();
    approvedForSyndication = json['approved_for_syndication']?.toInt();
    if (json['media-metadata'] != null) {
      final v = json['media-metadata'];
      final arr0 = <NyTimesModelResultsMediaMediaMetadata>[];
      v.forEach((v) {
        arr0.add(NyTimesModelResultsMediaMediaMetadata.fromJson(v));
      });
      mediaMetadata = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['copyright'] = copyright;
    data['approved_for_syndication'] = approvedForSyndication;
    if (mediaMetadata != null) {
      final v = mediaMetadata;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['media-metadata'] = arr0;
    }
    return data;
  }
}

class NyTimesModelResults {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  String? publishedDate;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  String? column;
  String? byline;
  String? type;
  String? title;
  String? theAbstract;
  List<String?>? desFacet;
  List<String?>? orgFacet;

  List<NyTimesModelResultsMedia?>? media;
  int? etaId;

  NyTimesModelResults({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.theAbstract,
    this.desFacet,
    this.orgFacet,
    this.media,
    this.etaId,
  });
  NyTimesModelResults.fromJson(Map<String, dynamic> json) {
    uri = json['uri']?.toString();
    url = json['url']?.toString();
    id = json['id']?.toInt();
    assetId = json['asset_id']?.toInt();
    source = json['source']?.toString();
    publishedDate = json['published_date']?.toString();
    updated = json['updated']?.toString();
    section = json['section']?.toString();
    subsection = json['subsection']?.toString();
    nytdsection = json['nytdsection']?.toString();
    adxKeywords = json['adx_keywords']?.toString();
    column = json['column']?.toString();
    byline = json['byline']?.toString();
    type = json['type']?.toString();
    title = json['title']?.toString();
    theAbstract = json['abstract']?.toString();
    if (json['des_facet'] != null) {
      final v = json['des_facet'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      desFacet = arr0;
    }
    if (json['org_facet'] != null) {
      final v = json['org_facet'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      orgFacet = arr0;
    }
    if (json['media'] != null) {
      final v = json['media'];
      final arr0 = <NyTimesModelResultsMedia>[];
      v.forEach((v) {
        arr0.add(NyTimesModelResultsMedia.fromJson(v));
      });
      media = arr0;
    }
    etaId = json['eta_id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uri'] = uri;
    data['url'] = url;
    data['id'] = id;
    data['asset_id'] = assetId;
    data['source'] = source;
    data['published_date'] = publishedDate;
    data['updated'] = updated;
    data['section'] = section;
    data['subsection'] = subsection;
    data['nytdsection'] = nytdsection;
    data['adx_keywords'] = adxKeywords;
    data['column'] = column;
    data['byline'] = byline;
    data['type'] = type;
    data['title'] = title;
    data['abstract'] = theAbstract;
    if (desFacet != null) {
      final v = desFacet;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['des_facet'] = arr0;
    }
    if (orgFacet != null) {
      final v = orgFacet;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['org_facet'] = arr0;
    }
    if (media != null) {
      final v = media;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['media'] = arr0;
    }
    data['eta_id'] = etaId;
    return data;
  }
}

class NyTimesModel {
  String? status;
  String? copyright;
  int? numResults;
  List<NyTimesModelResults?>? results;

  NyTimesModel({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });
  NyTimesModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    copyright = json['copyright']?.toString();
    numResults = json['num_results']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <NyTimesModelResults>[];
      v.forEach((v) {
        arr0.add(NyTimesModelResults.fromJson(v));
      });
      results = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['num_results'] = numResults;
    if (results != null) {
      final v = results;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['results'] = arr0;
    }
    return data;
  }
}
