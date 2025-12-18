# データの活用 - LaTeX 教材

## 概要

この教材はデータの活用の基本概念から応用まで学習するための LaTeX 教材です。
リアルタイムで PDF の変更を確認できる自動コンパイル機能付きです。

## ディレクトリ構成

```
データの活用/
├── README.md      # このファイル
├── main.tex       # メインのLaTeX教材
├── preamble.tex   # LaTeXプリアンブル
├── Makefile       # LaTeXコンパイル用
├── watch.sh       # 自動コンパイルスクリプト
└── sections/      # セクション別のTeXファイル
    ├── 01_度数分布とヒストグラム.tex
    ├── 02_代表値.tex
    ├── 03_相対度数.tex
    └── 04_累積度数.tex
```

## 🚀 使用方法

### VS Code での使用（推奨）

**前提条件**: LaTeX Workshop 拡張機能がインストールされていること

1. **ビルド方法**：

   - `Ctrl+Alt+B` (Windows/Linux) または `Cmd+Option+B` (Mac)
   - コマンドパレット (`Ctrl+Shift+P`) → "LaTeX Workshop: Build LaTeX project"
   - 右クリックメニュー → "Build LaTeX project"

2. **PDF プレビュー**：

   - `Ctrl+Alt+V` (Windows/Linux) または `Cmd+Option+V` (Mac)
   - コマンドパレット → "LaTeX Workshop: View LaTeX PDF"

3. **タスクランナー**：
   - `Ctrl+Shift+P` → "Tasks: Run Task" → "LaTeX Build (uplatex)"

### コマンドラインでの使用

```bash
make all          # PDFの作成
make clean        # 補助ファイルを削除
make answer       # 解答版の作成
```

### 🔄 リアルタイム自動コンパイル

**方法 1: watch.sh スクリプトを使用（推奨）**

```bash
./watch.sh
```

**方法 2: Makefile の watch ターゲットを使用**

```bash
make watch        # fswatch使用（要インストール）
make watch-poll   # ポーリング方式（どこでも動作）
```

### fswatch のインストール（推奨）

```bash
# macOS
brew install fswatch

# Ubuntu/Debian
sudo apt-get install inotify-tools

# その他のLinux
# 各ディストリビューションのパッケージマネージャーを使用
```

## 📝 教材の特徴

- **穴埋め問題形式**: `\fitblank{}`コマンドで学習効果を向上
- **定義・定理ボックス**: 重要概念を明確化
- **解答表示の切り替え**: `\showanswerfalse/true`で制御
- **リアルタイム編集**: ファイル保存と同時に PDF 更新

## ⚙️ カスタマイズ

### 解答の表示/非表示

`preamble.tex` の以下の行を変更することで、全ての空欄の答えを一括で表示/非表示にできます：

```latex
\showanswerfalse  % 解答を隠す（デフォルト）
\showanswertrue   % 解答を表示
```

**使用例：**

- **問題配布時**: `\showanswerfalse` で空欄のままの問題を配布
- **解答配布時**: `\showanswertrue` に変更して解答付き PDF を作成
- **授業中**: リアルタイムで切り替えて段階的に解答を表示

### 穴埋め問題の追加

```latex
% 新しい答え付き形式（推奨）
\fitblank[答え]{5}     % 5em幅の空欄（答え付き）
\fitblank[平均値]{5}   % 「平均値」という答えが入る5em幅の空欄

% 従来の形式（答えなし）
\fitblank{5}           % 5em幅の空欄のみ

% 旧形式（まだ使用可能）
\Blank[3cm]{解答}      % 3cm幅の空欄（解答付き）
```

**新機能の特徴：**

- `\fitblank[答え]{幅}` 形式で答えを指定
- `\showanswerfalse/true` で一括制御
- 幅は自動調整（em 単位）

## 🔧 必要な環境

- **LaTeX**: pLaTeX または upLaTeX
- **PDF 変換**: dvipdfmx
- **自動監視**: fswatch（推奨）または inotify-tools
- **必要パッケージ**: preamble.tex 参照

## 📖 使用の流れ

1. **初期セットアップ**:

   ```bash
   make all  # 初回コンパイル
   ```

2. **自動コンパイル開始**:

   ```bash
   ./watch.sh
   ```

3. **編集作業**:

   - `main.tex`を編集・保存
   - 自動的に PDF が更新される
   - PDF ビューアーで変更を確認

4. **終了**:
   - `Ctrl+C`で自動コンパイルを停止

## 🛠️ トラブルシューティング

### LaTeX コンパイルエラー

- 必要なパッケージがインストールされているか確認
- 文字エンコーディングが UTF-8 になっているか確認
- `make clean`で補助ファイルを削除してから再コンパイル

### 自動監視が動作しない

- `fswatch`がインストールされているか確認
- `make watch-poll`でポーリング方式を試す
- ファイルの権限を確認

## 作成者

Riku Sugawara  
ITTO 個別指導学院 札幌東校  
2025 年 12 月

