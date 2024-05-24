Profile: Individuo
Parent: Patient
Id: Individuo

* maritalStatus 1..1

Profile: Ocupacao
Parent: Observation
Id: ocupacao

* code = http://loing.org#21843-8 // History of Usual occupation
* subject only Reference(Individuo)

* obeys PacienteDeveSerIndividuo

Invariant: PacienteDeveSerIndividuo
Description: "Paciente deve ser indivíduo"
Expression: "$this.subject.resolve().conformsTo('https://fhir.fabrica.inf.ufg.br/r4/sample/StructureDefinition/Individuo')"
Severity: #error

/// Apesar do target profile correto no Json, essa configuração é opcional, mas podemos forçar.


Instance: conforme-individuo
InstanceOf: Individuo

* maritalStatus = #S

Instance: generic-patient
InstanceOf: Patient

Instance: generic-patient-conforme
InstanceOf: Patient
* maritalStatus = #W

Instance: uma-ocupacao
InstanceOf: Ocupacao

* status = #final
* code = http://loing.org#21843-8 // History of Usual occupation
* subject = Reference(generic-patient-conforme)