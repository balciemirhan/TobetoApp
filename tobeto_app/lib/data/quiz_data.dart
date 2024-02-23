import 'package:tobeto_app/models/quiz_model.dart';

List<Quiz> questions = [
  Quiz(
      question: 'Flutter ın temel mimarisi nedir?',
      answers: [
        'Widget Tree',
        'State Tree',
        'Component Tree',
        'Render Tree',
      ],
      correctAnswerIndex: 0),
  Quiz(
    question:
        'Flutter\'da UI oluşturmak için kullanılan temel yapı taşı nedir?',
    answers: [
      'Widget',
      'Component',
      'Element',
      'RenderObject',
    ],
    correctAnswerIndex: 0,
  ),
  Quiz(
      question: 'Flutterda widget nedir?',
      answers: [
        'Yatay bir çizgi',
        'Kullanıcı arayüz elemanı',
        'Matematiksel bir işlev',
        'Çizgi grafik,'
      ],
      correctAnswerIndex: 1),
  Quiz(
      question: 'Flutterda hot reload özelliği ne işe yarar?',
      answers: [
        'Uygulamayı soğuk başlatır',
        'Kodu anında derler günceller',
        'Uygulama ekranını yeniden başlatır',
        'Hata ayıklama modunu başlatır',
      ],
      correctAnswerIndex: 1),
  Quiz(
      question:
          'Flutter da hangi sınıf, uygulama içinde sayfalar arası geçişleri sağlar?',
      answers: [
        'NavigationService',
        'PageController',
        'RouteManager',
        'Navigator',
      ],
      correctAnswerIndex: 3),
  Quiz(
      question: 'Flutter\'da state yönetimi nasıl yapılır? ',
      answers: [
        'Provider kullanarak ',
        'Redux ile',
        'SetState metodu ile',
        'SharedPreferences kullanarak ',
      ],
      correctAnswerIndex: 2),
  Quiz(
      question: 'Flutter da "BuildContext" nedir ve neden önemlidir?',
      answers: [
        ' Widgetların birbiriyle iletişimi.',
        ' Widgetların hiyerarşisini temsil eder.',
        ' Widgetların konumlarını belirler.',
        ' Widgetların tema bilglerini gösterir',
      ],
      correctAnswerIndex: 2),
  Quiz(
      question:
          'Flutter\'da konum bilgileri almak için kullanılan temel sınıf nedir?',
      answers: [
        'Geolocator',
        'Location',
        'GPS',
        'Maps',
      ],
      correctAnswerIndex: 0),
];
