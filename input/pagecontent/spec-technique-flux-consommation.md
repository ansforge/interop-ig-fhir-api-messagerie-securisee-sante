<div style="background-color: #f0f0f0; border-left: 4px solid #666; padding: 10px; width: 65%">
Cette page s'adresse aux développeurs et intégrateurs. Elle décrit les opérations de récupération des BAL MSSanté.
</div>

### BAL personnelles (PER)

Une BAL PER peut être portée par un `Practitioner` (identifiant RPPS seul) ou un `PractitionerRole` (RPPS + structure) :

```http
GET [base]/Practitioner?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER
GET [base]/PractitionerRole?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER
```

Ces deux requêtes peuvent être regroupées via `_type` :

```http
GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER
```

Le paramètre `_elements` permet de limiter la réponse aux champs utiles :

```http
GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER&_elements=identifier,telecom
```

Il est également possible de regrouper les deux requêtes via un batch FHIR :

```json
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

* [Bundle searchset BAL PER — réponse complète](Bundle-mss-bundle-bal-per-full.html)
* [Bundle searchset BAL PER — réponse restreinte (`_elements=identifier,telecom`)](Bundle-mss-bundle-bal-per-elements.html)

### BAL organisationnelles (ORG)

```http
GET [base]/Organization?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|ORG
```

### BAL applicatives (APP)

```http
GET [base]/Organization?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|APP
```

### BAL de cabinet (CAB)

<blockquote class="stu-note">
<p>La prise en charge des BAL CAB est en cours de travaux. Les spécifications ci-dessous sont susceptibles d'évoluer.</p>
</blockquote>

```http
GET [base]/Practitioner?mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|CAB
```

### Paramètres de recherche disponibles

| Paramètre | Type | Description |
|-----------|------|-------------|
| [`mailbox-mss-type`](SearchParameter-as-sp-mailbox-mss-type.html) | token | Filtre par type de BAL (`PER`, `ORG`, `APP`, `CAB`) |
| [`mailbox-mss`](SearchParameter-as-sp-mailbox-mss.html) | string | Filtre par adresse MSSanté (`:contains`, `:exact`) |
