Profile: JP_PlanDefinition_ChemotherapyRegimen
Parent: PlanDefinition
Id: jp-plandefinition-chemotherapyregimen
Title: "JP Core PlanDefinition ChemotherapyRegimen Profile"
Description: "このプロファイルはPlanDefinitionリソースに対して、化学療法レジメンの定義に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_PlanDefinition_ChemotherapyRegimen"
* ^status = #draft
* ^date = "2023-11-30"
* . ^short = "化学療法レジメンの定義情報"
* . ^definition = "化学療法における抗がん剤（注射薬、内服薬）、分子標的薬、免疫チェックポイント阻害薬、輸液、支持療法（制吐剤など）の組み合わせと、投与スケジュール、治療期間などを示した計画の情報"
* extension contains
    JP_PlanDefinition_ChemotherapyRegimen_RegimenType named regimenType ..1
* contained 1..*
* contained only JP_ActivityDefinition_ChemotherapyRegimen_Injection or JP_ActivityDefinition_ChemotherapyRegimen_Oral
* name 0..0
* title 0..0
* subtitle 0..0
* type
  * ^short = "プラン定義種別（固定値: clinical-protocol）"
  * id 0..0
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/plan-definition-type"
    * code = #clinical-protocol
    * display = "Clinical Protocol"
// * status
* experimental 0..0
* subject[x] 0..0
* date 
  * ^short = "最終変更日"
* publisher
  * ^short = "発行元施設名"
* contact 0..0
* description 0..0
* useContext ^short = "適応疾患（がんの種類）"
* useContext.code
  * ^short = "コンテキストの種別（固定値: focus）"
  * system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
  * code = #focus
  * display = "Clinical Focus"
* useContext.value[x] only CodeableConcept
  * ^short = "傷病名コード"
  * ^definition = "レジメンの適応疾患を識別するための傷病名コードを指定する。"
* useContext.valueCodeableConcept.coding ^slicing.discriminator.type = #value
* useContext.valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* useContext.valueCodeableConcept.coding ^slicing.rules = #open
* useContext.valueCodeableConcept.coding ^slicing.ordered = false
* useContext.valueCodeableConcept.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1 and
    icd10 0..1
* useContext.valueCodeableConcept.coding[medisExchange] from $JP_ConditionDiseaseCodeMEDISExchange_VS (required)
  * system = $JP_ConditionDiseaseCodeMEDISExchange_CS (exactly)
  * code 1..
  * ^short = "MEDIS ICD10対応標準病名マスター(交換用コード)。【詳細参照】"
  * ^definition = "MEDIS ICD10対応標準病名マスターの管理番号。"
  * ^comment = "JP_ConditionDiseaseCodeMEDISExchange_VSの中から適切なコードを指定する。"
* useContext.valueCodeableConcept.coding[medisRecordNo] from $JP_ConditionDiseaseCodeMEDISRecordNo_VS (required)
  * system = $JP_ConditionDiseaseCodeMEDISRecordNo_CS (exactly)
  * code 1..
  * ^short = "MEDIS ICD10対応標準病名マスター(管理番号)。【詳細参照】"
  * ^definition = "MEDIS ICD10対応標準病名マスターの管理番号。"
  * ^comment = "JP_ConditionDiseaseCodeMEDISRecordNo_VSの中から適切なコードを指定する。"
* useContext.valueCodeableConcept.coding[receipt] from $JP_ConditionDiseaseCodeReceipt_VS (required)
  * .system = $JP_ConditionDiseaseCodeReceipt_CS (exactly)
  * code 1..
  * ^short = "レセプト電算用傷病名マスター。【詳細参照】"
  * ^definition = "レセプト電算用傷病名マスター。"
  * ^comment = "JP_ConditionDiseaseCodeReceipt_VSの中から適切なコードを指定する。"
* useContext.valueCodeableConcept.coding[icd10] from $JP_ConditionDiseaseCodeICD10_VS (required)
  * system = $JP_ConditionDiseaseCodeICD10_CS (exactly)
  * code 1..
  * ^short = "ICD-10コード。【詳細参照】"
  * ^definition = "ICD-10コード。"
  * ^comment = "JP_ConditionDiseaseCodeICD10_VSの中から適切なコードを指定する。"
* useContext.valueCodeableConcept.extension ^slicing.discriminator.type = #value
* useContext.valueCodeableConcept.extension ^slicing.discriminator.path = "url"
* useContext.valueCodeableConcept.extension ^slicing.rules = #open
* useContext.valueCodeableConcept.extension contains
    JP_Condition_DiseasePrefixModifier named diseasePrefixModifier ..* and
    JP_Condition_DiseasePostfixModifier named diseasePostfixModifier ..*
* jurisdiction 0..0
* purpose 0..0
* usage 0..0
* copyright 0..0
* approvalDate
  * ^short = "承認日"
* lastReviewDate 0..0
* effectivePeriod
  * ^short = "有効期間"
* topic 0..0
* author
  * ^short = "作成者"
* editor
  * ^short = "編集者"
* reviewer 0..0
* endorser 0..0
* relatedArtifact
  * ^short = "参考文献"
* library 0..0
* goal 0..0

* action
  * extension contains
    JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle named timingDaysOfCycle ..*
  * prefix 0..0
  * title 0..0
  * description 0..0
  // * textEquivalent
  * priority 0..0
  * code 0..0
  * reason 0..0
  * documentation 0..0
  * goalId 0..0
  * subject[x] 0..0
  * trigger 0..0
  * condition 0..0
  * input 0..0
  * output 0..0
  // * relatedAction
  * timing[x] only Timing
    * ^short = "総サイクル（n日サイクルを n回繰り返す等）"
  * participant 0..0
  * type 0..0
  // * groupingBehavior
  // * selectionBehavior
  // * requiredBehavior
  // * precheckBehavior
  // * cardinalityBehavior
  * definition[x] only Canonical(JP_ActivityDefinition_ChemotherapyRegimen_Injection or JP_ActivityDefinition_ChemotherapyRegimen_Oral)
    * ^short = "医薬品情報のActivityDefinitionを参照する"
  * transform 0..0
  // * dynamicValue

Extension: JP_PlanDefinition_ChemotherapyRegimen_RegimenType
Id: jp-plandefinition-chemotherapyregimen-regimentype
Title: "JP Core PlanDefinition ChemotherapyRegimen RegimenType Extension"
Description: "レジメン種別に関する情報を格納するためのExtension"
* ^url = $JP_PlanDefinition_ChemotherapyRegimen_RegimenType
* ^status = #draft
* ^date = "2023-11-30"
* ^context.type = #element
* ^context.expression = "PlanDefinition"
* . ^short = "レジメン種別"
* . ^comment = "レジメン種別（e.g.,FOLFOX,FOLFIRI）に関する情報を表現する拡張"
* url = $JP_PlanDefinition_ChemotherapyRegimen_RegimenType (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_ChemotherapyRegimen_RegimenType_VS (example)

Extension: JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle
Id: jp-plandefinition-chemotherapyregimen-timingdaysofcycle
Title: "JP Core PlanDefinition ChemotherapyRegimen TimingDaysOfCycle Extension"
Description: "周期の日数に関する情報を格納するためのExtension"
* ^url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle"
* ^status = #draft
* ^date = "2023-11-30"
* ^context.type = #element
* ^context.expression = "PlanDefinition.action"
* . ^short = "周期の日数"
* . ^comment = "周期の日数に関する情報を表現する拡張"
* url = "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle" (exactly)
* value[x] only integer
