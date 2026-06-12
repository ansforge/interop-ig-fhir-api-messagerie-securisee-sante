<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>Implementation Guide for the MSSanté Secure Messaging API (BAL MSSanté)</b><br>
This guide describes the FHIR API for retrieving and managing MSSanté mailboxes (BAL) attached to healthcare professionals and organisations in the French national directory (Annuaire Santé).
</p>

{% if site.data.info.releaselabel == 'ci-build' %}
<div style="width: 65%">
    <blockquote class="stu-note">
    <p>Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : https://interop.esante.gouv.fr/ig/fhir/mss</p>
    </blockquote>
</div>
{% endif %}

### Introduction

Cet Implementation Guide décrit l'**API FHIR** pour la gestion des **BAL MSSanté** (Boîtes Aux Lettres de la Messagerie Sécurisée de Santé), rattachées aux professionnels de santé et aux structures dans l'Annuaire Santé.

**MSSanté** est le service national de messagerie chiffrée pour les professionnels de santé. Une BAL MSSanté est une adresse mail sécurisée attachée à un professionnel, une situation d'exercice ou une structure de santé.

### En un coup d'œil

Deux endpoints complémentaires :

| Opération | Méthode | URL de base | Statut |
|-----------|---------|-------------|--------|
| Lecture des BAL | `GET` | [`https://gateway.api.esante.gouv.fr/fhir/v2`](https://ansforge.github.io/annuaire-sante-fhir-documentation/) | Disponible |
| Écriture des BAL | `PATCH` | Endpoint dédié MSSanté | En cours de développement |

Quatre types de BAL, portés par trois ressources FHIR :

| Type | Code | Ressource FHIR porteuse | Description |
|------|------|-------------------------|-------------|
| Personnelle | `PER` | `Practitioner`, `PractitionerRole` | Rattachée à l'identité d'un professionnel (RPPS) |
| Organisationnelle | `ORG` | `Organization` | Rattachée à une structure (EJ ou EG) |
| Applicative | `APP` | `Organization` | Usage applicatif, rattachée à une structure |
| Cabinet | `CAB` | `Practitioner` | BAL partagée au niveau du cabinet |

### Périmètre du projet

Cet IG couvre :

- La **récupération** des BAL MSSanté via l'API FHIR Annuaire Santé (endpoint GET, lecture seule)
- La **mise à jour** des BAL MSSanté via un endpoint PATCH dédié (création, modification, suppression — en cours d'ouverture)

### Dépendances

{% lang-fragment dependency-table.xhtml %}

### Propriété intellectuelle

{% lang-fragment ip-statements.xhtml %}
