# Animal medication dairy

## サイト概要
動物の投薬記録と日々の日誌を記録することができるアプリケーションです。

### サイトテーマ
動物×投薬記録×日誌×コミュニティ(共有)

### テーマを選んだ理由
治療の経過報告をする時に記録をさかのぼるのが大変であったことと、薬を作る際に計算に苦労したことがありました。
人間用の医師や薬剤師用のアプリは多いですが、動物用が少ないため、動物用にも自動計算ができて、一目で投薬履歴が確認できるアプリケーションがあれば作業効率につながると考え、このテーマにしました。

### ターゲットユーザ
動物の飼育日誌を付ける人、投薬計算が苦手な人、記録をさかのぼりたい人

### 主な利用シーン
薬を作成する時、治療の経過報告をする時、日々の飼育の記録をつける時

## 設計書
- ER図&flow：<br>
    &nbsp;https://drive.google.com/file/d/1hnYddk0Pi-oPQPCTSO-xDCENFIctS9uR/view?usp=sharing
- テーブル定義書：<br>
    &nbsp;https://drive.google.com/file/d/1hnYddk0Pi-oPQPCTSO-xDCENFIctS9uR/view?usp=sharing
- 詳細設計：<br>
    &nbsp;https://docs.google.com/spreadsheets/d/1KMCX0b80AefoTZAB54EsUAHwPmpKducdaNo07zCo4NA/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用方法
- 管理者ページのログインについて
    - 初期段階での管理者ページのログインに必要なアドレス及びパスワードは下記です。
        - メールアドレス：admin@admin
        - パスワード：000000
        - 店舗ログインをする際は必ず管理者をログアウトしてから、店舗へログインしてください。
- ゲストログインについて
    - 店舗情報：ゲストログインの方は、店舗情報の編集ができません。
    - 日報作成：ゲストログインの方は、日報の天気の取得ができません。
    - 投薬作成：ヘッダーの動物一覧をクリックし、動物の登録をしてから、投薬作成を行ってください。

## 使用素材
- favicon素材：https://icons8.jp/icons/set/favicon
- 写真素材：https://o-dan.net/ja/