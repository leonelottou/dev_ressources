**I** **AJOUTER** **FIREBASE**

Pour installer manuellement Firebase dans une application Flutter,
suivez ces étapes :

**1.** **Pré-requis**

> Flutter SDK installé. Un projet Flutter créé. Un compte Firebase.

**2.** **Créer** **un** **Projet** **Firebase**

> 1\. Allez sur Firebase Console.
>
> 2\. Cliquez sur "Ajouter un projet" et suivez les instructions pour
> créer un nouveau projet.

**3.** **Ajouter** **une** **Application** **au** **Projet**
**Firebase**

> 1\. **Ajouter** **une** **applicationAndroid** **:**
>
> Cliquez sur l'icôneAndroid dans la page d'accueil du projet Firebase.
>
> Entrez le nom du package de votre application (vous pouvez le trouver
> dans android/app/src/main/AndroidManifest.xml).
>
> Téléchargez le fichier google-services.json. 2. **Ajouter** **une**
> **application** **iOS** **:**
>
> Cliquez sur l'icône iOS dans la page d'accueil du projet Firebase.
>
> Entrez l'ID du bundle de votre application (vous pouvez le trouver
> dans ios/Runner.xcodeproj).
>
> Téléchargez le fichier GoogleService-Info.plist.

**4.** **Configurer** **Firebase** **dans** **Flutter** **Android**

> 1\. Placez le fichier google-services.json que vous avez téléchargé
> dans le répertoire android/app de votre projet Flutter.
>
> 2\. Ajoutez les lignes suivantes à android/build.gradle :

``` groovy
dependencies {

 classpath 'com.google.gms:google-services:4.3.10' // Ajouter cette
 ligne }

}
```




> 3\. Ajoutez les lignes suivantes à android/app/build.gradle :

```groovy
apply plugin: 'com.google.gms.google-services' // Ajouter cette ligne à la fin du fichier
```

**iOS**

> 1\. Placez le fichier GoogleService-Info.plist que vous avez
> téléchargé dans le répertoire ios/Runner de votre projet Flutter.
>
> 2\. Ouvrez votre projet iOS dans Xcode en utilisant
> ios/Runner.xcworkspace.
>
> 3\. Faites glisser et déposez le fichier GoogleService-Info.plist dans
> le projet Xcode et assurez-vous qu'il est ajouté aux cibles correctes.
>
> 4\. Dans Xcode, allez à ios/Runner/Info.plist et ajoutez la clé
> suivante :

```xml

 <key>FirebaseAppDelegateProxyEnabled</key>
<string>NO</string> 
```

**5.** **Ajouter** **les** **dépendances** **Firebase** **à**
**Flutter**

Ouvrez le fichier pubspec.yaml de votre projet Flutter et ajoutez les
dépendances Firebase nécessaires. Par exemple, pour Firebase Core et
FirebaseAuth :

```yaml
dependencies:
 flutter:
   sdk: 
 flutter firebase_core: latest_version 
 firebase_auth:latest_version 
```

(Remplacez latest_version par les dernières versions des packages
Firebase disponibles.)

Ensuite, exécutez la commande suivante pour installer les dépendances :

```bash
 flutter pub get
 ```
 

**6.** **Initialiser** **Firebase** **dans** **votre** **Application**
**Flutter**

Modifiez le fichier lib/main.dart pour initialiser Firebase. Voici un
exemple simple :

```dart
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async { WidgetsFlutterBinding.ensureInitialized(); await
Firebase.initializeApp(); runApp(MyApp());

}

class MyApp extends StatelessWidget { @override

Widget build(BuildContext context) { 
return MaterialApp(
title: 'Flutter Firebase Demo',
home: Scaffold(
appBar: AppBar(
title: Text('Flutter Firebase Demo'),
),
body: Center(
 child: Text('Firebase Initialized!'), ),

), );

} } 

```

**7.** **Exécuter** **l'application**

Lancez votre application en utilisant flutter run. Si tout est configuré
correctement, votre application devrait se connecter à Firebase sans
problèmes.

Et voilà! Vous avez maintenant configuré Firebase dans votre application
Flutter manuellement.

> **II** **Générer** **une** **Clé** **de** **Signature**

