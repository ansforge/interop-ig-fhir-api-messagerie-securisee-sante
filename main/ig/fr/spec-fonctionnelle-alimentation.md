# Modèle de données - API Messagerie Sécurisée de Santé (MSSanté) v0.1.0-snapshot

## Modèle de données

Cette page s'adresse à tous les profils. Elle décrit les données associées à chaque type de BAL MSSanté.

### Vue d'ensemble des données

Le tableau ci-dessous récapitule l'ensemble des données portées par une BAL selon son type :

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Adresse BAL | X | X | X | X |
| Type de BAL | X | X | X | X |
| Liste rouge | X | X | X | X |
| BAL préférentielle | X | X | X | X |
| Description |   | X | X | X |
| Service de rattachement |   | X | X |   |
| Responsable |   | X | X |   |
| Identifiant PP (RPPS) | X |   |   | X |
| Identifiant national de structure |   | X | X |   |

Le **discriminant** d'une BAL est son adresse mail, qui l'identifie de façon unique au sein de son porteur.

La **BAL préférentielle** peut être désignée parmi plusieurs BAL d'un même porteur (1 = priorité la plus haute).

L'adresse et le type d'une BAL ne sont **pas modifiables** après création.

-------

### BAL personnelle (PER)

[Modèle logique AS BAL MSS PER](StructureDefinition-as-bal-mss-per.md)

Une BAL PER est attachée à l'identité d'un professionnel de santé, identifié par son numéro RPPS. Elle lui appartient en propre, indépendamment de toute structure d'exercice.

| | | |
| :--- | :--- | :--- |
| Adresse BAL | 1..1 | Adresse de messagerie MSSanté |
| Identifiant PP | 1..1 | Identifiant national du professionnel de santé (RPPS) |
| Liste rouge | 0..1 | `true`: la BAL ne doit pas être publiée |

-------

### BAL organisationnelle (ORG)

[Modèle logique AS BAL MSS ORG](StructureDefinition-as-bal-mss-org.md)

Une BAL ORG est rattachée à une structure de santé (entité juridique ou entité géographique). Elle représente une boîte aux lettres fonctionnelle d'une organisation (ex. service hospitalier, cabinet de groupe).

| | | |
| :--- | :--- | :--- |
| Adresse BAL | 1..1 | Adresse de messagerie MSSanté |
| Identifiant national de structure | 1..1 | Identifiant de la structure porteuse (EJ ou EG) |
| Description | 0..1 | Description fonctionnelle de la BAL |
| Service de rattachement | 0..1 | Nom et description du service de rattachement |
| Responsable | 0..1 | Coordonnées de la ou des personnes responsables au niveau opérationnel |
| Liste rouge | 0..1 | `true`: la BAL ne doit pas être publiée |

-------

### BAL applicative (APP)

[Modèle logique AS BAL MSS APP](StructureDefinition-as-bal-mss-app.md)

Une BAL APP est également rattachée à une structure, mais destinée à un usage applicatif (système d'information, logiciel métier). Elle partage le même modèle de données que la BAL ORG.

| | | |
| :--- | :--- | :--- |
| Adresse BAL | 1..1 | Adresse de messagerie MSSanté |
| Identifiant national de structure | 1..1 | Identifiant de la structure porteuse (EJ ou EG) |
| Description | 0..1 | Description fonctionnelle de la BAL |
| Service de rattachement | 0..1 | Nom et description du service de rattachement |
| Responsable | 0..1 | Coordonnées de la ou des personnes responsables au niveau opérationnel |
| Liste rouge | 0..1 | `true`: la BAL ne doit pas être publiée |

-------

### BAL de cabinet (CAB)

> La prise en charge des BAL CAB est en cours de travaux. Les spécifications ci-dessous sont susceptibles d'évoluer.

[Modèle logique AS BAL MSS CAB](StructureDefinition-as-bal-mss-cab.md)

Une BAL CAB est rattachée à un professionnel de santé, mais représente une boîte partagée au niveau d'un cabinet (ex. secrétariat, cabinet de groupe). Contrairement à la BAL PER, elle n'est pas strictement personnelle.

| | | |
| :--- | :--- | :--- |
| Adresse BAL | 1..1 | Adresse de messagerie MSSanté |
| Description | 0..1 | Description fonctionnelle de la BAL |
| Liste rouge | 0..1 | `true`: la BAL ne doit pas être publiée |

-------

### Champs modifiables

Seules les métadonnées d'une BAL peuvent être mises à jour. L'adresse et le type sont non modifiables.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Liste rouge | X | X | X | X |
| Description |   | X | X | X |
| Service de rattachement |   | X | X |   |
| Responsable |   | X | X |   |

