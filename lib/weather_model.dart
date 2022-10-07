class RichMorty {
  Map<String,dynamic> info;
 List<dynamic> results;

  RichMorty(this.info,this.results);

  RichMorty.fromJson(Map<String, dynamic> json)
      : info = json['info'],
        results = json['results'];

  Map<String, dynamic> toJson() => {
        'info': info,
        'results': results,
      };
}