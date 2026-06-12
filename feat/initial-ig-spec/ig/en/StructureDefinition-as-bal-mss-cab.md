# AS BAL MSS CAB - Modèle logique - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0

## Logical Model: AS BAL MSS CAB - Modèle logique 

 
Modèle logique de la boîte aux lettres MSSanté de cabinet (CAB). 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.mss|current/StructureDefinition/StructureDefinition-as-bal-mss-cab.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-as-bal-mss-cab.csv), [Excel](../StructureDefinition-as-bal-mss-cab.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "as-bal-mss-cab",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-cab",
  "version" : "0.1.0",
  "name" : "AsBalMssCabLogicalModel",
  "title" : "AS BAL MSS CAB - Modèle logique",
  "status" : "draft",
  "date" : "2026-06-12T12:51:11+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique de la boîte aux lettres MSSanté de cabinet (CAB).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-cab",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "as-bal-mss-cab",
      "path" : "as-bal-mss-cab",
      "short" : "AS BAL MSS CAB - Modèle logique",
      "definition" : "Modèle logique de la boîte aux lettres MSSanté de cabinet (CAB)."
    },
    {
      "id" : "as-bal-mss-cab.adresse",
      "path" : "as-bal-mss-cab.adresse",
      "short" : "Adresse BAL",
      "definition" : "Adresse de messagerie MSSanté",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-cab.description",
      "path" : "as-bal-mss-cab.description",
      "short" : "Description",
      "definition" : "Description fonctionnelle de la BAL",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-cab.listeRouge",
      "path" : "as-bal-mss-cab.listeRouge",
      "short" : "Liste rouge",
      "definition" : "Indicateur liste rouge. true : la BAL ne doit pas être publiée ; false : la BAL peut être publiée.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
