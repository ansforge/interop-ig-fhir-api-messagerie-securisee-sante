// ============================================================
// Praticiens de démonstration — BAL MSS PER
// Données fictives, à usage illustratif uniquement
// ============================================================

Instance: mss-practitioner-bal-per-dupont
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner — BAL PER (exemple complet)"
Description: "Exemple fictif de Practitioner portant une BAL MSSanté personnelle (PER)."

* id = "mss-practitioner-bal-per-dupont"
* meta.lastUpdated = "2025-11-04T09:12:00.000+01:00"
* active = true
* identifier[0].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[=].use = #official
* identifier[=].value = "810003456789"
* name[0].use = #official
* name[=].family = "DUPONT"
* name[=].given[0] = "Jean-Marie"
* telecom[0].system = #email
* telecom[=].value = "jean-marie.dupont@infirmier.mssante.fr"
* telecom[=].extension[0].url = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
* telecom[=].extension[=].extension[0].url = "type"
* telecom[=].extension[=].extension[=].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL#PER
* telecom[=].extension[=].extension[+].url = "listeRouge"
* telecom[=].extension[=].extension[=].valueBoolean = false


Instance: mss-practitioner-bal-per-martin
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner — BAL PER (2e praticien)"
Description: "Exemple fictif de Practitioner portant une BAL MSSanté personnelle (PER)."

* id = "mss-practitioner-bal-per-martin"
* meta.lastUpdated = "2025-10-17T14:30:00.000+02:00"
* active = true
* identifier[0].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[=].use = #official
* identifier[=].value = "810007654321"
* name[0].use = #official
* name[=].family = "MARTIN"
* name[=].given[0] = "Sophie"
* telecom[0].system = #email
* telecom[=].value = "sophie.martin@medecin.mssante.fr"
* telecom[=].extension[0].url = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
* telecom[=].extension[=].extension[0].url = "type"
* telecom[=].extension[=].extension[=].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL#PER
* telecom[=].extension[=].extension[+].url = "listeRouge"
* telecom[=].extension[=].extension[=].valueBoolean = false


Instance: mss-practitioner-bal-per-dupont-elements
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner — BAL PER (éléments restreints, _elements=identifier,telecom)"
Description: "Exemple fictif illustrant la réponse avec _elements=identifier,telecom. Le tag SUBSETTED signale que la ressource est incomplète."

* id = "mss-practitioner-bal-per-dupont-elements"
* meta.lastUpdated = "2025-11-04T09:12:00.000+01:00"
* meta.tag[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationValue"
* meta.tag[=].code = #SUBSETTED
* identifier[0].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[=].use = #official
* identifier[=].value = "810003456789"
* telecom[0].system = #email
* telecom[=].value = "jean-marie.dupont@infirmier.mssante.fr"
* telecom[=].extension[0].url = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
* telecom[=].extension[=].extension[0].url = "type"
* telecom[=].extension[=].extension[=].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL#PER
* telecom[=].extension[=].extension[+].url = "listeRouge"
* telecom[=].extension[=].extension[=].valueBoolean = false


Instance: mss-practitioner-bal-per-martin-elements
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner — BAL PER (éléments restreints, 2e praticien)"
Description: "Exemple fictif illustrant la réponse avec _elements=identifier,telecom pour un 2e praticien."

* id = "mss-practitioner-bal-per-martin-elements"
* meta.lastUpdated = "2025-10-17T14:30:00.000+02:00"
* meta.tag[0].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationValue"
* meta.tag[=].code = #SUBSETTED
* identifier[0].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[=].use = #official
* identifier[=].value = "810007654321"
* telecom[0].system = #email
* telecom[=].value = "sophie.martin@medecin.mssante.fr"
* telecom[=].extension[0].url = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
* telecom[=].extension[=].extension[0].url = "type"
* telecom[=].extension[=].extension[=].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL#PER
* telecom[=].extension[=].extension[+].url = "listeRouge"
* telecom[=].extension[=].extension[=].valueBoolean = false
