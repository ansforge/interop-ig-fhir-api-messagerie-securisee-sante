# Écriture (PATCH) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Écriture (PATCH)

 
There is no translation page available for the current page, so it has been rendered in the default language 

Cette page s'adresse aux développeurs et intégrateurs. Elle décrit les opérations d'écriture (PATCH) sur les BAL MSSanté.

> L'endpoint PATCH de l'API MSSanté est en cours de développement. Cette page décrit le comportement attendu des opérations d'écriture, qui seront disponibles lors de l'ouverture de cet endpoint.

Une BAL étant modélisée comme un élément `telecom` au sein de sa ressource porteuse, toutes les opérations d'écriture s'effectuent par un `PATCH` ciblé sur cette ressource. L'opération `PUT` (remplacement complet) est déconseillée car elle expose à des écrasements non intentionnels.

L'approche retenue est le **FHIR Patch** (format `application/fhir+json`), utilisant une ressource `Parameters` avec des opérations FHIRPath.

### Mise à jour

La ressource porteuse et son identifiant sont à récupérer au préalable via une recherche sur `mailbox-mss`. L'utilisation du [conditional PATCH](#conditional-patch) permet d'éviter cette étape.

#### Exemple — mise à jour ciblée d'un attribut : liste rouge d'une BAL PER

```
PATCH [base]/Practitioner/[id]
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'prenom.nom@domain.mssante.fr').extension('https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata').extension('listeRouge').value" },
        { "name": "value", "valueBoolean": true }
      ]
    }
  ]
}

```

#### Exemple — mise à jour de l'attribut telecom en entier

Pour modifier plusieurs attributs en une seule requête, remplacer le ContactPoint entier :

```
PATCH [base]/Practitioner/[id]
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'prenom.nom@domain.mssante.fr')" },
        { "name": "value", "valueContactPoint": {
          "system": "email",
          "value": "prenom.nom@domain.mssante.fr",
          "extension": [{
            "url": "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata",
            "extension": [
              { "url": "type", "valueCode": "PER" },
              { "url": "listeRouge", "valueBoolean": true }
            ]
          }]
        }}
      ]
    }
  ]
}

```

Pour information, il n'est pas possible de modifier le type ni la value d'une BAL, l'API renvoie une erreur si le client fait cette demande.

#### Exemple — mise à jour de la description d'une BAL ORG

```
PATCH [base]/Organization/[id]
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Organization.telecom.where(value = 'structure@domain.mssante.fr').extension('https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata').extension('description').value" },
        { "name": "value", "valueString": "BAL principale de la structure" }
      ]
    }
  ]
}

```

### Création

L'ajout d'une nouvelle BAL s'effectue par un `PATCH` avec une opération `insert` dans le tableau `telecom`.

#### Exemple — ajout d'une BAL PER

```
PATCH [base]/Practitioner/[id]
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "insert" },
        { "name": "path", "valueString": "Practitioner.telecom" },
        { "name": "index", "valueInteger": 0 },
        { "name": "value", "valueContactPoint": {
          "system": "email",
          "value": "prenom.nom@domain.mssante.fr",
          "extension": [{
            "url": "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata",
            "extension": [
              { "url": "type", "valueCode": "PER" },
              { "url": "listeRouge", "valueBoolean": false }
            ]
          }]
        }}
      ]
    }
  ]
}

```

#### Exemple — ajout d'une BAL ORG (conditional PATCH par idnatstruct)

```
PATCH [base]/Organization?identifier=https://finess.esante.gouv.fr|123456789
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "insert" },
        { "name": "path", "valueString": "Organization.telecom" },
        { "name": "index", "valueInteger": 0 },
        { "name": "value", "valueContactPoint": {
          "system": "email",
          "value": "structure@domain.mssante.fr",
          "extension": [{
            "url": "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata",
            "extension": [
              { "url": "type", "valueCode": "ORG" },
              { "url": "listeRouge", "valueBoolean": false },
              { "url": "description", "valueString": "BAL principale de la structure" }
            ]
          }]
        }}
      ]
    }
  ]
}

```

### Suppression

La suppression d'une BAL s'effectue par un `PATCH` avec une opération `delete` ciblant le `telecom` via son adresse.

#### Exemple — suppression d'une BAL PER

```
PATCH [base]/Practitioner/[id]
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "delete" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'prenom.nom@domain.mssante.fr')" }
      ]
    }
  ]
}

```

### Conditional PATCH

Le conditional PATCH permet de cibler la ressource porteuse directement via son identifiant métier, sans récupérer préalablement son ID logique FHIR.

| | | |
| :--- | :--- | :--- |
| `Practitioner` | `idnatps`(RPPS) | `PATCH [base]/Practitioner?identifier=urn:oid:1.2.250.1.71.4.2.1\|800012345678` |
| `PractitionerRole` | `idSituationExercice` | `PATCH [base]/PractitionerRole?identifier=<system>\|<id>` |
| `Organization` | `idnatstruct`(FINESS) | `PATCH [base]/Organization?identifier=https://finess.esante.gouv.fr\|123456789` |

Le corps de la requête est identique au PATCH par ID logique.

#### Exemple — conditional PATCH sur Practitioner (RPPS)

```
PATCH [base]/Practitioner?identifier=urn:oid:1.2.250.1.71.4.2.1|800012345678
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'prenom.nom@domain.mssante.fr').extension('https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata').extension('listeRouge').value" },
        { "name": "value", "valueBoolean": true }
      ]
    }
  ]
}

```

### Opérations combinées

Il est possible de regrouper plusieurs opérations dans une seule requête `PATCH`, en incluant plusieurs paramètres `operation`. Les opérations sont appliquées séquentiellement.

#### Exemple — mise en liste rouge + suppression en une seule requête

```
PATCH [base]/Practitioner/pract-800012345678
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "replace" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'jean.dupont.pro@domain.mssante.fr').extension('https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata').extension('listeRouge').value" },
        { "name": "value", "valueBoolean": true }
      ]
    },
    {
      "name": "operation",
      "part": [
        { "name": "type", "valueCode": "delete" },
        { "name": "path", "valueString": "Practitioner.telecom.where(value = 'jean.dupont.ancien@domain.mssante.fr')" }
      ]
    }
  ]
}

```

Le serveur retourne `200 OK` avec la ressource mise à jour.

