# Accueil - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Accueil

 
There is no translation page available for the current page, so it has been rendered in the default language 

 **Implementation Guide for the MSSanté Secure Messaging API (BAL MSSanté)**
 This guide describes the FHIR API for retrieving and managing MSSanté mailboxes (BAL) attached to healthcare professionals and organisations in the French national directory (Annuaire Santé). 

> **Version snapshot — réservée aux développeurs.** Cet IG est en cours de construction. Son contenu est instable et sujet à des modifications importantes. Il ne doit pas être utilisé en dehors d'un contexte de développement ou d'expérimentation. Un swagger sera prochainement ajouté.

### Introduction

Cet Implementation Guide décrit l'**API FHIR** pour la gestion des **BAL MSSanté** (Boîtes Aux Lettres de la Messagerie Sécurisée de Santé), rattachées aux professionnels de santé et aux structures dans l'Annuaire Santé.

**MSSanté** est le service national de messagerie chiffrée pour les professionnels de santé. Une BAL MSSanté est une adresse mail sécurisée attachée à un professionnel, une situation d'exercice ou une structure de santé.

### En un coup d'œil

Deux endpoints complémentaires :

| | | | |
| :--- | :--- | :--- | :--- |
| Lecture des BAL | `GET` | [`https://gateway.api.esante.gouv.fr/fhir/v2`](https://ansforge.github.io/annuaire-sante-fhir-documentation/) | Disponible |
| Écriture des BAL | `PATCH` | Endpoint dédié MSSanté | En cours de développement |

Quatre types de BAL, portés par trois ressources FHIR :

| | | | |
| :--- | :--- | :--- | :--- |
| Personnelle | `PER` | `Practitioner`,`PractitionerRole` | Rattachée à l'identité d'un professionnel (RPPS) |
| Organisationnelle | `ORG` | `Organization` | Rattachée à une structure (EJ ou EG) |
| Applicative | `APP` | `Organization` | Usage applicatif, rattachée à une structure |
| Cabinet | `CAB` | `Practitioner` | BAL partagée au niveau du cabinet |

### Périmètre du projet

Cet IG couvre :

* La **récupération** des BAL MSSanté via l'API FHIR Annuaire Santé (endpoint GET, lecture seule)
* La **mise à jour** des BAL MSSanté via un endpoint PATCH dédié (création, modification, suppression — en cours d'ouverture)

### Dépendances











### Propriété intellectuelle

This publication includes IP covered under the following statements.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.2.0/CodeSystem-ISO3166Part1.html): [AsBalMssAppLogicalModel](StructureDefinition-as-bal-mss-app.md), [AsBalMssCabLogicalModel](StructureDefinition-as-bal-mss-cab.md)... Show 4 more, [AsBalMssOrgLogicalModel](StructureDefinition-as-bal-mss-org.md), [AsBalMssPerLogicalModel](StructureDefinition-as-bal-mss-per.md), [AsMssServerCapabilityStatement](CapabilityStatement-AsMssServerCapabilityStatement.md) and [MSS](index.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [ObservationValue](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ObservationValue.html): [Bundle/mss-bundle-bal-per-elements](Bundle-mss-bundle-bal-per-elements.md), [Practitioner/mss-practitioner-bal-per-dupont-elements](Practitioner-mss-practitioner-bal-per-dupont-elements.md) and [Practitioner/mss-practitioner-bal-per-martin-elements](Practitioner-mss-practitioner-bal-per-martin-elements.md)


