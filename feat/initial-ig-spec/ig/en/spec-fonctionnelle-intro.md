# Vue d'ensemble - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0

## Vue d'ensemble

 
There is no translation page available for the current page, so it has been rendered in the default language 

Cette page s'adresse à tous les profils. Elle présente le contexte MSSanté, les types de BAL et l'architecture générale de l'API.

### MSSanté

**MSSanté** (Messagerie Sécurisée de Santé) est le service national de messagerie chiffrée pour les professionnels de santé. Il permet l'échange sécurisé de données médicales entre professionnels et structures de santé.

Une **BAL MSSanté** (Boîte Aux Lettres) est une adresse mail sécurisée. Elle peut être rattachée à :

* un professionnel de santé (via son identifiant RPPS),
* une situation d'exercice (RPPS + structure),
* ou une structure de santé.

### Types de BAL

Il existe quatre types de BAL, identifiés par un code et associés à des ressources FHIR porteuses spécifiques :

| | | | |
| :--- | :--- | :--- | :--- |
| `PER` | Personnelle | `Practitioner`(RPPS seul),`PractitionerRole`(RPPS + structure) | BAL attachée à l'identifiant d'un professionnel |
| `ORG` | Organisationnelle | `Organization` | BAL attachée à une structure (EJ ou EG) |
| `APP` | Applicative | `Organization` | BAL applicative attachée à une structure |
| `CAB` | Cabinet | `Practitioner` | BAL de cabinet d'un professionnel |

### Architecture de l'API

L'API repose sur deux endpoints distincts :

* **Endpoint GET** — l'API FHIR Annuaire Santé existante (lecture seule), utilisée pour récupérer les ressources porteuses et leurs BAL.
* **Endpoint PATCH** — un endpoint en écriture, permettant aux opérateurs MSSanté de modifier les métadonnées des BAL via PATCH FHIRPath sur la ressource porteuse.

> L'endpoint PATCH est en cours d'ouverture. Les opérations d'écriture décrites dans cet IG sont spécifiées à titre prospectif.

Les opérateurs MSSanté accèdent, dans la même réponse, à l'ensemble des données du professionnel ou de la structure porteuse (identifiants, qualification, adresse, situation d'exercice), sans requête supplémentaire.

