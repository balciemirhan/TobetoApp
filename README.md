<p align = "center" ><img width="500" alt="login page"  src=  "https://github.com/balciemirhan/TobetoApp/assets/120199233/8630ff60-e72a-49df-bab0-ef3127ba3dd8" class="right" > <p>



---


Tobeto Eğitim Platformu, bilgiye erişimi kolaylaştırarak, öğrenmeyi her an her yerde mümkün kılmaya devam ediyor. Şimdi, bu misyonu bir adım daha ileri taşıyoruz! Tobeto Eğitim Platformu'nun mobil uygulaması, öğrencilere eğitim içeriklerini cebinde taşıma imkanı sunuyor.


-----

## Giriş
[![Build Status](https://img.shields.io/travis/gitpoint/git-point.svg?style=flat-square)](https://travis-ci.org/gitpoint/git-point)
[![Coveralls](https://img.shields.io/coveralls/github/gitpoint/git-point.svg?style=flat-square)](https://coveralls.io/github/gitpoint/git-point)
[![All Contributors](https://img.shields.io/badge/all_contributors-73-orange.svg?style=flat-square)](./CONTRIBUTORS.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square)](http://commitizen.github.io/cz-cli/)
[![Gitter chat](https://img.shields.io/badge/chat-on_gitter-008080.svg?style=flat-square)](https://gitter.im/git-point)

### Hızlı Erişim Menüsü


- [Giriş](#giriş)
- [UI Gösterimi](#ui-gösterimi)
- [Kısa Bir Bakış](#kısa-bir-bakış)
- [Kullanılan Teknolojiler](#kullanılan-teknolojiler)
- [Özellikler](#özellikler)
- [Bloc Pattern Klasörleme Yapısı](#bloc-pattern-klasörleme-yapısı)
- [Kütüphaneler](#kütüphaneler)
- [Katkıda Bulunanlar](#katkıda-bulunanlar)
- [Geri Bildirim](#geri-bildirim)



## UI Gösterimi

<img width="500" alt="login page" src=  "https://github.com/balciemirhan/TobetoApp/assets/103212238/0d92da95-5fee-4b47-9638-fdcc7e811f2c"><br/>

<img width="500" alt="login page" src=  "https://github.com/balciemirhan/TobetoApp/assets/103212238/4fee4ccb-0c1b-4988-8ba6-839d628cdd1b"><br/><br/>


<img width="500" alt="login page" src=  "https://github.com/balciemirhan/TobetoApp/assets/103212238/1d5f66ca-ec32-40ab-ae54-4bd9be98055a"><br/>

<img width="500" alt="login page" src=  "https://github.com/balciemirhan/TobetoApp/assets/103212238/82c2cd88-87f7-496b-8d06-aa8b35a46886"><br/>




## Kısa Bir Bakış
Tobeto Mobil Uygulaması, Tobeto Eğitim Platformu'nun mobil versiyonudur. Kullanıcıların yüksek kaliteli ve etkileşimli bir deneyimle eğitim içeriklerine ve Tobeto'nun diğer özelliklerine anında erişim sağlar.
## Backers [![Backers on Open Collective](https://opencollective.com/git-point/backers/badge.svg)](#backers)


![Animation_-_1709242147458](https://github.com/balciemirhan/TobetoApp/assets/120199233/908756cc-0d52-402e-b146-7a119cf0fdb6)![Animation_-_1709294655620](https://github.com/mehtapaygun/TobetoApp/assets/103212238/4c4f3281-3041-415f-930c-66fc152a4c76)


## Kullanılan Teknolojiler
### Bloc Pattern
Flutter'da BLoC (Business Logic Component) deseni kullanarak veri yönetimi sağladım. Bu desen, uygulamanın iş mantığını, kullanıcı arayüzünden ve dış dünyadan ayrı olarak yönetmeme olanak tanır. BLoC, verileri akışlar halinde yönetir, bu da uygulamanın durumunu güncellemek ve verilerle etkileşimde bulunmak için etkili bir yol sağlar. Bu sayede, uygulama daha düzenli, ölçeklenebilir ve bakımı daha kolay hale gelir. BLoC desenini kullanarak, uygulamanın farklı bileşenleri arasında veri akışını sağlamak ve kullanıcı etkileşimlerine yanıt vermek için bir aracı olarak kullanıyorum.
### Firebase
Firebase'i kullanarak uygulamada kullanıcı girişi ve hesap oluşturmayı Authentication (Kimlik Doğrulama) servisiyle yönetiyorum. Bu servis, kullanıcıların e-posta/şifre, telefon numarası, Google, Facebook gibi çeşitli kimlik doğrulama yöntemleriyle uygulamaya giriş yapmasını sağlar. Ayrıca, yeni kullanıcı hesapları oluşturmak için de bu servisi kullanıyorum.

Verileri saklamak ve senkronize etmek için Firestore veritabanını kullanıyorum. Firestore, bulut tabanlı, NoSQL veritabanıdır ve gerçek zamanlı veri senkronizasyonunu destekler. Bu, uygulama kullanıcıları arasında anlık güncellemeler sağlar ve çevrimdışı kullanım için veri senkronizasyonunu kolaylaştırır.

Firebase Storage, uygulamada kullanılan resimler gibi medya dosyalarını depolamak için kullanılan bir servistir. Bu servis, resimleri yüklemek, saklamak ve indirmek için kullanılır. Firebase Storage, yüksek performanslı, güvenli ve ölçeklenebilir bir şekilde medya dosyalarını yönetmeme olanak sağlar. Bu da uygulama içindeki resimlerin güvenli bir şekilde depolanmasını ve kullanıcıların ihtiyaç duyduğunda erişebilmesini sağlar.



## Özellikler
-  Dark mode özelliği ile göz yormayan tasarım
-  Kolay profil yönetimi
-  Duyuru ve anketlerden haberdar olmak
-  Eğitimleri inceleme ve katılma
-  Not sistemi
-  Video izleme sistemi
-  Takvim sistemi
-  Quiz sistemi


## Klasörleme Yapısı
### Sayfa Yapısı
![2024-03-01-removebg-preview](https://github.com/mehtapaygun/TobetoApp/assets/103212238/06cd42a8-f778-41df-942b-482e0cd87139)


### Bloc Pattern 
![Ekran Alıntısı](https://github.com/balciemirhan/TobetoApp/assets/120199233/e3abd3d7-2f0e-4b26-983a-5fad79fd5b20)


## Kütüphaneler
* cupertino_icons: ^1.0.2
* lottie: ^2.7.0
* google_fonts: ^6.1.0
* flutter_advanced_drawer: ^1.3.5
* intro_screen_onboarding_flutter: ^1.0.0
* concentric_transition: ^1.0.3
* curved_navigation_bar: ^1.0.3
* firebase_core: ^2.24.2
* firebase_auth: ^4.16.0
* google_sign_in: ^6.2.1
* flutter_bloc: ^8.1.3
*  cloud_firestore: ^4.15.3
*  intl: ^0.19.0
*  firebase_storage: ^11.6.5
*  image_picker: ^1.0.7
*  video_player: ^2.8.2
*  visibility_detector: ^0.4.0+2
*  flick_video_player: ^0.7.0
*  flutter_neat_and_clean_calendar: ^0.3.16+36
*  file_picker: ^5.2.10
*  font_awesome_flutter: ^10.7.0
*  carousel_slider: ^4.2.1
*  url_launcher: ^6.2.5
*  carousel_indicator: ^1.0.6
*  open_file: ^3.3.2
*  shared_preferences: ^2.2.2


## Katkıda Bulunanlar
![Linkdein__1_-removebg-preview](https://github.com/balciemirhan/TobetoApp/assets/120199233/c4487d89-55ea-4743-8531-1dffed543ee6)

* [Emirhan Balcı](https://github.com/balciemirhan)

* [Mehtap Aygün](https://github.com/mehtapaygun)
  
* [Fatma Nur Kamış](https://github.com/fatma1604)

# Geri Bildirim
Uygulamamızın gelişimini desteklemek ve karşılaştığınız sorunların çözümü için bizimle iletişime geçebilirsiniz.

