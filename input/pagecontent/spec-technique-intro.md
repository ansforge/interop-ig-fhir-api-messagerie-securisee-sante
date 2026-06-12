<div style="background-color: #f0f0f0; border-left: 4px solid #666; padding: 10px; width: 65%">
Cette page s'adresse aux développeurs et intégrateurs. Elle présente le contexte technique de l'API.
</div>

### Contexte technique

Cet IG s'appuie sur **FHIR R4** (version 4.0.1). Les BAL MSSanté sont modélisées comme éléments `telecom` au sein de leurs ressources porteuses (`Practitioner`, `PractitionerRole`, `Organization`), enrichis de l'extension [`as-ext-mailbox-mss-metadata`](https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata).

### Format des opérations d'écriture

Les opérations d'écriture utilisent le **FHIR Patch** au format `application/fhir+json`. Ce format utilise une ressource `Parameters` avec des opérations FHIRPath, permettant de cibler précisément l'élément `telecom` à modifier grâce à l'adresse de la BAL.

Trois types d'opérations sont supportés :

| Opération | Description |
|-----------|-------------|
| `replace` | Remplacer un attribut ou un ContactPoint entier |
| `insert` | Ajouter une nouvelle BAL |
| `delete` | Supprimer une BAL existante |
