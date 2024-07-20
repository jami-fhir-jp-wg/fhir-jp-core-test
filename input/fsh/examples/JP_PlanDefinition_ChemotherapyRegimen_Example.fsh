Instance: jp-plandefinition-chemotherapyregimen-example-1
InstanceOf: JP_PlanDefinition_ChemotherapyRegimen
Title: "JP Core PlanDefinition ChemotherapyRegimen Example 化学療法レジメン（大腸癌 mFOLFOX6）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6）"
Usage: #example
* contained[0] = jp-plandefinition-chemotherapyregimen-example-1.1
* contained[1] = jp-plandefinition-chemotherapyregimen-example-1.2
* contained[2] = jp-plandefinition-chemotherapyregimen-example-1.3
* contained[3] = jp-plandefinition-chemotherapyregimen-example-1.4
* extension[0]
  * url = #JP_PlanDefinition_ChemotherapyRegimen_RegimenType
  * valueCodeableConcept
    * text = "mFOLFOX6"
* identifier
  * system = "http://terminology.sample.com/IdSystem/regimen/1311234567"
  * value = "123456789012345"
* status = #active
* useContext
  * code
    * system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
    * code = #focus
    * display = "Clinical Focus"
  * valueCodeableConcept = $JP_ConditionDiseaseCodeMEDISRecordNo_CS#20069739 "大腸癌"
    * extension[0]
      * url = #JP_Condition_DiseasePrefixModifier
      * valueCodeableConcept = $JP_ConditionDiseaseModifierMEDISRecordNo_CS#27002376 "切除不能な進行・再発の"
    * text = "切除不能な進行・再発の大腸癌"
* action[0]
  * textEquivalent = "14日サイクルを 6回繰り返す"
  * timingTiming
    * repeat
      * count = 6
      * duration = 14
      * durationUnit = #d
  * action[0]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
      * extension[0]
        * url = "day"
        * valueInteger = 1
    * definitionCanonical = Canonical(jp-plandefinition-chemotherapyregimen-example-1.1)
  * action[1]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
      * extension[0]
        * url = "day"
        * valueInteger = 1
    * definitionCanonical = Canonical(jp-plandefinition-chemotherapyregimen-example-1.2)
  * action[2]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
      * extension[0]
        * url = "day"
        * valueInteger = 1
    * definitionCanonical = Canonical(jp-plandefinition-chemotherapyregimen-example-1.3)
  * action[3]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
      * extension[0]
        * url = "day"
        * valueInteger = 1
    * definitionCanonical = Canonical(jp-plandefinition-chemotherapyregimen-example-1.4)

Instance: jp-plandefinition-chemotherapyregimen-example-1.1
InstanceOf: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Example 化学療法レジメン（大腸癌 mFOLFOX6:レボホリナート）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:レボホリナート）"
Usage: #inline
* contained[0] = jp-plandefinition-chemotherapyregimen-medication-example-1.1
* identifier[rpNumber]
  * system = "urn:oid:1.2.392.100495.20.3.81"
  * value = "1"
* status = #active
* dosage[0]
  * method = $JP_MedicationMethodJAMIDetailUsage_CS#30 "静脈注射"
  * doseAndRate[0]
    * rateQuantity
      * value = 2
      * unit = "時間"
      * system = "http://unitsofmeasure.org"
      * code = #h

Instance: jp-plandefinition-chemotherapyregimen-medication-example-1.1
InstanceOf: JP_Medication
Title: "JP Core Medication Example 化学療法レジメン（大腸癌 mFOLFOX6:レボホリナート）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:レボホリナート）"
Usage: #inline
* status = #active
* ingredient[0]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107359101 "大塚糖液５％　２５０ｍＬ"
  * strength.numerator = 250 $JP_MedicationUnitMERIT9_CS#ML "ml"
  * strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"
* ingredient[1]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#117534901 "アイソボリン点滴静注用１００ｍｇ"
  * strength.numerator = 200 $JP_MedicationUnitMERIT9_CS#MG "mg"
  * strength.denominator
    * value = 1
    * unit = "m2"

