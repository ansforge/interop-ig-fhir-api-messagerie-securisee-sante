// ============================================================
// Bundles de démonstration — Réponses à une recherche BAL PER
// ============================================================

Instance: mss-bundle-bal-per-full
InstanceOf: Bundle
Usage: #example
Title: "Bundle searchset BAL PER — réponse complète"
Description: "Exemple de Bundle de type searchset retourné en réponse à : GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=...PER. Contient l'intégralité des données des ressources."

* type = #searchset
* total = 2

* link[0].relation = "self"
* link[=].url = "[base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER"

* entry[0].fullUrl = "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-dupont"
* entry[=].resource = mss-practitioner-bal-per-dupont
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-martin"
* entry[=].resource = mss-practitioner-bal-per-martin
* entry[=].search.mode = #match


Instance: mss-bundle-bal-per-elements
InstanceOf: Bundle
Usage: #example
Title: "Bundle searchset BAL PER — réponse restreinte (_elements)"
Description: "Exemple de Bundle de type searchset retourné en réponse à : GET [base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=...PER&_elements=identifier,telecom. Seuls identifier et telecom sont présents (meta.tag SUBSETTED ajouté par le serveur)."

* type = #searchset
* total = 2

* link[0].relation = "self"
* link[=].url = "[base]?_type=Practitioner,PractitionerRole&mailbox-mss-type=https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie|PER&_elements=identifier,telecom"

* entry[0].fullUrl = "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-dupont-elements"
* entry[=].resource = mss-practitioner-bal-per-dupont-elements
* entry[=].search.mode = #match

* entry[+].fullUrl = "https://gateway.api.esante.gouv.fr/fhir/v1/Practitioner/mss-practitioner-bal-per-martin-elements"
* entry[=].resource = mss-practitioner-bal-per-martin-elements
* entry[=].search.mode = #match
