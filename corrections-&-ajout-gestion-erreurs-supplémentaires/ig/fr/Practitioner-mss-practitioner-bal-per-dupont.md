# Practitioner — BAL PER (exemple complet) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Exemple Practitioner: Practitioner — BAL PER (exemple complet)

-------

**French**

-------

Dernière mise à jour : 2025-11-04 09:12:00+0100

**identifier**: `urn:oid:1.2.250.1.71.4.2.1`/810003456789 (utilisation : official, )

**active**: true

**name**: Jean-Marie DUPONT (Official)

**telecom**: [jean-marie.dupont@infirmier.mssante.fr](mailto:jean-marie.dupont@infirmier.mssante.fr)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "mss-practitioner-bal-per-dupont",
  "meta" : {
    "lastUpdated" : "2025-11-04T09:12:00.000+01:00"
  },
  "identifier" : [{
    "use" : "official",
    "system" : "urn:oid:1.2.250.1.71.4.2.1",
    "value" : "810003456789"
  }],
  "active" : true,
  "name" : [{
    "use" : "official",
    "family" : "DUPONT",
    "given" : ["Jean-Marie"]
  }],
  "telecom" : [{
    "extension" : [{
      "extension" : [{
        "url" : "type",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL",
            "code" : "PER"
          }]
        }
      },
      {
        "url" : "listeRouge",
        "valueBoolean" : false
      }],
      "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
    }],
    "system" : "email",
    "value" : "jean-marie.dupont@infirmier.mssante.fr"
  }]
}

```
