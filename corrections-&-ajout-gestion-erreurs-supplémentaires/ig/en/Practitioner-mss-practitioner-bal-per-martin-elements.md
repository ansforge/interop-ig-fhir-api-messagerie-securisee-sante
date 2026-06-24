# Practitioner — BAL PER (éléments restreints, 2e praticien) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Example Practitioner: Practitioner — BAL PER (éléments restreints, 2e praticien)

-------

**English**

-------

Last updated: 2025-10-17 14:30:00+0200

Tag: [subsetted (Details: ObservationValue code SUBSETTED = 'subsetted')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ObservationValue.html)

**identifier**: `urn:oid:1.2.250.1.71.4.2.1`/810007654321 (use: official, )

**telecom**: [sophie.martin@medecin.mssante.fr](mailto:sophie.martin@medecin.mssante.fr)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "mss-practitioner-bal-per-martin-elements",
  "meta" : {
    "lastUpdated" : "2025-10-17T14:30:00.000+02:00",
    "tag" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
      "code" : "SUBSETTED"
    }]
  },
  "identifier" : [{
    "use" : "official",
    "system" : "urn:oid:1.2.250.1.71.4.2.1",
    "value" : "810007654321"
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
