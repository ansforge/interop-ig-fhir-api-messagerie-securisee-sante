# AS MSS Server CapabilityStatement - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## CapabilityStatement: AS MSS Server CapabilityStatement 

 
CapabilityStatement décrivant les capacités de l'endpoint dédié à l'écriture des BAL MSSanté. 
Cet endpoint expose uniquement des opérations d'écriture : 
* **PATCH FHIRPath** : ajout, modification ou suppression d'un élément `telecom[mailbox-mss]` sur la ressource porteuse, identifiée soit par son ID logique, soit par son identifiant métier (conditional PATCH via `identifier`).
 
La sémantique du PATCH suit la spécification [FHIR Patch](https://hl7.org/fhir/R4/http.html#patch) au format `application/fhir+json`. 

 [Fichier de définition d'OpenAPI-Swagger](../AsMssServerCapabilityStatement.openapi.json) | [Télécharger](../AsMssServerCapabilityStatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "AsMssServerCapabilityStatement",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mss/CapabilityStatement/AsMssServerCapabilityStatement",
  "version" : "0.1.0-snapshot",
  "name" : "AsMssServerCapabilityStatement",
  "title" : "AS MSS Server CapabilityStatement",
  "status" : "active",
  "date" : "2026-06-12",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "CapabilityStatement décrivant les capacités de l'endpoint dédié à l'écriture des BAL MSSanté.\n\nCet endpoint expose uniquement des opérations d'écriture :\n- **PATCH FHIRPath** : ajout, modification ou suppression d'un élément `telecom[mailbox-mss]` sur la ressource porteuse, identifiée soit par son ID logique, soit par son identifiant métier (conditional PATCH via `identifier`).\n\nLa sémantique du PATCH suit la spécification [FHIR Patch](https://hl7.org/fhir/R4/http.html#patch) au format `application/fhir+json`.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json"],
  "rest" : [{
    "mode" : "server",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-CapabilityStatement.rest.resource.conditionalPatch",
        "valueBoolean" : true
      }],
      "type" : "Organization",
      "profile" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization|1.1.0",
      "interaction" : [{
        "code" : "patch",
        "documentation" : "Modification d'une BAL MSSanté (ORG ou APP) rattachée à une structure via PATCH FHIRPath sur l'élément telecom ciblé par son adresse. Supporte le conditional PATCH via le paramètre `identifier` (`idnatstruct`, ex. FINESS géographique) : `PATCH [base]/Organization?identifier=<system>|<idnatstruct>`."
      }],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Organization-identifier|4.0.1",
        "type" : "token",
        "documentation" : "Identifiant national de structure (`idnatstruct`). Utilisé comme critère de conditional PATCH."
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-CapabilityStatement.rest.resource.conditionalPatch",
        "valueBoolean" : true
      }],
      "type" : "Practitioner",
      "profile" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner|1.1.0",
      "interaction" : [{
        "code" : "patch",
        "documentation" : "Modification d'une BAL MSSanté de type PER (rattachée à l'identifiant RPPS seul) ou CAB via PATCH FHIRPath sur l'élément telecom ciblé par son adresse. Supporte le conditional PATCH via le paramètre `identifier` (`idnatps`, ex. RPPS) : `PATCH [base]/Practitioner?identifier=<system>|<idnatps>`."
      }],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Practitioner-identifier|4.0.1",
        "type" : "token",
        "documentation" : "Identifiant national du professionnel de santé (`idnatps`). Utilisé comme critère de conditional PATCH."
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-CapabilityStatement.rest.resource.conditionalPatch",
        "valueBoolean" : true
      }],
      "type" : "PractitionerRole",
      "profile" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole|1.1.0",
      "interaction" : [{
        "code" : "patch",
        "documentation" : "Modification d'une BAL MSSanté de type PER (rattachée à un RPPS + structure d'exercice) via PATCH FHIRPath sur l'élément telecom ciblé par son adresse. Supporte le conditional PATCH via le paramètre `identifier` (`idSituationExercice`) : `PATCH [base]/PractitionerRole?identifier=<system>|<idSituationExercice>`."
      }],
      "searchParam" : [{
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier|4.0.1",
        "type" : "token",
        "documentation" : "Identifiant de la situation d'exercice (`idSituationExercice`). Utilisé comme critère de conditional PATCH."
      }]
    }]
  }]
}

```
