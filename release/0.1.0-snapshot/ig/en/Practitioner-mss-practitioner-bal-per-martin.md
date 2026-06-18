# Practitioner — BAL PER (2e praticien) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Example Practitioner: Practitioner — BAL PER (2e praticien)

-------

**English**

-------

Last updated: 2025-10-17 14:30:00+0200

**identifier**: `urn:oid:1.2.250.1.71.4.2.1`/810007654321 (use: official, )

**active**: true

**name**: Sophie MARTIN (Official)

**telecom**: [sophie.martin@medecin.mssante.fr](mailto:sophie.martin@medecin.mssante.fr)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "mss-practitioner-bal-per-martin",
  "meta" : {
    "lastUpdated" : "2025-10-17T14:30:00.000+02:00"
  },
  "identifier" : [{
    "use" : "official",
    "system" : "urn:oid:1.2.250.1.71.4.2.1",
    "value" : "810007654321"
  }],
  "active" : true,
  "name" : [{
    "use" : "official",
    "family" : "MARTIN",
    "given" : ["Sophie"]
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
    "value" : "sophie.martin@medecin.mssante.fr"
  }]
}

```
