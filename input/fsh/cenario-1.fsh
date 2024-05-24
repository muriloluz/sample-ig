Profile: ObservationPerfil
Parent: Observation
Id: perfil-observation

* ^status = #draft
// * code = http://loinc.org#3137-7 (exactly) /// 3137-7 Body height Measured
* code = http://hl7.org/fhir/FHIR-version#4.0.1 (exactly)
* identifier 1..1


Instance: medida-um
InstanceOf: ObservationPerfil
Usage: #example

* status = #final
* code = http://hl7.org/fhir/FHIR-version#4.0.1 /// Mesmo CS
* identifier.value = "100"

Instance: generic-observation-conforme
InstanceOf: Observation
Usage: #example

* status = #final
* code = http://hl7.org/fhir/FHIR-version#4.0.1 /// Mesmo CS
* identifier.value = "100"

Profile: DiagnosticoPerfil
Parent: DiagnosticReport
Id: diagnostico-perfil


* code = http://loinc.org#1-8 (exactly)

* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "$this.resolve()"
* result ^slicing.rules = #closed

* result contains weight 1..1 
* result[weight] only Reference(ObservationPerfil)


Instance: another-observation
InstanceOf: Observation
Usage: #example

* status = #final
* code = http://hl7.org/fhir/FHIR-version#3.0.0 (exactly) /// CS diferente
* identifier.value = "100"

Instance: diagnostico-exemplo-valid
InstanceOf: DiagnosticoPerfil
Usage: #example

* status = #final

* result[weight] = Reference(medida-um)

Instance: diagnostico-exemplo-valid-outra
InstanceOf: DiagnosticoPerfil
Usage: #example

* status = #final

* result[weight] = Reference(generic-observation-conforme)

// Instance: diagnostico-examplo-invalid
// InstanceOf: DiagnosticoPerfil
// Usage: #example

// * status = #final
// * result[weight] = Reference(another-observation)


Instance: bundle
InstanceOf: Bundle
Title: "Exemplo de bundle"
Description: "Exemplo de bundle"
Usage: #example

* type = #collection

* entry[0].fullUrl = "https://fhir.fabrica.inf.ufg.br/r4/Observation/another-observation"
* entry[0].resource = another-observation

* entry[1].fullUrl = "https://fhir.fabrica.inf.ufg.br/r4/DiagnosticReport/diagnostico-exemplo-valid"
* entry[1].resource = diagnostico-exemplo-valid

* entry[2].fullUrl = "https://fhir.fabrica.inf.ufg.br/r4/Observation/medida-um"
* entry[2].resource = medida-um

* entry[3].fullUrl = "https://fhir.fabrica.inf.ufg.br/r4/Observation/generic-observation-conforme"
* entry[3].resource = generic-observation-conforme

// * entry[4].fullUrl = "https://fhir.fabrica.inf.ufg.br/r4/DiagnosticReport/diagnostico-examplo-invalid"
// * entry[4].resource = diagnostico-examplo-invalid
