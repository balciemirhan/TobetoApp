class Application {
  String title;
  String subtitle;
  String subtitle1;
  String state;

  Application({
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'state': state,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      title: map['title'],
      subtitle: map['subtitle'],
      subtitle1: map['subtitle1'],
      state: map['state'],
    );
  }
}