**Ouvrez** **un** **terminal** **ou** **une** **ligne** **de**
**commande.**

> 1\. Exécutez la commande suivante pour générer une nouvelle clé de
> signature :

```bash

keytool -genkey -v -keystore ~/chemin/vers/votre/keystore.jks -keyalg
RSA -keysize 2048 -validity 10000 -alias votre-alias  
``` 



Remplacez ~/chemin/vers/votre/keystore.jks par le chemin où vous
souhaitez sauvegarder le fichier de keystore et votre-alias par un alias
de votre choix.

Pendant l'exécution de cette commande, il vous sera demandé de fournir
un mot de passe et quelques informations.

**2.** **Ajouter** **le** **Keystore** **à** **votre** **Projet**
**Flutter**

> 1\. Placez le fichier keystore.jks généré dans le répertoire
> android/app de votre projet Flutter.

**3.** **Configurer** **Gradle** **pour** **Utiliser** **le**
**Keystore**

> 1\. Ouvrez le fichier android/app/build.gradle et ajoutez les lignes
> suivantes dans la section android :

```groovy

 android {

 signingConfigs {
release {
keyAlias keystoreProperties\['keyAlias'\] keyPassword
keystoreProperties\['keyPassword'\] storeFile
file(keystoreProperties\['storeFile'\]) storePassword
 keystoreProperties\['storePassword'\]

 } }

buildTypes { 
release {
 signingConfig signingConfigs.release minifyEnabled false
 shrinkResources false
 proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'),
'proguard-rules.pro'

} }

} 
```


> 2\. Créez un fichier key.properties dans le répertoire android avec le
> contenu suivant :

```
storeFile=../app/keystore.jks storePassword=votre-store-password
keyAlias=votre-alias keyPassword=votre-key-password
```

Remplacez votre-store-password, votre-alias, et votre-key-password par
les valeurs que vous avez définies lors de la génération de la clé.

> 3\. Modifiez le fichier android/app/build.gradle pour inclure le
> fichier key.properties : juste au dessus du block android

``` 
def keystorePropertiesFile = rootProject.file("key.properties") def
keystoreProperties = new Properties() keystoreProperties.load(new
FileInputStream(keystorePropertiesFile))

android { 
```

**4.** **Construire** **l'APK** **Signé**

> 1\. Pour générer un APK signé, exécutez la commande suivante :

```bash

flutter build apk --release 
```

L'APK signé sera généré dans le répertoire
build/app/outputs/flutter-apk. 

**5.** **(Optionnel)** **Construire** **un** **Bundle**
**d'Application** **(AAB)**

> 1\. Pour générer un bundle d'application, exécutez la commande
> suivante :

 ``` bash
flutter build appbundle --release
```


Le fichier .aab sera généré dans le répertoire
build/app/outputs/bundle/release.

En suivant ces étapes, vous pouvez signer votre application Flutter avec
une clé release, ce qui est nécessaire pour publier votre application
sur le Google Play Store.

**CHANGER** **NOM** **PACKAGE**

**Oui,** **le** **package** **change_app_package_name** **peut**
**également** **être** **utilisé** **pour** **changer** **le** **nom**
**du** **package** **d'une** **application** **Flutter** **facilement.**
**Voici** **comment** **l'utiliser** **:**

**Étapes** **pour** **Utiliser** **change_app_package_name** 1.
**Ajouter** **le** **Plugin** **à** **votre** **Projet** **:**

Dans votre fichier pubspec.yaml, ajoutez change_app_package_name sous
les dépendances de développement :

```yaml
dev_dependencies:

 change_app_package_name: ^1.0.0
 ``` 

Ensuite, installez les dépendances :

```bash
 flutter pub get
 ```
 

> 2\. **Changer** **le** **Nom** **du** **Package** **:**

Utilisez la commande suivante pour changer le nom du package de votre
application. Remplacez com.new.package.name par votre nouveau nom de
package :

``` bash
flutter pub run change_app_package_name:main com.new.package.name
```


Cette commande va modifier automatiquement les fichiers nécessaires pour
refléter le nouveau nom du package dans votre projetAndroid et iOS.

**Exemple** **Complet**

