# Bundle searchset BAL PER — réponse complète - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Exemple Bundle: Bundle searchset BAL PER — réponse complète



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "mss-bundle-bal-per-full",
  "type" : "searchset",
  "total" : 2,
  "link" : [{
    "relation" : "self",
    "url" : "[base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER"
  }],
  "entry" : [{
    "fullUrl" : "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-dupont",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "mss-practitioner-bal-per-dupont",
      "meta" : {
        "lastUpdated" : "2025-11-04T09:12:00.000+01:00"
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"Practitioner_mss-practitioner-bal-per-dupont\"> </a><p class=\"res-header-id\"><b>Narratif généré : Praticien mss-practitioner-bal-per-dupont</b></p><a name=\"mss-practitioner-bal-per-dupont\"> </a><a name=\"hcmss-practitioner-bal-per-dupont\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Dernière mise à jour : 2025-11-04 09:12:00+0100</p></div><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.1</code>/810003456789 (utilisation : official, )</p><p><b>active</b>: true</p><p><b>name</b>: Jean-Marie DUPONT (Official)</p><p><b>telecom</b>: <a href=\"mailto:jean-marie.dupont@infirmier.mssante.fr\">jean-marie.dupont@infirmier.mssante.fr</a></p></div></div>"
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
    },
    "search" : {
      "mode" : "match"
    }
  },
  {
    "fullUrl" : "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-martin",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "mss-practitioner-bal-per-martin",
      "meta" : {
        "lastUpdated" : "2025-10-17T14:30:00.000+02:00"
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"Practitioner_mss-practitioner-bal-per-martin\"> </a><p class=\"res-header-id\"><b>Narratif généré : Praticien mss-practitioner-bal-per-martin</b></p><a name=\"mss-practitioner-bal-per-martin\"> </a><a name=\"hcmss-practitioner-bal-per-martin\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Dernière mise à jour : 2025-10-17 14:30:00+0200</p></div><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.1</code>/810007654321 (utilisation : official, )</p><p><b>active</b>: true</p><p><b>name</b>: Sophie MARTIN (Official)</p><p><b>telecom</b>: <a href=\"mailto:sophie.martin@medecin.mssante.fr\">sophie.martin@medecin.mssante.fr</a></p></div></div>"
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
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
