<div style="background-color: #f0f0f0; border-left: 4px solid #666; padding: 10px; width: 65%">
Cette page s'adresse aux développeurs et intégrateurs. Elle décrit les opérations de récupération des BAL MSSanté.
</div>

Dans les exemples ci-dessous, `[base]` désigne l'URL de base de l'[API FHIR Annuaire Santé v2](https://ansforge.github.io/annuaire-sante-fhir-documentation/) : `https://gateway.api.esante.gouv.fr/fhir/v2`.

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

---

### Bilan des tests sur l'API Annuaire Santé v2

Tests effectués sur `https://gateway.api.esante.gouv.fr/fhir/v2` (2026-06-12).

#### Paramètres de recherche

| Requête | Résultat |
|---------|----------|
| `Practitioner?mailbox-mss:contains=mssante.fr` | ✅ Résultats retournés |
| `PractitionerRole?mailbox-mss:contains=mssante.fr` | ✅ Résultats retournés |
| `Organization?mailbox-mss:contains=mssante.fr` | ✅ Résultats retournés |
| `Practitioner?mailbox-mss:exact=<adresse>` | ✅ Syntaxe reconnue (0 résultats avec l'adresse de test) |
| `Practitioner?mailbox-mss:contains=...&_elements=identifier,telecom` | ✅ Restriction aux champs demandés |
| `Practitioner?mailbox-mss-type=...\|PER` | ❌ Paramètre non reconnu (`Parameter mailbox-mss-type not found`) |

Le paramètre `mailbox-mss-type` (token) est défini dans l'IG Annuaire Santé mais n'est pas encore exposé par le serveur (absent du CapabilityStatement). Le filtrage par type de BAL doit actuellement s'effectuer côté client en inspectant `as-ext-mailbox-mss-metadata.extension[type]` dans les résultats.

#### Requêtes multi-ressources

| Requête | Résultat |
|---------|----------|
| `GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss:contains=...` | ❌ Non supporté (route root non gérée par la gateway) |
| `POST [base]` (batch FHIR) | ❌ Non supporté (route root non gérée par la gateway) |

Le regroupement de requêtes sur plusieurs types de ressources via `_type` ou batch n'est pas disponible sur l'API v2. Il faut effectuer des requêtes séparées sur chaque ressource.