Voici un exemple complet de l'utilisation du plugin
change_app_package_name :

> 1\. **Ajouter** **le** **Plugin** **:**

Ouvrez pubspec.yaml et ajoutez :

```yaml
  dev_dependencies:

   change_app_package_name: ^1.0.0
   ```
   

Exécutez la commande pour installer les dépendances :

``` bash

 flutter pub get
 ```
 

 2\. **Exécuter** **la** **Commande** **pour** **Changer** **le**
 **Nom** **du** **Package** **:**

Dans le terminal, exécutez :

```bash
flutter pub run change_app_package_name:main com.new.package.name
```

**Nettoyer** **et** **Recompiler** **le** **Projet**

Après avoir changé le nom du package, nettoyez et recompilez votre
projet :

```bash
 flutter clean
 flutter pub get 
 flutter build apk
```

**ECRAN** **DE** **DEMARRAGE**

Pour changer l'écran de démarrage (splash screen) dans une application
Flutter en utilisant un plugin, vous pouvez utiliser le plugin
**flutter_native_splash**. Ce plugin simplifie le processus de
personnalisation et de configuration de votre écran de démarrage pour
les plateformes Android et iOS. Voici comment l'utiliser :

**Utilisation** **du** **Plugin** **flutter_native_splash** 1.
**Ajouter** **le** **Plugin** **à** **votre** pubspec.yaml :

Ouvrez votre fichier pubspec.yaml et ajoutez flutter_native_splash sous
dev_dependencies :

```yaml

 dev_dependencies:
   flutter_native_splash: ^1.3.0
```

Ensuite, exécutez la commande suivante dans votre terminal pour
récupérer les dépendances :

```bash
flutter pub get
```


> 2\. **Configurer** **l'Écran** **de** **Démarrage** :

Créez un fichier flutter_native_splash.yaml à la racine de votre projet
Flutter. Ce fichier contiendra la configuration pour votre écran de
démarrage.

Voici un exemple de configuration de base :

```yaml

 flutter_native_splash:

 image: assets/images/splash.png color: "42a5f5"
 android: true ios: true
    image : Chemin de l'image de l'écran de démarrage par rapport à la
    racine du projet. 
    color : Couleur de fond de l'écran de démarrage au format hexadécimal

 (optionnel).
 android : Définir sur true pour configurer pour Android (optionnel).
 ios : Définir sur true pour configurer pour iOS (optionnel).
 ```

Ajustez le chemin de l'image (image) et les autres propriétés en
fonction des besoins de votre projet.

> 3\. **Générer** **l'Écran** **de** **Démarrage** :

Exécutez la commande suivante pour générer les écrans de démarrage
natifs en fonction de votre configuration :

```bash

flutter pub run flutter_native_splash:create
```

Cette commande générera les fichiers et configurations nécessaires pour
les plateformes Android et iOS.

> 4\. **Lancer** **VotreApplication** :

Après avoir configuré et généré l'écran de démarrage, lancez votre
application Flutter pour voir les changements.

**Personnalisation** **et** **Configuration** **Avancée**

> **Couleur** **de** **Fond** : Vous pouvez spécifier une couleur de
> fond pour l'écran de démarrage en utilisant la propriété color dans
> flutter_native_splash.yaml.
>
> **Taille** **et** **Résolution** **de** **l'Image** :Assurez-vous que
> l'image de votre écran de démarrage (splash.png dans cet exemple) a la
> bonne taille et résolution pour les différentes densités d'écran.
>
> **Configuration** **Additionnelle** : Pour plus d'options de
> configuration avancée, consultez la documentation du plugin
> flutter_native_splash sur pub.dev.

En suivant ces étapes, vous pouvez changer et personnaliser efficacement
l'écran de démarrage de votre application Flutter en utilisant le plugin
flutter_native_splash. Ce plugin automatise le processus et garantit une
cohérence sur les plateformesAndroid et iOS.

CHANGER ICONE

Pour changer l'icône de votre application Flutter à l'aide d'un plugin,
vous pouvez utiliser le package **flutter_launcher_icons**. Ce plugin
vous permet de générer et de configurer facilement les icônes
d'application pour différentes plateformes (Android et iOS). Voici
comment procéder :

