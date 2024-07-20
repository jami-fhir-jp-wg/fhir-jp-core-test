本プロファイルは、化学療法レジメンの定義情報を表現するJP_PlanDefinition_ChemotherapyRegimenリソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## スコープ

- JP_PlanDefinition_ChemotherapyRegimenリソースは、化学療法における抗がん剤（注射薬、内服薬）、分子標的薬、免疫チェックポイント阻害薬、輸液、支持療法（制吐剤など）の組み合わせと、投与スケジュール、治療期間などを示した計画の情報を表現する。
- 個々の医薬品に関する情報は、JP_ActivityDefinition_ChemotherapyRegimen_Injection および JP_ActivityDefinition_ChemotherapyRegimen_Oralを用いて記述するため、JP_PlanDefinition_ChemotherapyRegimenリソースはcontained要素を用いて、これらのリソースを内包する。
- 化学放射線療法（化学療法と放射線治療の併用）における、放射線治療については、当リソースの対象としない。
- 特定の個人に適用された化学療法レジメン（レジメンオーダー）については、当リソースの対象としない。

## 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- 電子カルテに登録されている化学療法レジメンマスタを他施設に共有する。
- any more

## プロファイル定義
