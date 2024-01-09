// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.
class Category {
  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  Category({
    required this.title,
    required this.lessonCount,
    required this.money,
    required this.rating,
    required this.imagePath,
  });
}

List<Category> categoryList = <Category>[
  Category(
    title: "Flutter",
    lessonCount: 12,
    money: 0,
    rating: 4.6,
    imagePath: "assets/images/flutter_icon.png",
  ),
  Category(
    title: "Java",
    lessonCount: 24,
    money: 0,
    rating: 4.3,
    imagePath: "assets/images/java_icon.png",
  ),
  Category(
    title: "Dart",
    lessonCount: 18,
    money: 0,
    rating: 3.9,
    imagePath: "assets/images/dart_icon.png",
  ),
  Category(
    title: "C#",
    lessonCount: 36,
    money: 0,
    rating: 4.8,
    imagePath: "assets/images/c#_icon.png",
  ),
  Category(
    title: "React",
    lessonCount: 19,
    money: 0,
    rating: 4.1,
    imagePath: "assets/images/react_icon.png",
  ),
  Category(
    title: "AI",
    lessonCount: 23,
    money: 0,
    rating: 4.3,
    imagePath: "assets/images/ai_icon.png",
  ),
  Category(
    title: "JS",
    lessonCount: 19,
    money: 0,
    rating: 4.1,
    imagePath: "assets/images/js_icon.png",
  ),
  Category(
    title: "Angular",
    lessonCount: 19,
    money: 0,
    rating: 4.1,
    imagePath: "assets/images/angular_icon.png",
  ),
  Category(
    title: "Vue",
    lessonCount: 19,
    money: 0,
    rating: 4.1,
    imagePath: "assets/images/vue_icon.png",
  ),
  Category(
    title: "Liderlik",
    lessonCount: 7,
    money: 0,
    rating: 4.7,
    imagePath: "assets/images/leader_icon.png",
  ),
  Category(
    title: "Yönetim",
    lessonCount: 4,
    money: 0,
    rating: 4.1,
    imagePath: "assets/images/tobeto-logo.png",
  ),
  Category(
    title: "Girişim",
    lessonCount: 4,
    money: 0,
    rating: 4.5,
    imagePath: "assets/images/tobeto-logo.png",
  ),
];
