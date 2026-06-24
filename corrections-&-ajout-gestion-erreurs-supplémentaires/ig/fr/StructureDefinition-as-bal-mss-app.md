# AS BAL MSS APP - Modèle logique - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Modèle logique: AS BAL MSS APP - Modèle logique 

 
Modèle logique de la boîte aux lettres MSSanté applicative (APP), rattachée à une structure (EJ ou EG). 

**Utilisations:**

* Ce Modèle logique n'est utilisé par aucun autre profil dans ce guide d'implémentation

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.mss|current/StructureDefinition/as-bal-mss-app)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(2 éléments obligatoire(s) imbriqué(s))

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

 **Vue d'ensembleView** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(2 éléments obligatoire(s) imbriqué(s))

 

Autres représentations du profil : [CSV](../StructureDefinition-as-bal-mss-app.csv), [Excel](../StructureDefinition-as-bal-mss-app.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "as-bal-mss-app",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-app",
  "version" : "0.1.0-snapshot",
  "name" : "AsBalMssAppLogicalModel",
  "title" : "AS BAL MSS APP - Modèle logique",
  "status" : "draft",
  "date" : "2026-06-24T13:32:12+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique de la boîte aux lettres MSSanté applicative (APP), rattachée à une structure (EJ ou EG).",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/mss/StructureDefinition/as-bal-mss-app",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "as-bal-mss-app",
      "path" : "as-bal-mss-app",
      "short" : "AS BAL MSS APP - Modèle logique",
      "definition" : "Modèle logique de la boîte aux lettres MSSanté applicative (APP), rattachée à une structure (EJ ou EG)."
    },
    {
      "id" : "as-bal-mss-app.adresse",
      "path" : "as-bal-mss-app.adresse",
      "short" : "Adresse BAL",
      "definition" : "Adresse de messagerie MSSanté",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-app.idnatStruct",
      "path" : "as-bal-mss-app.idnatStruct",
      "short" : "Identifiant national de structure",
      "definition" : "Identifiant national de la structure porteuse de la BAL (EJ ou EG)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-app.serviceRattachement",
      "path" : "as-bal-mss-app.serviceRattachement",
      "short" : "Service de rattachement",
      "definition" : "Nom et description du service de rattachement de l'utilisateur de la BAL dans l'organisation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-app.responsable",
      "path" : "as-bal-mss-app.responsable",
      "short" : "Responsable",
      "definition" : "Coordonnées de la ou des personnes responsables au niveau opérationnel de la BAL",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-app.description",
      "path" : "as-bal-mss-app.description",
      "short" : "Description",
      "definition" : "Description fonctionnelle de la BAL",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "as-bal-mss-app.listeRouge",
      "path" : "as-bal-mss-app.listeRouge",
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
