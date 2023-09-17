class TodoTileModel {
  String? title;
  String? subtitle;
  bool? onComplete;

  TodoTileModel({
    this.title,
    this.subtitle,
    this.onComplete,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['onComplete'] = onComplete;
    return data;
  }
}
