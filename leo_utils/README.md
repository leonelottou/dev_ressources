<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# leo_utils

`leo_utils` est une collection de petites fonctions utilitaires conçues pour simplifier des tâches courantes dans le développement Flutter.

## Fonctionnalités

- **Manipulation de chaînes** : Fonctions d'aide pour formater et traiter les chaînes de caractères.
- **Utilitaires de date/heure** : Méthodes pratiques pour gérer les opérations liées aux dates et heures.
- **Aides pour l'UI** : Fonctions utilitaires pour améliorer vos widgets Flutter.
- **Validation** : Fonctions pour simplifier la validation des entrées (par exemple, emails, numéros de téléphone).
- **Autres utilitaires** : Diverses fonctions pratiques pour le développement d'applications.

## Installation

Pour utiliser `leo_utils` dans votre projet Flutter, ajoutez la ligne suivante dans votre fichier `pubspec.yaml` :

```yaml
dependencies:
  leo_utils:
    git:
     url: https://github.com/leonelottou/dev_ressources.git
     path: leo_utils
     ref: main 

```

Ensuite, mettez à jour vos dépendances avec la commande suivante :

```bash
flutter pub get
```

## Utilisation

Voici un exemple rapide d'utilisation de certaines des fonctions utilitaires de `leo_utils` :

### Exemple : Masquer un numéro de téléphone

```dart
import 'package:leo_utils/leo_utils.dart';

void main() {
  String numeroMasque = masquerNumeroTelephone('697123456');
  print(numeroMasque); // Affiche : 697****56
}
```

### Exemple : Validation d'email

```dart
import 'package:leo_utils/leo_utils.dart';

void main() {
  bool estValide =  validateEmail('exemple@gmail.com');
  print(estValide); // Affiche : true
}
```

### Exemple : Formatage de date

```dart
import 'package:leo_utils/leo_utils.dart';

void main() {
  String dateFormatee = dateformate(DateTime.now());
  print(dateFormatee); // Affiche : 13 Sep 2024
}
```

## Exemple  date relative au jour
```dart

String formattedDate = relativeDate('2023-09-13', '14:00');
print(formattedDate); // Cela affichera "Hier" si la date est celle 

```

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à forker le dépôt et à proposer des pull requests avec de nouvelles fonctionnalités, des corrections de bugs ou des améliorations.

1. Forker le dépôt
2. Créer une nouvelle branche (`git checkout -b feature/votre-fonctionnalité`)
3. Committer vos modifications (`git commit -am 'Ajouter une fonctionnalité'`)
4. Pusher la branche (`git push origin feature/votre-fonctionnalité`)
5. Créer une pull request

## Licence

Ce package est distribué sous la licence MIT. Voir le fichier [LICENSE](https://github.com/leonelottou/leo_utils/blob/main/LICENSE) pour plus d'informations.
