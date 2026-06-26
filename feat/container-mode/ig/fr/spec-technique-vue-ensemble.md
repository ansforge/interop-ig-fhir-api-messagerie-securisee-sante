# Architecture de l'API - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Architecture de l'API

Cette page s'adresse aux développeurs et intégrateurs. Elle décrit l'architecture de l'API MSS.

### Deux endpoints distincts

L'API MSSanté repose sur deux endpoints avec des rôles distincts :

| | | |
| :--- | :--- | :--- |
| **GET**(API Annuaire Santé v2) | `GET`,`POST`(batch) | Lecture des ressources porteuses et de leurs BAL |
| **PATCH**(endpoint dédié MSS) | `PATCH` | Écriture : ajout, modification, suppression de BAL |

### Endpoint GET

L'endpoint GET est l'**[API FHIR Annuaire Santé v2](https://ansforge.github.io/annuaire-sante-fhir-documentation/)** : `https://gateway.api.esante.gouv.fr/fhir/v2`

La documentation complète de l'API (authentification, pagination, paramètres généraux) est disponible sur [ansforge.github.io/annuaire-sante-fhir-documentation](https://ansforge.github.io/annuaire-sante-fhir-documentation/).

Deux paramètres de recherche sont disponibles pour les BAL :

| | | | |
| :--- | :--- | :--- | :--- |
| `mailbox-mss-type` | token | `Organization`,`Practitioner`,`PractitionerRole` | Filtre par type de BAL (`PER`,`ORG`,`APP`,`CAB`) |
| `mailbox-mss` | string | `Organization`,`Practitioner`,`PractitionerRole` | Filtre par adresse MSSanté (`:contains`,`:exact`) |

### Endpoint PATCH

Les capacités de l'endpoint PATCH sont décrites dans le [CapabilityStatement AsMssServerCapabilityStatement](CapabilityStatement-AsMssServerCapabilityStatement.md).

Il supporte deux modes de ciblage :

* **Par ID logique** : `PATCH [base]/Practitioner/[id]`
* **Conditional PATCH** (par identifiant métier) : `PATCH [base]/Practitioner?identifier=<system>|<valeur>`

| | | |
| :--- | :--- | :--- |
| `Practitioner` | `idnatps`(ex. RPPS) | `PATCH [base]/Practitioner?identifier=urn:oid:1.2.250.1.71.4.2.1\|800012345678` |
| `PractitionerRole` | `idSituationExercice` | `PATCH [base]/PractitionerRole?identifier=<system>\|<id>` |
| `Organization` | `idnatstruct`(ex. FINESS) | `PATCH [base]/Organization?identifier=https://finess.esante.gouv.fr\|123456789` |

Le conditional PATCH retourne `412 Precondition Failed` si le critère correspond à plusieurs ressources, et `404 Not Found` si aucune ne correspond.