**Utilisation** **du** **Plugin** **flutter_launcher_icons** 1.
**Ajouter** **le** **Plugin** **à** **votre** pubspec.yaml :

Ouvrez votre fichier pubspec.yaml et ajoutez flutter_launcher_icons sous
dev_dependencies :

```yaml
 dev_dependencies:
   flutter_launcher_icons: ^0.9.2
 ```

Ensuite, exécutez la commande suivante dans votre terminal pour
récupérer les dépendances :

```bash

 flutter pub get
 ``` 

> 2\. **Configurer** **les** **Icônes** :

Créez une section flutter_icons dans votre fichier pubspec.yaml pour
définir les chemins des fichiers d'icônes que vous souhaitez utiliser.
Voici un exemple de configuration de base :

```yaml

 flutter_icons:
  android: true 
  ios: true
  image_path: "assets/icon/app_icon.png"
```
> android : Définir sur true pour générer les icônes pour Android. ios :
> Définir sur true pour générer les icônes pour iOS.
>
> image_path : Chemin de l'icône de votre application par rapport à la
> racine du projet.

Assurez-vous que l'image que vous fournissez a une haute résolution, car
elle sera redimensionnée pour s'adapter aux différentes tailles d'icônes
requises par Android et iOS.

> 3\. **Générer** **les** **Icônes** :

Exécutez la commande suivante pour générer les icônes d'application
basées sur votre configuration :

```bash
flutter pub run flutter_launcher_icons:main
```

Cette commande générera automatiquement les icônes nécessaires et les
intégrera dans votre projet Flutter pour les deux plateformes.

> 4\. **Lancer** **VotreApplication** :

Après avoir configuré et généré les icônes d'application, lancez votre
application Flutter pour voir les nouvelles icônes en action.

**Personnalisation** **Avancée**

> **Différentes** **Images** **d'Icônes** : Vous pouvez spécifier
> différentes images pour les icônes d'Android et d'iOS en utilisant les
> propriétés image_path_android et image_path_ios dans flutter_icons.
>
> **Configuration** **Manuelle** : Pour une personnalisation avancée
> comme l'ajustement des options de redimensionnement, consultez la
> documentation du plugin flutter_launcher_icons pour plus d'options.

En suivant ces étapes simples, vous pourrez facilement changer l'icône
de votre application Flutter en utilisant le plugin
flutter_launcher_icons, ce qui vous permet de maintenir la cohérence et
la qualité des icônes sur toutes les plateformes prises en charge.

CREER UN FICHIER DE LANGUE

**Utilisation** **de** **json_localizations** **avec** **GetX** **pour**
**changer** **la** **langue** **1.** **Configuration** **initiale**
**dans** **pubspec.yaml**

Assurez-vous d'avoir ajouté les dépendances nécessaires dans votre
fichier pubspec.yaml :

```yaml

 dependencies:
   flutter:
     sdk: 
   flutter get: ^4.6.1
   flutter_localizations: sdk: flutter
   json_localizations: ^0.3.
   ```
   

Assurez-vous de récupérer les dépendances en exécutant flutter pub get.

**2.** **Ajout** **des** **fichiers** **de** **traduction** **JSON**

Créez un répertoire assets/translations à la racine de votre projet
Flutter. À l'intérieur, créez des fichiers JSON pour chaque langue que
vous souhaitez supporter. Par exemple, en.json et fr.json :

**assets/json_translations/en.json**

```json
 {
"app_title": "Flutter Multilanguage App", 
"hello": "Hello!",
"change_language": "Change Language" 
     
 }
```

**assets/json_translations/fr.json**

```json

{
 "app_title": "Application Multilingue Flutter",
 "hello": "Bonjour !",
"change_language": "Changer de langue"
}
```

**3.** **Configuration** **dans** **pubspec.yaml**

Assurez-vous que vos fichiers de traduction sont inclus dans
pubspec.yaml sous flutter \> assets :

```yaml

 flutter:
  assets:
   - assets/json_translations/
   ```
   

**4.** **Configuration** **dans** **main.dart**

Modifiez main.dart pour utiliser GetMaterialApp avec json_localizations
et updateLocale pour configurer les paramètres de localisation.

