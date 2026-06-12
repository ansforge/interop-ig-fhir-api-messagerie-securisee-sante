# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Projet

Implementation Guide FHIR pour l'**API Messagerie Sécurisée de Santé (MSSanté)**.

- ID : `ans.fhir.fr.mss`
- Canonical : `https://interop.esante.gouv.fr/ig/fhir/mss`
- GitHub : `ansforge/interop-ig-fhir-api-messagerie-securisee-sante`
- CI-build : `https://ansforge.github.io/interop-ig-fhir-api-messagerie-securisee-sante/main/ig`

## Commandes

```bash
# Télécharger / mettre à jour le publisher HL7
./_updatePublisher.sh

# Compiler l'IG (SUSHI + Publisher) — une seule fois
./_genonce.sh

# Compiler en mode watch (rebuild à chaque modification)
./_gencontinuous.sh
```

Le publisher nécessite Java. Le JAR est téléchargé dans `input-cache/publisher.jar`. Le script vérifie si `tx.fhir.org` est accessible ; en mode offline, le serveur de terminologie est désactivé automatiquement.

## Architecture

### Pipeline de génération

1. **SUSHI** compile les fichiers `.fsh` de `input/fsh/` → ressources FHIR JSON dans `fsh-generated/resources/`
2. **IG Publisher** combine `fsh-generated/`, `input/pagecontent/`, `input/images/` et le template pour produire le site statique dans `output/`

### Fichiers de configuration clés

| Fichier | Rôle |
|---|---|
| `sushi-config.yaml` | Métadonnées IG (id, canonical, version, pages, menu, dépendances) |
| `ig.ini` | Config IG Publisher — pointe vers le JSON généré par SUSHI |
| `publication-request.json` | Métadonnées ANS pour la publication officielle |
| `expansion-params.json` | Extension SNOMED CT française (11000315107) pour l'expansion des ValueSets |
| `input/ignoreWarnings.txt` | Avertissements Publisher supprimés (documenter la raison de chaque suppression) |

### Structure FSH (`input/fsh/`)

```
Profile-resource/    ← profils de ressources FHIR
Profile-datatype/    ← profils de types de données
Extensions/          ← extensions
CodeSystems/         ← code systems locaux
ValueSets/           ← value sets
Examples/            ← exemples d'instances
CapabilityStatements/
SearchParameters/
Logicals/            ← modèles logiques
```

### Pages (`input/pagecontent/`)

Les fichiers `.md` doivent commencer au niveau `###` (les niveaux `#` et `##` sont générés automatiquement par le publisher).

Structure narrative :
- `index.md` — Accueil
- `spec-fonctionnelle-*.md` — Vol. 1 étude fonctionnelle
- `spec-technique-*.md` — Vol. 2 détail des transactions
- `autres_ressources.md`, `annexe-*.md` — Vol. 3 annexes
- `change-log.md` — historique des versions (mettre à jour à chaque release)

Les images sources (PlantUML, PPTX) sont dans `input/images-source/` ; les images finales dans `input/images/`.

## CI/CD

- **`fhir-workflows.yml`** — déclenché à chaque push, publie sur GitHub Pages (`/{branch}/ig`)
- **`fhir-release.yml`** — workflow manuel, publie dans `ansforge/IG-website-release`

## Template de Pull Request

```
## Description des changements

* [changement 1]
* [changement 2]

## Preview

https://ansforge.github.io/interop-ig-fhir-api-messagerie-securisee-sante/[nom-de-la-branche]/ig
```
