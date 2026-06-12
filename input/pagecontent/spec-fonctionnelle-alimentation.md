<div style="background-color: #fff9e6; border-left: 4px solid #ff9800; padding: 10px; width: 65%">
Cette page s'adresse à tous les profils. Elle décrit les données associées à chaque type de BAL MSSanté.
</div>

### Données par type de BAL

| Donnée | PER | ORG | APP | CAB | Chemin FHIR |
|--------|:---:|:---:|:---:|:---:|-------------|
| Adresse BAL | X | X | X | X | `telecom.value` |
| Type de BAL | X | X | X | X | `telecom.extension[as-mailbox-mss-metadata].extension[type]` |
| Liste rouge | X | X | X | X | `telecom.extension[as-mailbox-mss-metadata].extension[listeRouge]` |
| Description | | X | X | X | `telecom.extension[as-mailbox-mss-metadata].extension[description]` |
| Service de rattachement | | X | X | | `telecom.extension[as-mailbox-mss-metadata].extension[service]` |
| Responsable | | X | X | | `telecom.extension[as-mailbox-mss-metadata].extension[responsible]` |
| BAL préférentielle | X | X | X | X | `telecom.rank` (1 = priorité la plus haute) |
| Identifiant PP (RPPS) | X | | | X | `Practitioner.identifier` / `PractitionerRole.identifier` |
| Identifiant national de structure | | X | X | | `Organization.identifier` |

Le **discriminant** d'une BAL est son adresse mail (`ContactPoint.value`), qui l'identifie de façon unique au sein d'une ressource porteuse.

La **BAL préférentielle** peut être désignée via le champ `rank` du ContactPoint (entier, 1 = priorité la plus haute).

### Champs modifiables

Seules les métadonnées portées par l'extension `as-ext-mailbox-mss-metadata` peuvent être mises à jour via l'endpoint PATCH :

| Champ | PER | ORG | APP | CAB |
|-------|:---:|:---:|:---:|:---:|
| Liste rouge (`listeRouge`) | X | X | X | X |
| Description (`description`) | | X | X | X |
| Service de rattachement (`service`) | | X | X | |
| Responsable (`responsible`) | | X | X | |

L'adresse de la BAL (`telecom.value`) et le type (`type`) ne sont **pas modifiables**.

### Modèles logiques

Les quatre types de BAL sont formalisés par des modèles logiques :

* [AS BAL MSS PER](StructureDefinition-as-bal-mss-per.html)
* [AS BAL MSS ORG](StructureDefinition-as-bal-mss-org.html)
* [AS BAL MSS APP](StructureDefinition-as-bal-mss-app.html)
* [AS BAL MSS CAB](StructureDefinition-as-bal-mss-cab.html)
