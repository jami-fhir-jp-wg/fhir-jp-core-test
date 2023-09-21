// ==============================
//   Profile 定義
// ==============================
Profile: JP_Condition_Disease
Parent: JP_Condition
Id: jp-condition-disease
Title: "JP Core Condition Disease Profile"
Description: "このプロファイルはConditionリソースに対して、患者の病名情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition_Disease"
* ^status = #active
* ^date = "2023-08-05"
* . ^short = "Detailed information about disease. 患者の病名に関する詳細な情報"
* . ^definition = "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern.\r\n\r\n健康上の懸念となるレベルに達した、身体的、精神的、社会的な負の状態(condition)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床的概念(clinical concept)。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Condition_DiseaseOutcome named diseaseOutcome ..1
//* category MS
//* category ^short = "病名の分類を表すコード。"
//* category ^definition = "病名の分類を表すコード。"
//* category ^slicing.discriminator.type = #value
//* category ^slicing.discriminator.path = "coding.system"
//* category ^slicing.rules = #open
//* category ^slicing.ordered = false
//* category contains diseaseType 1..1
//* category[diseaseType] from $JP_ConditionDiseaseType_VS (required)
//* category[diseaseType].coding.system = $JP_ConditionDiseaseType_CS (exactly)
//* category[diseaseType].coding.code 1..
//* category[diseaseType] ^short = "病名の診断区分を表すコード。【詳細参照】"
//* category[diseaseType] ^definition = "病名の診断区分を表すコード。"
//* category[diseaseType] ^comment = "JP_ConditionDiseaseType_VSの中から適切なコードを指定する。"
* code ^short = "病名の識別コード。【詳細参照】"
* code ^definition = "病名を識別するためのコード。"
* code ^comment = "JP_Condition_DiseaseCode_VSの中から適切な病名識別コードを指定する"
* code MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1 and
    icd10 0..1
* code.coding[medisExchange] from $JP_ConditionDiseaseCodeMEDISExchange_VS (required)
* code.coding[medisExchange].system = $JP_ConditionDiseaseCodeMEDISExchange_CS (exactly)
* code.coding[medisExchange].code 1..
* code.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(交換用コード)。【詳細参照】"
* code.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの管理番号。"
* code.coding[medisExchange] ^comment = "JP_ConditionDiseaseCodeMEDISExchange_VSの中から適切なコードを指定する。"
* code.coding[medisRecordNo] from $JP_ConditionDiseaseCodeMEDISRecordNo_VS (required)
* code.coding[medisRecordNo].system = $JP_ConditionDiseaseCodeMEDISRecordNo_CS (exactly)
* code.coding[medisRecordNo].code 1..
* code.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスター(管理番号)。【詳細参照】"
* code.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの管理番号。"
* code.coding[medisRecordNo] ^comment = "JP_ConditionDiseaseCodeMEDISRecordNo_VSの中から適切なコードを指定する。"
* code.coding[receipt] from $JP_ConditionDiseaseCodeReceipt_VS (required)
* code.coding[receipt].system = $JP_ConditionDiseaseCodeReceipt_CS (exactly)
* code.coding[receipt].code 1..
* code.coding[receipt] ^short = "レセプト電算用傷病名マスター。【詳細参照】"
* code.coding[receipt] ^definition = "レセプト電算用傷病名マスター。"
* code.coding[receipt] ^comment = "JP_ConditionDiseaseCodeReceipt_VSの中から適切なコードを指定する。"
* code.coding[icd10] from $JP_ConditionDiseaseCodeICD10_VS (required)
* code.coding[icd10].system = $JP_ConditionDiseaseCodeICD10_CS (exactly)
* code.coding[icd10].code 1..
* code.coding[icd10] ^short = "ICD-10コード。【詳細参照】"
* code.coding[icd10] ^definition = "ICD-10コード。"
* code.coding[icd10] ^comment = "JP_ConditionDiseaseCodeICD10_VSの中から適切なコードを指定する。"
* code.extension ^slicing.discriminator.type = #value
* code.extension ^slicing.discriminator.path = "url"
* code.extension ^slicing.rules = #open
* code.extension contains
    JP_Condition_DiseasePrefixModifier named diseasePrefixModifier ..* and
    JP_Condition_DiseasePostfixModifier named diseasePostfixModifier ..*

// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_Condition_DiseaseOutcome
//-------------------------------
Extension: JP_Condition_DiseaseOutcome
Id: jp-condition-disease-outcome
Title: "JP Core Disease Outcome Extension"
Description: "病名の転帰区分を格納するための拡張"
* ^url = $JP_Condition_DiseaseOutcome
* ^status = #active
* ^date = "2023-08-05"
* ^context.type = #element
* ^context.expression = "Condition"
* . ^short = "転帰区分"
* . ^definition = "病名の転帰区分を格納するための拡張。\r\n病名の転帰区分をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseaseOutcome (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "転帰区分"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    hl70241 0..1 and
    jhsd0006 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[hl70241] from $JP_ConditionDiseaseOutcomeHL70241_VS (required)