**main.dart**

```dart
import 'package:flutter/material.dart'; import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';import 'package:json_localizations/json_localizations.dart';

void main() { 
runApp(MyApp());

}

class MyApp extends StatelessWidget { 
@override
Widget build(BuildContext context) { return GetMaterialApp(
title: 'Flutter Multilangue', theme: ThemeData(
 primarySwatch: Colors.blue, ),
 // Langue par défaut locale: Locale('fr'), // Supported locales
 supportedLocales: [
const Locale('en'), const Locale('fr'),
],

// Localizations delegates localizationsDelegates: [

GlobalMaterialLocalizations.delegate,
GlobalWidgetsLocalizations.delegate,
 GlobalCupertinoLocalizations.delegate, // delegate from
 json_localizations
 JsonLocalizationsDelegate('assets/json_translations'),
],

 // Builder pour les traductions localeResolutionCallback: (locale,
supportedLocales) {

 // Vérifier si la langue est supportée

for (var supportedLocale in supportedLocales) {

if (supportedLocale.languageCode == locale.languageCode &&
 supportedLocale.countryCode == locale.countryCode) {
 return supportedLocale; }
 }

 // Si la langue n'est pas supportée, retourner la langue par défaut
return supportedLocales.first;

},

 home: HomePage(), );

} }

class HomePage extends StatelessWidget {
@override
 Widget build(BuildContext context) { return Scaffold(
 appBar: AppBar(
 title: Text('Flutter Multilangue'), ),
 body: Center(
 child: ElevatedButton( onPressed: () {

// Naviguer vers la page de réglages Get.to(SettingsPage());

 },

child: Text('Settings'), ),

 ), );

} }

class SettingsPage extends StatelessWidget { @override

 Widget build(BuildContext context) { return Scaffold(

 appBar: AppBar(

 title: Text('Language Settings'), ),

 body: Center( child: Column(

 mainAxisAlignment: MainAxisAlignment.center, children: [

 ElevatedButton( onPressed: () {

 // Changer la langue à l'anglais Get.updateLocale(Locale('en'));

 },
 child: Text('English'), ),
SizedBox(height: 20), ElevatedButton(

 onPressed: () {

Changer la langue au français Get.updateLocale(Locale('fr'));

 },
child: Text('Français'), ),
 ], ),
), );

} }

```

json_localizations

