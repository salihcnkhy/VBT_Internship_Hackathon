class WordList {
  String id;
  List<Word> words;

  WordList({this.id, this.words});

  WordList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['Words'] != null) {
      words = new List<Word>();
      json['Words'].forEach((v) {
        words.add(new Word.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.words != null) {
      data['Words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Word {
  String word;
  List<Specifications> specifications;

  Word({this.word, this.specifications});

  Word.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['specifications'] != null) {
      specifications = new List<Specifications>();
      json['specifications'].forEach((v) {
        specifications.add(new Specifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specifications {
  String title;
  List<Usages> usages;

  Specifications({this.title, this.usages});

  Specifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['usages'] != null) {
      usages = new List<Usages>();
      json['usages'].forEach((v) {
        usages.add(new Usages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.usages != null) {
      data['usages'] = this.usages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usages {
  List<String> mean;
  String header;
  String defination;
  List<String> examples;

  Usages({this.mean, this.header, this.defination, this.examples});

  Usages.fromJson(Map<String, dynamic> json) {
    mean = json['mean'].cast<String>();
    header = json['header'];
    defination = json['defination'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mean'] = this.mean;
    data['header'] = this.header;
    data['defination'] = this.defination;
    data['examples'] = this.examples;
    return data;
  }
}
