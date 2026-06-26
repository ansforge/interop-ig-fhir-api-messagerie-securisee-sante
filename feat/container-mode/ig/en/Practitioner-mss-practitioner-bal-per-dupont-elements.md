# Practitioner — BAL PER (éléments restreints, _elements=identifier,telecom) - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Example Practitioner: Practitioner — BAL PER (éléments restreints, _elements=identifier,telecom)

-------

**English**

-------

Last updated: 2025-11-04 09:12:00+0100

Tag: [subsetted (Details: ObservationValue code SUBSETTED = 'subsetted')](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ObservationValue.html)

**identifier**: `urn:oid:1.2.250.1.71.4.2.1`/810003456789 (use: official, )

**telecom**: [jean-marie.dupont@infirmier.mssante.fr](mailto:jean-marie.dupont@infirmier.mssante.fr)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "mss-practitioner-bal-per-dupont-elements",
  "meta" : {
    "lastUpdated" : "2025-11-04T09:12:00.000+01:00",
    "tag" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
      "code" : "SUBSETTED"
    }]
  },
  "identifier" : [{
    "use" : "official",
    "system" : "urn:oid:1.2.250.1.71.4.2.1",
    "value" : "810003456789"
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