* valueCodeableConcept.coding[hl70241].system = $JP_ConditionDiseaseOutcomeHL70241_CS (exactly)
* valueCodeableConcept.coding[hl70241].code 1..
* valueCodeableConcept.coding[hl70241] ^short = "HL7表0241。【詳細参照】"
* valueCodeableConcept.coding[hl70241] ^definition = "HL7表0241で定義されているコード。"
* valueCodeableConcept.coding[hl70241] ^comment = "JP_ConditionDiseaseOutcomeHL70241_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[jhsd0006] from $JP_ConditionDiseaseOutcomeJHSD0006_VS (required)
* valueCodeableConcept.coding[jhsd0006].system = $JP_ConditionDiseaseOutcomeJHSD0006_CS (exactly)
* valueCodeableConcept.coding[jhsd0006].code 1..
* valueCodeableConcept.coding[jhsd0006] ^short = "JHSD表0006。【詳細参照】"
* valueCodeableConcept.coding[jhsd0006] ^definition = "JHSD表0006で定義されているコード。"
* valueCodeableConcept.coding[jhsd0006] ^comment = "JP_ConditionDiseaseOutcomeJHSD0006_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_ConditionDiseaseOutcomeReceipt_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_ConditionDiseaseOutcomeReceipt_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算システム転帰区分コード。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている転帰区分コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_ConditionDiseaseOutcomeReceipt_VSの中から適切なコードを指定する。"

//-------------------------------
// JP_Condition_DiseasePrefixModifier
//-------------------------------
Extension: JP_Condition_DiseasePrefixModifier
Id: jp-condition-disease-prefix-modifier
Title: "JP Core Disease Prefix Modifier Extension"
Description: "病名の前置修飾語を格納するための拡張"
* ^url = $JP_Condition_DiseasePrefixModifier
* ^status = #active
* ^date = "2023-08-05"
* ^context.type = #element
* ^context.expression = "Condition.code"
* . ^short = "前置修飾語"
* . ^definition = "前置修飾語を格納するための拡張。\r\n前置修飾語をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseasePrefixModifier (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "前置修飾語"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[medisExchange] from $JP_ConditionDiseaseModifierMEDISExchange_VS (required)
* valueCodeableConcept.coding[medisExchange].system = $JP_ConditionDiseaseModifierMEDISExchange_CS (exactly)
* valueCodeableConcept.coding[medisExchange].code 1..
* valueCodeableConcept.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) 。【詳細参照】"
* valueCodeableConcept.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語交換用コード "
* valueCodeableConcept.coding[medisExchange] ^comment = "JP_ConditionDiseaseModifierMEDISExchange_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[medisRecordNo] from $JP_ConditionDiseaseModifierMEDISRecordNo_VS (required)
* valueCodeableConcept.coding[medisRecordNo].system = $JP_ConditionDiseaseModifierMEDISRecordNo_CS (exactly)
* valueCodeableConcept.coding[medisRecordNo].code 1..
* valueCodeableConcept.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスター(修飾語管理番号) 。【詳細参照】"
* valueCodeableConcept.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語管理番号 "
* valueCodeableConcept.coding[medisRecordNo] ^comment = "JP_ConditionDiseaseModifierMEDISRercordNo_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_ConditionDiseaseModifierReceipt_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_ConditionDiseaseModifierReceipt_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算用修飾語マスター。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている修飾語コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_ConditionDiseaseModifierReceipt_VSの中から適切なコードを指定する。"

//-------------------------------
// JP_Condition_DiseasePostfixModifier
//-------------------------------
Extension: JP_Condition_DiseasePostfixModifier
Id: jp-condition-disease-postfix-modifier
Title: "JP Core Disease Postfix Modifier Extension"
Description: "病名の後置修飾語を格納するための拡張"
* ^url = $JP_Condition_DiseasePostfixModifier
* ^status = #active
* ^date = "2023-08-05"
* ^context.type = #element
* ^context.expression = "Condition.code"
* . ^short = "後置修飾語"
* . ^definition = "後置修飾語を格納するための拡張。\r\n後置修飾語をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseasePostfixModifier (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "後置修飾語"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[medisExchange] from $JP_ConditionDiseaseModifierMEDISExchange_VS (required)
* valueCodeableConcept.coding[medisExchange].system = $JP_ConditionDiseaseModifierMEDISExchange_CS (exactly)
* valueCodeableConcept.coding[medisExchange].code 1..
* valueCodeableConcept.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) 。【詳細参照】"
* valueCodeableConcept.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語交換用コード "
* valueCodeableConcept.coding[medisExchange] ^comment = "JP_ConditionDiseaseModifierMEDISExchange_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[medisRecordNo] from $JP_ConditionDiseaseModifierMEDISRecordNo_VS (required)
* valueCodeableConcept.coding[medisRecordNo].system = $JP_ConditionDiseaseModifierMEDISRecordNo_CS (exactly)
* valueCodeableConcept.coding[medisRecordNo].code 1..
* valueCodeableConcept.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスター(修飾語管理番号) 。【詳細参照】"
* valueCodeableConcept.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語管理番号 "
* valueCodeableConcept.coding[medisRecordNo] ^comment = "JP_ConditionDiseaseModifierMEDISRercordNo_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_ConditionDiseaseModifierReceipt_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_ConditionDiseaseModifierReceipt_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算用修飾語マスター。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている修飾語コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_ConditionDiseaseModifierReceipt_VSの中から適切なコードを指定する。"
