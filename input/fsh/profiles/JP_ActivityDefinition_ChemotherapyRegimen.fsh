Profile: JP_ActivityDefinition_ChemotherapyRegimen_Injection
Parent: ActivityDefinition
Id: jp-activitydefinition-chemotherapyregimen-injection
Title: "JP Core ActivityDefinition ChemotherapyRegimen Injection Profile"
Description: "このプロファイルはActivityDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ActivityDefinition_ChemotherapyRegimen_Injection"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "化学療法レジメンの注射薬剤投与に関する定義情報"
* . ^definition = "化学療法の1つのRP内における、抗がん剤（注射薬）、分子標的薬、免疫チェックポイント阻害薬、輸液、支持療法（制吐剤など）の組み合わせと、基準投与量、用法（手技、ルート、ライン等）、投与速度などを定義した情報"
* contained 1..*
* contained only JP_Medication_ChemotherapyRegimen
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    rpNumber 1..1
* identifier[rpNumber]
  * system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
  * value 1..
  * use 0..0
  * type 0..0
  * period 0..0
* name 0..0
* title 0..0
* subtitle 0..0
// * status
* experimental 0..0
* subject[x] 0..0
* date 0..0
* publisher 0..0
* contact 0..0
* description 0..0
* useContext 0..0
* jurisdiction 0..0
* purpose 0..0
* usage 0..0
* copyright 0..0
* approvalDate 0..0
* lastReviewDate 0..0
* effectivePeriod 0..0
* topic 0..0
* author 0..0
* editor 0..0
* reviewer 0..0
* endorser 0..0
* relatedArtifact 0..0
* library 0..0
* kind = #MedicationRequest
* location 0..0
* profile 0..0
* code 0..0
* intent 0..0
* priority 0..0
* doNotPerform 0..0
* timing[x] 0..0
* participant 0..0
* product[x] only Reference(Medication)
* productReference only Reference(JP_Medication_ChemotherapyRegimen)
  * ^short = "医薬品の情報"
* quantity 0..0
* dosage only JP_MedicationDosage_Injection
  * ^short = "医薬品の服用方法等"
* bodySite 0..0
* specimenRequirement 0..0
* observationRequirement 0..0
* observationResultRequirement 0..0
* transform 0..0
* dynamicValue 0..0

Profile: JP_ActivityDefinition_ChemotherapyRegimen_Oral
Parent: ActivityDefinition
Id: jp-activitydefinition-chemotherapyregimen-oral
Title: "JP Core ActivityDefinition ChemotherapyRegimen Oral Profile"
Description: "このプロファイルはActivityDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ActivityDefinition_ChemotherapyRegimen_Oral"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "化学療法レジメンの内服薬剤投与に関する定義情報"
* . ^definition = "化学療法の1つのRP内における、抗がん剤（内服薬）、支持療法（制吐剤など）の組み合わせと、基準投与量、用法などを定義した情報"
* product[x] only CodeableConcept
* productCodeableConcept from $JP_MedicationCode_VS (preferred)
* productCodeableConcept ^binding.description = "医薬品コード"
* dosage only JP_MedicationDosage

Profile: JP_Medication_ChemotherapyRegimen
Parent: JP_Medication
Id: jp-medication-chemotherapyregimen
Title: "JP Core Medication ChemotherapyRegimen Profile"
Description: "hoge"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication_ChemotherapyRegimen"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "化学療法レジメンの薬剤に関する定義情報"
* . ^definition = "化学療法における、混注する薬剤と、1薬剤ごとの基準投与量（成分量）を定義した情報"

* code 0..0
* manufacturer 0..0
* form 0..0
* amount 0..0
* ingredient 1..*
* ingredient.item[x] only CodeableConcept
  * ^short = "成分コード"
  * ^definition = "薬剤を識別するコードを記述する。混注する薬剤を1リソースで記述できるようにすることを目的としているが、単一薬剤を投与する場合においても、データ構造を統一するため当該要素に記述する"
* ingredient.itemCodeableConcept.coding ^slicing.discriminator.type = #value
* ingredient.itemCodeableConcept.coding ^slicing.discriminator.path = "system"
* ingredient.itemCodeableConcept.coding ^slicing.rules = #open
* ingredient.itemCodeableConcept.coding ^slicing.ordered = false
* ingredient.itemCodeableConcept.coding contains
    yjCode 0..1 and
    hot9Code 0..1 
* ingredient.itemCodeableConcept.coding[yjCode] from $JP_MedicationCodeYJ_VS (required)
  * system = $JP_MedicationCodeYJ_CS (exactly)
  * code 1..
  * ^short = "YJコード（個別医薬品コード）"
  * id 0..0
  * version 0..0
  * userSelected 0..0
* ingredient.itemCodeableConcept.coding[hot9Code] from $JP_MedicationCodeHOT9_VS (required)
  * system = $JP_MedicationCodeHOT9_CS (exactly)
  * code 1..
  * ^short = "MEDIS 医薬品基準番号（ＨＯＴ９）"
  * id 0..0
  * version 0..0
  * userSelected 0..0
* ingredient.strength 1..1
* ingredient.strength only JP_MedicationRatio_Amount
  * extension[strengthType] 0..0
  * ^short = "成分量"
  * ^definition = "薬剤の基準投与量(e.g. mg/m2)、または実投与量(e.g. mg/body)を記述する。"
  * numerator 1..1
  * denominator 1..1
* batch 0..0
