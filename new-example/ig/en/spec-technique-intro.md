# Introduction technique - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Introduction technique

 
There is no translation page available for the current page, so it has been rendered in the default language 

Cette page s'adresse aux développeurs et intégrateurs. Elle présente le contexte technique de l'API et la structure FHIR des BAL MSSanté.

### Modélisation FHIR des BAL

Les BAL MSSanté ne sont pas des ressources FHIR autonomes. Elles sont modélisées comme des éléments `telecom` au sein de leurs ressources porteuses (`Practitioner`, `PractitionerRole`, `Organization`), enrichis de l'extension `as-ext-mailbox-mss-metadata`.

Chaque `telecom` portant une BAL a obligatoirement :

* `system` = `email`
* `extension[emailType]` = `MSSANTE` (code issu de `TRE_R256-TypeMessagerie`) — discriminant permettant de distinguer les BAL MSSanté des autres adresses email
* `extension[as-ext-mailbox-mss-metadata]` — métadonnées de la BAL (type, liste rouge, description, etc.)

#### Structure d'un élément telecom BAL

```
{
  "system": "email",
  "value": "prenom.nom@domain.mssante.fr",
  "rank": 1,
  "extension": [
    {
      "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point-email-type",
      "valueCoding": {
        "system": "https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie",
        "code": "MSSANTE"
      }
    },
    {
      "url": "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata",
      "extension": [
        { "url": "type", "valueCodeableConcept": { "coding": [{ "system": "https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL", "code": "PER" }] } },
        { "url": "listeRouge", "valueBoolean": false }
      ]
    }
  ]
}

```

#### Emplacement dans chaque ressource porteuse

| | | |
| :--- | :--- | :--- |
| PER (RPPS seul) | `Practitioner` | `Practitioner.telecom[*]`où`emailType = MSSANTE` |
| PER (RPPS + structure) | `PractitionerRole` | `PractitionerRole.telecom[*]`où`emailType = MSSANTE` |
| ORG | `Organization` | `Organization.telecom[*]`où`emailType = MSSANTE` |
| APP | `Organization` | `Organization.telecom[*]`où`emailType = MSSANTE` |
| CAB | `Practitioner` | `Practitioner.telecom[*]`où`emailType = MSSANTE` |

Le type de BAL (PER / ORG / APP / CAB) est porté par `as-ext-mailbox-mss-metadata.extension[type]`, pas par la ressource elle-même. Un `Practitioner` peut donc porter à la fois des BAL PER et CAB dans son tableau `telecom`.

#### Exemple — Practitioner avec une BAL PER

```
{
  "resourceType": "Practitioner",
  "id": "pract-800012345678",
  "identifier": [
    { "system": "urn:oid:1.2.250.1.71.4.2.1", "value": "800012345678" }
  ],
  "name": [{ "family": "DUPONT", "given": ["Jean"] }],
  "telecom": [
    {
      "system": "email",
      "value": "jean.dupont@medecin.mssante.fr",
      "rank": 1,
      "extension": [
        {
          "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point-email-type",
          "valueCoding": {
            "system": "https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie",
            "code": "MSSANTE"
          }
        },
        {
          "url": "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata",
          "extension": [
            { "url": "type", "valueCodeableConcept": { "coding": [{ "system": "https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL", "code": "PER" }] } },
            { "url": "listeRouge", "valueBoolean": false }
          ]
        }
      ]
    }
  ]
}

```

-------

### Format des opérations d'écriture

Les opérations d'écriture utilisent le **FHIR Patch** au format `application/fhir+json`. Ce format utilise une ressource `Parameters` avec des opérations FHIRPath, permettant de cibler précisément l'élément `telecom` à modifier grâce à l'adresse de la BAL.

Trois types d'opérations sont supportés :

| | |
| :--- | :--- |
| `replace` | Remplacer un attribut ou un ContactPoint entier |
| `insert` | Ajouter une nouvelle BAL |
| `delete` | Supprimer une BAL existante |

