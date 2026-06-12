# AS BAL MSS PER - Modèle logique - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0

## Logical Model: AS BAL MSS PER - Modèle logique 

 
Modèle logique de la boîte aux lettres MSSanté personnelle (PER), rattachée à un professionnel via son identifiant RPPS. 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.mss|current/StructureDefinition/StructureDefinition-as-bal-mss-per.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-as-bal-mss-per.csv), [Excel](../StructureDefinition-as-bal-mss-per.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "as-bal-mss-per",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-per",
  "version" : "0.1.0",
  "name" : "AsBalMssPerLogicalModel",
  "title" : "AS BAL MSS PER - Modèle logique",
  "status" : "draft",
  "date" : "2026-06-12T13:14:17+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique de la boîte aux lettres MSSanté personnelle (PER), rattachée à un professionnel via son identifiant RPPS.",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-per",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "as-bal-mss-per",
      "path" : "as-bal-mss-per",
      "short" : "AS BAL MSS PER - Modèle logique",
      "definition" : "Modèle logique de la boîte aux lettres MSSanté personnelle (PER), rattachée à un professionnel via son identifiant RPPS."
    },
    {
      "id" : "as-bal-mss-per.adresse",
      "path" : "as-bal-mss-per.adresse",
      "short" : "Adresse BAL",
      "definition" : "Adresse de messagerie MSSanté",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-per.identifiantPP",
      "path" : "as-bal-mss-per.identifiantPP",
      "short" : "Identifiant PP",
      "definition" : "Identifiant national du professionnel de santé (RPPS)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-per.listeRouge",
      "path" : "as-bal-mss-per.listeRouge",
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
