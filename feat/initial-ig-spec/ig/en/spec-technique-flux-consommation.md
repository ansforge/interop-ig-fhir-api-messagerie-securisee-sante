# Récupération (GET) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0

## Récupération (GET)

 
There is no translation page available for the current page, so it has been rendered in the default language 

Cette page s'adresse aux développeurs et intégrateurs. Elle décrit les opérations de récupération des BAL MSSanté.

Dans les exemples ci-dessous, `[base]` désigne l'URL de base de l'[API FHIR Annuaire Santé v2](https://ansforge.github.io/annuaire-sante-fhir-documentation/) : `https://gateway.api.esante.gouv.fr/fhir/v2`.

### BAL personnelles (PER)

Une BAL PER peut être portée par un `Practitioner` (identifiant RPPS seul) ou un `PractitionerRole` (RPPS + structure) :

```
GET [base]/Practitioner?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER
GET [base]/PractitionerRole?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER

```

Ces deux requêtes peuvent être regroupées via `_type` :

```
GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER

```

Le paramètre `_elements` permet de limiter la réponse aux champs utiles :

```
GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER&_elements=identifier,telecom

```

Il est également possible de regrouper les deux requêtes via un batch FHIR :

```
POST [base]
Content-Type: application/fhir+json

{
  "resourceType": "Bundle",
  "type": "batch",
  "entry": [
    {
      "request": {
        "method": "GET",
        "url": "Practitioner?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER"
      }
    },
    {
      "request": {
        "method": "GET",
        "url": "PractitionerRole?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER"
      }
    }
  ]
}

```

Le serveur répond avec un Bundle de type `batch-response`, chaque entry portant un Bundle `searchset`.

**Exemples de réponse :**

* [Bundle searchset BAL PER — réponse complète](Bundle-mss-bundle-bal-per-full.md)
* [Bundle searchset BAL PER — réponse restreinte (`_elements=identifier,telecom`)](Bundle-mss-bundle-bal-per-elements.md)

### BAL organisationnelles (ORG)

```
GET [base]/Organization?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|ORG

```

### BAL applicatives (APP)

```
GET [base]/Organization?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|APP

```

### BAL de cabinet (CAB)

> La prise en charge des BAL CAB est en cours de travaux. Les spécifications ci-dessous sont susceptibles d'évoluer.

```
GET [base]/Practitioner?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|CAB

```

### Paramètres de recherche disponibles

| | | |
| :--- | :--- | :--- |
| [`mailbox-mss-type`](SearchParameter-as-sp-mailbox-mss-type.md) | token | Filtre par type de BAL (`PER`,`ORG`,`APP`,`CAB`) |
| [`mailbox-mss`](SearchParameter-as-sp-mailbox-mss.md) | string | Filtre par adresse MSSanté (`:contains`,`:exact`) |

