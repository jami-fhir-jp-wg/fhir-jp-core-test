### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 本リソースのステータス (draft | active | retired | unknown)

### Extensions定義

本プロファイルで定義された拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|レジメン種別|レジメン種別の情報を格納する拡張|[JP_PlanDefinition_ChemotherapyRegimen_RegimenType]|CodeableConcept|
|相対投与日|開始日からの相対的な投与日付を表現する拡張<br/>《action配下》|[JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle]|integer|

### 用語定義
TBD

|分類|用語集|CS名|URI|
|-----|----|----|---------------------------|
|レジメン種別|TBD|TBD|TBD|

### 制約一覧

本プロファイルで追加定義された制約はない。

### 項目の追加
本プロファイルで追加された項目は以下の通りである。

* レジメン種別（拡張「JP_PlanDefinition_ChemotherapyRegimen_RegimenType」を使用）
* 相対投与日（拡張「JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle」を使用）

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

<!-- | コンフォーマンス    | パラメータ                   | 型         | 例                                                                                 |
| ---------------- | -------------------------- |  --------- | ---------------------------------------------------------------------------------- |
| SHALL            | identifier                 | token      | GET [base]/PlanDefinition?identifier=http://myhospital.com/fhir/PlanDefinition\|123 |
| SHOULD           | patient                    | reference  | GET [base]/PlanDefinition?patient=Patient/123                                        |
| MAY              | patient,onset-date         | reference,date | GET [base]/PlanDefinition?patient=Patient/123&onset-date=ge2021-08-24             |
| MAY              | patient,clinical-status     | reference,code | GET [base]/PlanDefinition?patient=Patient/123&clinical-status=active              |
| MAY              | patient,verification-status | reference,code | GET [base]/PlanDefinition?patient=Patient/123&verification-status=confirmed       |
| MAY              | patient,category           | reference,code | GET [base]/PlanDefinition??patient=Patient/123&category=problem-list-item    | -->

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりPlanDefinitionを検索

   ```
   GET [base]/PlanDefinition?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/PlanDefinition?identifier=http://myhospital.com/fhir/PlanDefinition|123
   ```
   
   指定された識別子に一致するPlanDefinitionリソースを含むBundleを検索する。

##### 推奨検索パラメータ

 TBD

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

<!-- * [**病名（過敏性大腸炎の初期疾患）**][jp-condition-diagnosis-example-1] -->
TBD

## 注意事項

### 薬剤の記述方法
注射薬の場合は JP_ActivityDefinition_ChemotherapyRegimen_Injection を、内服薬の場合は JP_ActivityDefinition_ChemotherapyRegimen_Oral を用いて記述する。
1つの薬剤に対して1つのインスタンスを生成し、当リソースのcontained要素に含め、action#definitionCanonicalとの関連付けを行うこと。

「注射薬Ａ+輸液Ｂ」と「内服薬Ｃ」の組み合わせを表現したインスタンス例を示す。
＊全体像を掴むためのサンプルであるため、薬剤以外の詳細な記述は省略する。
```json
{
  "resourceType" : "PlanDefinition",
  "contained" : [
    {
      "resourceType" : "ActivityDefinition",
      "id" : "1111",
      "contained": [
        {
          "resourceType": "Medication",
          "id": "#1",
          "ingredient": [
            { "itemCodeableConcept": { "text": "注射薬Ａ" } }, 
            { "itemCodeableConcept": { "text": "輸液Ｂ" } }
          ]
        },
      ],
      "productReference": { "reference": "Medication/1" }
    },
    {
      "resourceType" : "ActivityDefinition",
      "id" : "2222",
      "productCodeableConcept" : { "text" : "内服薬Ｃ" }
    }
  ],
  "action" : [
    {
      "action": [
        { "definitionCanonical" : "#1111" },
        { "definitionCanonical" : "#2222" }
      ]
    }
  ]
}
```

### レジメン種別の記述方法
レジメン種別を識別するコードと名称は、PlanDefinitionに対して定義した拡張「JP_PlanDefinition_ChemotherapyRegimen_RegimenType」を使用し、CodeableConcept型を使用して記録する。
<font color="red">TODO: バインドする用語集は検討中</font>

```json
"extension": [{
  "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_PlanDefinition_ChemotherapyRegimen_RegimenType",
  "valueCodeableConcept": {
    "coding": [{ 
      "system": "TBD", 
      "code": "TBD", 
      "display": "mFOLFOX6" 
    }],
    "text": "mFOLFOX6"
  }
}]
```

### 適応疾患(がんの種類)の記述方法
TODO: 例えばFOLFOXの場合、「大腸癌」と記述するか、それとも「上行結腸癌」「横行結腸癌」「下行結腸癌」「S状結腸癌」などと細分化して記述するか。また修飾語はJP_Conditionを真似するか。
```json
"useContext": [
  {
    "code": {
      "system": "http://terminology.hl7.org/CodeSystem/usage-context-type",
      "code": "focus"
    },
    "valueCodeableConcept": {
      "coding": [
        {
          "system": "TBD",
          "code": "12345"
        }
      ],
      "text": "〇〇癌"
    }
  }
]
```

### 1コースの期間と、サイクル数
投与期間と休薬期間を合わせた1周期(コース)の日数をPlanDefinition.action.timingTiming.repeat.duration要素に記録する。また、コースの繰り返し回数(サイクル数)をPlanDefinition.action.timingTiming.repeat.count要素に記録する。
人間が解釈可能な1コースの期間と、サイクル数のテキスト表現をPlanDefinition.action.textEquivalentに記録する。

「1コース14日を6サイクル繰り返す」のインスタンス例を示す。
```json
"action": [
  {
    "textEquivalent": "1コース14日を6サイクル繰り返す",
    "timingTiming": {
      "repeat": {
        "count": 6,
        "duration": 14,
        "durationUnit": "d"
      }
    }
  }
]
```

「1コース14日を4〜6サイクル繰り返す」のように、サイクル数に幅がある場合、PlanDefinition.action.timingTiming.repeat.countに繰り返し回数の下限を記録し、PlanDefinition.action.timingTiming.repeat.countMaxに上限を記録する。
<font color="red">TODO: 繰り返し数未定（できる限り継続する、PDまでなど）の場合はどうするか。</font>

```json
"action": [
  {
    "textEquivalent": "1コース14日を4〜6サイクル繰り返す",
    "timingTiming": {
      "repeat": {
        "count": 4,
        "countMax": 6,
        "duration": 14,
        "durationUnit": "d"
      }
    }
  }
]
```

### 相対投与日の記述方法
投与開始日からの相対的な投与日を、PlanDefinition.actionに定義した拡張「JP_PlanDefinition_ChemotherapyRegimen_TimingDaysOfCycle」を使用し、integer型を使用して記録する。

「day1 と day8」に投与する場合のインスタンス例を示す。
```json
"action": [{
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle",
      "valueInteger": 1
    },
    {
      "url": "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle",
      "valueInteger": 8
    }
  ]
}]
```

### 投与順序の記述方法
TBD

### 発行元
<font color="red">TODO</br>
外部公開することを考えると、発行元(医療機関名等)を記載しておくことが望ましいと思われる。</br>
jurisdictionだと少し範囲が大きすぎる気がするし、publisherはstring型なのでテキストでしか記載できない。
</font>

## その他、参考文献・リンク等
TBD

{% include markdown-link-references.md %}