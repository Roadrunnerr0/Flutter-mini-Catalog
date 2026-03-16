## Mini Katalog Uygulaması

Bu repo, Flutter günlük eğitiminde verilen **“Mini Katalog Uygulaması”** yönergesini takip ederek hazırlanmış küçük bir örnek uygulamadır.
Temel amaç; ürünleri listelemek, aramak/filtrelemek ve bir ürün detayına gidip basit bir “sepete ekleme” akışını göstermek.

### Proje Hakkında

- Uygulama açıldığında **ana sayfada** ürün listesini görürsünüz; üst tarafta **arama** alanı ve **kategori filtreleri** bulunur.
- Bir ürüne dokununca **ürün detay ekranına** geçilir; burada ürünün görseli, adı, fiyatı ve açıklaması yer alır.
- Detay ekranındaki **“Sepete Ekle”** butonuna bastığınızda, app bar’daki sepet sayısı artar. Bu kısım, basit bir **state güncelleme** örneğidir.
- Ürün verileri dışarıdan servis yerine, örnek olması için **JSON** üzerinden gelir: `assets/products.json`.

### Klasör Yapısı (Özet)

- `lib/main.dart` – Uygulama girişi, `MaterialApp`, route tanımları
- `lib/models/product.dart` – Ürün veri modeli
- `lib/data/product_repository.dart` – JSON’dan ürünleri okuyan repository
- `lib/data/cart_state.dart` – Basit `ValueNotifier` tabanlı sepet state’i
- `lib/screens/home_screen.dart` – Ürün listesinin ve arama/filtre alanlarının olduğu ana ekran
- `lib/screens/product_detail_screen.dart` – Ürün detayları ve “Sepete Ekle” butonu

### Kurulum ve Çalıştırma

1. Flutter SDK kurulu olduğundan emin olun.
2. Proje klasöründe terminal açın:

```bash
flutter pub get
flutter run
```

### Eğitim Kapsamı ile Uyum

- Stateless / Stateful widget örnekleri
- Sayfalar arası geçiş ve **Navigator** kullanımı
- **Named Route + Route Arguments** ile detay ekranına veri gönderme
- JSON’dan veri okuma ve listeleme
- Basit arama ve filtreleme mantığı
- Basit state güncelleme (sepet sayacı simülasyonu)

