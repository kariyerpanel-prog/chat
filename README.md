# SesliSevda Android

Hazır Android kaynak proje. Bu sürüm, mevcut mobil web sistemini güçlü bir Android kabuk içinde çalıştırır.

## İçindekiler
- Splash ekranı
- WebView tabanlı ana kabuk
- Mikrofon / kamera izin akışı
- Dosya seçici
- Pull to refresh
- Harici link açma
- Bağlantı dönünce otomatik toparlama denemesi
- GitHub Actions ile debug APK üretimi
- İmzalı release AAB/APK için hazır workflow

## En hızlı test yolu
1. Bu projeyi GitHub repo olarak yükle.
2. `Actions` sekmesinden **Android Debug APK** workflow'unu çalıştır.
3. Çıkan `seslisevda-debug-apk` artifact'ini indir.
4. Telefona kur.

## Mağaza için imzalı sürüm
Repo Secrets içine bunları ekle:
- `ANDROID_KEYSTORE_BASE64`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

Sonra `Android Release Signed` workflow'unu çalıştır.
Çıktı olarak:
- signed release APK
- signed release AAB

## Değiştirmen gereken tek yer
`app/build.gradle.kts` içinde:
- `appBaseUrl`
- `trustedHosts`
- istersen `applicationId`
- istersen `versionCode` / `versionName`

## Android Studio ile açmak istersen
- Projeyi aç
- Gradle senkronize olsun
- `Run` de

## Not
- `gradlew` ve `gradlew.bat` ilk çalışmada resmi Gradle wrapper jar dosyasını indirir.
- Bu proje `https://seslisevda.com/mobil/giris.php` adresine hazır gelir.
