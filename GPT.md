On passe maintenant en mode release. 🚀
Comme on a verrouillé le scope, je préparerais 0.2.1 comme une patch release propre, sans nouvelle API.
1. Release objective
Version : 0.2.1
Release note :
Improve network image decoding by adapting memCacheWidth to the rendered book width and device pixel ratio.

Pas de 0.3.0 : aucune API publique ne change.
2. Ce qui doit être dans la release
Code
Remplacer le 120 arbitraire par le calcul basé sur les contraintes réelles :
LayoutBuilder(
  builder: (context, constraints) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    final memCacheWidth =
        (constraints.maxWidth * devicePixelRatio).round();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      alignment: Alignment.topLeft,
      memCacheWidth: memCacheWidth,
      placeholder: (context, url) =>
          _ShimmerPlaceholder(borderRadius: theme.borderRadius),
      errorWidget: (context, url, error) => _ErrorPlaceholder(),
    );
  },
)
Test
Le test doit protéger le nouveau comportement, pas simplement vérifier que BookView se construit.
Je veux notamment couvrir :
80 × 3   → 240
120 × 3  → 360
250 × 3  → 750
3. CHANGELOG
Je partirais sur :
## [0.2.1] - 2026-08-21

### Fixed
- Adapted network image memory cache width to the rendered book width and device pixel ratio.
- Improved image resolution for larger book cards.
- Reduced unnecessary image decoding size for smaller book cards.
Et éventuellement une référence à l'issue/PR si ton repository en possède une.
4. README
Je ne réécrirais pas le README pour cette release.
Par contre, vérifie impérativement le snippet de version dont nous avions parlé.
S'il contient encore :
book_view_flutter: ^0.1.0
il doit être corrigé en :
book_view_flutter: ^0.2.1
Et je profiterais de cette release pour avoir un exemple propre :
BookView(
  imageUrl: 'https://example.com/book.jpg',
  title: 'Clean Architecture',
  author: 'Robert C. Martin',
  width: 160,
  height: 240,
)
La documentation officielle recommande justement de fournir des exemples d'utilisation et de vérifier la génération de documentation avant publication. Dart
5. Quality Gate
Avant même de penser à pub.dev :
dart format .
dart analyze
dart test
dart doc --dry-run .
Je rajoute volontairement :
dart doc --dry-run .
Parce que c'est un package public et que pub.dev génère la documentation API à partir du package. Dart recommande de vérifier cette génération avant publication. Dart
Notre règle :
format    ✅
analyze   ✅
test      ✅
dart doc  ✅
Zéro warning.
6. Vérification du package publié
Ensuite :
dart pub publish --dry-run
C'est une étape importante : Dart indique que le dry-run vérifie la structure du package et affiche exactement les fichiers qui seraient publiés. Dart
On doit inspecter la sortie et vérifier qu'on ne publie pas accidentellement :
❌ .dart_tool
❌ fichiers temporaires
❌ screenshots de debug
❌ fichiers personnels
❌ artefacts inutiles
et que nous avons bien :
✅ pubspec.yaml
✅ README.md
✅ CHANGELOG.md
✅ LICENSE
✅ lib/
✅ test/
✅ example/    (si présent)
7. Git
Avant publication :
git status
Je veux un working tree propre.
Puis :
git diff
Dernière revue humaine :
Scope
├── memCacheWidth
├── tests
├── README
└── CHANGELOG
Rien d'autre.
Ensuite commit :
git add .
git commit -m "fix: optimize network image cache sizing"
Puis tag :
git tag v0.2.1
8. Publication
Quand le dry-run est parfaitement propre :
dart pub publish
Dart demande normalement une confirmation et affiche les fichiers concernés avant l'upload. Dart
Je préfère sans --force pour cette release.
9. Après publication
Une fois pub.dev mis à jour :
pub.dev
   ↓
0.2.1 visible
   ↓
README correct
   ↓
CHANGELOG correct
   ↓
API docs générées
   ↓
example vérifié
Puis test réel dans ton projet sandbox :
dependencies:
  book_view_flutter: ^0.2.1
Et vérifie visuellement :
- petite carte ;
- grande carte ;
- grille 2 colonnes ;
- grille 3 colonnes ;
- image réseau ;
- image asset ;
- placeholder ;
- erreur image.
🏁 Notre release checklist finale
- pubspec.yaml → 0.2.1
- Fix memCacheWidth
- Test ajouté
- README vérifié
- CHANGELOG 0.2.1
- dart format .
- dart analyze
- dart test
- dart doc --dry-run .
- dart pub publish --dry-run
- fichiers publiés vérifiés
- git status propre
- commit
- tag v0.2.1
- dart pub publish
- sandbox avec ^0.2.1
- vérification sur pub.dev