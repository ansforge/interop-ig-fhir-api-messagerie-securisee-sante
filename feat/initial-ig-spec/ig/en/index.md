# Accueil - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0

## Accueil

 
There is no translation page available for the current page, so it has been rendered in the default language 

 **Implementation Guide for the MSSanté Secure Messaging API (BAL MSSanté)**
 This guide describes the FHIR API for retrieving and managing MSSanté mailboxes (BAL) attached to healthcare professionals and organisations in the French national directory (Annuaire Santé). 

> Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : https://interop.esante.gouv.fr/ig/fhir/mss

### Introduction

Cet Implementation Guide décrit l'**API FHIR** pour la gestion des **BAL MSSanté** (Boîtes Aux Lettres de la Messagerie Sécurisée de Santé), rattachées aux professionnels de santé et aux structures dans l'Annuaire Santé.

**MSSanté** est le service national de messagerie chiffrée pour les professionnels de santé. Une BAL MSSanté est une adresse mail sécurisée attachée à un professionnel, une situation d'exercice ou une structure de santé.

Les principales sections de l'IG sont :

* **Vol. 1 - Étude fonctionnelle** : contexte MSSanté, types de BAL, modèle de données
* **Vol. 2 - Détail des transactions** : architecture de l'API, opérations GET et PATCH
* **Ressources de conformité** : CapabilityStatement, modèles logiques

### Périmètre du projet

Cet IG couvre :

* La **récupération** des BAL MSSanté via l'API FHIR Annuaire Santé (endpoint GET, lecture seule)
* La **mise à jour** des BAL MSSanté via un endpoint PATCH dédié (création, modification, suppression — en cours d'ouverture)

### Dépendances











### Propriété intellectuelle

This publication includes IP covered under the following statements.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.2.0/CodeSystem-ISO3166Part1.html): [AsBalMssAppLogicalModel](StructureDefinition-as-bal-mss-app.md), [AsBalMssCabLogicalModel](StructureDefinition-as-bal-mss-cab.md)... Show 4 more, [AsBalMssOrgLogicalModel](StructureDefinition-as-bal-mss-org.md), [AsBalMssPerLogicalModel](StructureDefinition-as-bal-mss-per.md), [AsMssServerCapabilityStatement](CapabilityStatement-AsMssServerCapabilityStatement.md) and [MSS](index.md)