Instance: jp-plandefinition-chemotherapyregimen-example-1.2
InstanceOf: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Example 化学療法レジメン（大腸癌 mFOLFOX6:オキサリプラチン）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:オキサリプラチン）"
Usage: #inline
* contained[0] = jp-plandefinition-chemotherapyregimen-medication-example-1.2
* identifier[rpNumber]
  * system = "urn:oid:1.2.392.100495.20.3.81"
  * value = "2"
* status = #active
* dosage[0]
  * method = $JP_MedicationMethodJAMIDetailUsage_CS#30 "静脈注射"
  * doseAndRate[0]
    * rateQuantity
      * value = 2
      * unit = "時間"
      * system = "http://unitsofmeasure.org"
      * code = #h

Instance: jp-plandefinition-chemotherapyregimen-medication-example-1.2
InstanceOf: JP_Medication
Title: "JP Core Medication Example 化学療法レジメン（大腸癌 mFOLFOX6:オキサリプラチン）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:オキサリプラチン）"
Usage: #inline
* status = #active
* ingredient[0]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107359101 "大塚糖液５％　２５０ｍＬ"
  * strength.numerator = 250 $JP_MedicationUnitMERIT9_CS#ML "ml"
  * strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"
* ingredient[1]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#119323701 "エルプラット点滴静注液１００ｍｇ　２０ｍＬ"
  * strength.numerator = 85 $JP_MedicationUnitMERIT9_CS#MG "mg"
  * strength.denominator
    * value = 1
    * unit = "m2"

Instance: jp-plandefinition-chemotherapyregimen-example-1.3
InstanceOf: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Example 化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル）"
Usage: #inline
* contained[0] = jp-plandefinition-chemotherapyregimen-medication-example-1.3
* identifier[rpNumber]
  * system = "urn:oid:1.2.392.100495.20.3.81"
  * value = "3"
* status = #active
* dosage[0]
  * method = $JP_MedicationMethodJAMIDetailUsage_CS#30 "静脈注射"
  * doseAndRate[0]
    * extension[0]
      * url = #JP_MedicationExampleRateComment_CS
      * valueCodeableConcept
        * text = "全開で"

Instance: jp-plandefinition-chemotherapyregimen-medication-example-1.3
InstanceOf: JP_Medication
Title: "JP Core Medication Example 化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル）"
Usage: #inline
* status = #active
* ingredient[0]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107667701 "大塚生食注　１００ｍＬ"
  * strength.numerator = 50 $JP_MedicationUnitMERIT9_CS#ML "ml"
  * strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"
* ingredient[1]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#120479701 "エルプラット点滴静注液１００ｍｇ　２０ｍＬ"
  * strength.numerator = 400 $JP_MedicationUnitMERIT9_CS#MG "mg"
  * strength.denominator
    * value = 1
    * unit = "m2"

Instance: jp-plandefinition-chemotherapyregimen-example-1.4
InstanceOf: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Example 化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル/持続）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル/持続）"
Usage: #inline
* contained[0] = jp-plandefinition-chemotherapyregimen-medication-example-1.4
* identifier[rpNumber]
  * system = "urn:oid:1.2.392.100495.20.3.81"
  * value = "4"
* status = #active
* dosage[0]
  * extension[0]
    * url = #JP_MedicationDosage_Device
    * valueReference
      * type = "Device"
      * display = "インフューザーポンプ"
  * method = $JP_MedicationMethodJAMIDetailUsage_CS#31 "中心静脈注射"
  * doseAndRate[0]
    * rateQuantity
      * value = 46
      * unit = "時間"
      * system = "http://unitsofmeasure.org"
      * code = #h

Instance: jp-plandefinition-chemotherapyregimen-medication-example-1.4
InstanceOf: JP_Medication
Title: "JP Core Medication Example 化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル/持続）"
Description: "化学療法レジメン（大腸癌 mFOLFOX6:フルオロウラシル/持続）"
Usage: #inline
* status = #active
* ingredient[0]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107667701 "大塚生食注　１００ｍＬ"
  * strength.numerator = 100 $JP_MedicationUnitMERIT9_CS#ML "ml"
  * strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"
* ingredient[1]
  * itemCodeableConcept = $JP_MedicationCodeHOT9_CS#120479701 "エルプラット点滴静注液１００ｍｇ　２０ｍＬ"
  * strength.numerator = 2400 $JP_MedicationUnitMERIT9_CS#MG "mg"
  * strength.denominator
    * value = 1
    * unit = "m2"