A minimal [JSON](https://en.wikipedia.org/wiki/JSON) localization
package for Flutter.

Use a JSON file/object per language to represent key/value pairs for
localizing your app.

Install

Add json_localizations and flutter_localizations as dependencies to your
pubspec.yaml. dependencies:

> flutter_localizations: sdk: flutter
>
> json_localizations:

Add a JSON file per language

Add a JSON file per language you support in an asset path and describe
it in your pubspec.yaml

flutter: assets:

> \- assets/json_translations/

The JSON file name must match exactly the combination of language and
country code described in supportedLocales.

That is Locale('en', 'US') must have a corresponding
assetPath/en-US.json file. Add JsonLocalizationsDelegate to MaterialApp

Add JsonLocalizationsDelegate to MaterialApp and set supportedLocales
using language/country codes.

```

MaterialApp(
localizationsDelegates: [

 // delegate from flutter_localization
GlobalMaterialLocalizations.delegate,
 GlobalWidgetsLocalizations.delegate,
GlobalCupertinoLocalizations.delegate, // delegate from
json_localizations

 JsonLocalizationsDelegate('assets/json_translations'), \],

 supportedLocales: \[ Locale('en'), Locale('nb'),

], }

```

Note on **iOS**

Add supported languages to ios/Runner/Info.plist as described
[here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales).

Example:

\<key\>CFBundleLocalizations\</key\> \<array\>

> \<string\>en-GB\</string\> \<string\>en\</string\>
> \<string\>nb\</string\>

\</array\>

> Format
>
> Example JSON file:



> API
>
> Get a value for the current language using:
>
> JsonLocalizations.of(context)?.value('hello')
>
> We keep the API simple, but you could easily add an extension method
> to String: **extension** LocalizedString **on** String {
>
> String tr(BuildContext context) =\>
> JsonLocalizations.of(context)!.value(**this**); }
>
> So you could write:
>
> 'hello'.tr(context)
>
> pour connaître la langue en cour on peut faire ceci
>
> status = Localizations.localeOf(context) == Locale("fr") ? true :
> false;
>
> on modifier ainsi
>
> FlutterSwitch(
>
> width: 60.0, height: 30.0, activeText: "FR", inactiveText: "EN",
>
> valueFontSize: 12.0, toggleSize: 25.0, activeColor: Colors.blue,
> inactiveColor: Colors.green, value: status, borderRadius: 30.0,
> padding: 8.0,
>
> showOnOff: true, onToggle: (val) {

setState(() { status = val;

logPrint(status);

status == true

? Get.updateLocale(Locale("fr")) : Get.updateLocale(Locale("en"));
status == true

? local.setString("lang", "fr") : local.setString("lang", "en"); });

logPrint(Localizations.localeOf(context)); },

## CHANGER DE THEME ##

**Exemple** **de** **personnalisation** **de** **thèmes** **light**
**et** **dark** **1.** **Création** **des** **thèmes** **personnalisés**

Utilisons ThemeData.light() et ThemeData.dark() pour initialiser nos
thèmes de base, puis utilisons copyWith() pour personnaliser quelques
propriétés clés.

**themes.dart**

```dart
import 'package:flutter/material.dart';

// Thème Light personnalisé

final ThemeData lightTheme = ThemeData.light().copyWith( 
        primaryColor:Colors.blue, // Couleur principale 
        accentColor: Colors.green, // Couleur d'accentuation 
        backgroundColor: Colors.white, // Couleur de fond
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue, // Couleur des boutons
            textTheme: ButtonTextTheme.primary, // Style de texte des boutons
        ),
        textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24, 
        fontWeight: FontWeight.bold), //Style du titre principal
        bodyText1: TextStyle(fontSize: 16, color: Colors.black87), // Style du texte du corps

), );

```

// Thème Dark personnalisé
```
final ThemeData darkTheme = ThemeData.dark().copyWith(
primaryColor: Colors.deepPurple, // Couleur principale 
accentColor: Colors.deepOrange, // Couleur d'accentuation
backgroundColor: Colors.grey[900], //Couleur de fond 
buttonTheme: ButtonThemeData(
 buttonColor: Colors.deepPurple, // Couleur des boutons textTheme:
 ButtonTextTheme.primary, // Style de texte des boutons
 ),
textTheme: TextTheme(
headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:
Colors.white), // Style du titre principal

bodyText1: TextStyle(fontSize: 16, color: Colors.white70), // Style dutexte du corps

```

Dans main.dart, utilisez ces thèmes personnalisés avec GetMaterialApp :

**main.dart**

```dart

Copier le code

import 'package:flutter/material.dart'; import 'package:get/get.dart';

import 'themes.dart';

void main() { runApp(MyApp());

}
class MyApp extends StatelessWidget { 
@override
 Widget build(BuildContext context) { return GetMaterialApp(
 title: 'Flutter Thèmes', theme: lightTheme, darkTheme: darkTheme,
themeMode: ThemeMode.system, // Définir le mode de thème par défaut
home: HomePage(),
 ); }

}

class HomePage extends StatelessWidget { 
@override
 Widget build(BuildContext context) { return Scaffold(
appBar: AppBar(
 title: Text('Flutter Thèmes'), ),
 body: Center(
 child: ElevatedButton( onPressed: () {
 // Naviguer vers la page de réglages Get.to(SettingsPage());
 },
child: Text('Settings'), ),
 ), );
} }

class SettingsPage extends StatelessWidget { @override
 Widget build(BuildContext context) { return Scaffold(
 appBar: AppBar(
 title: Text('Thème Settings'), ),
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center, children: \[
   ElevatedButton( onPressed: () {
// Changer le thème à light Get.changeThemeMode(ThemeMode.light);
},
 child: Text('Light Theme'), ),
 SizedBox(height: 20), ElevatedButton(
 onPressed: () {
 // Changer le thème à dark Get.changeThemeMode(ThemeMode.dark);
 },
 child: Text('Dark Theme'), ),
], ),

 ), );

} }
```

