# データの活用 - LaTeX 教材

## 概要

この教材はデータの活用の基本概念から応用まで学習するための LaTeX 教材です。
リアルタイムで PDF の変更を確認できる自動コンパイル機能付きです。

## ディレクトリ構成

```
データの活用/
├── README.md        # このファイル
├── main.tex         # メインのLaTeX教材
├── preamble.tex     # LaTeXプリアンブル
├── Makefile         # LaTeXコンパイル用（make コマンド）
├── .latexmkrc       # latexmk設定ファイル
├── .vscode/         # VS Code設定
│   └── settings.json
├── watch.sh         # 自動コンパイルスクリプト
└── sections/        # セクション別のTeXファイル
    ├── 01_データの整理.tex
    ├── 02_データの代表値.tex
    └── 03_データの散らばりと四分位範囲.tex
```

## 🚀 使用方法

このプロジェクトは **3つのコンパイル方法** に対応しています：

### 方法1: VS Code での使用（最も簡単・推奨）

**前提条件**: LaTeX Workshop 拡張機能がインストールされていること

1. **自動ビルド（推奨）**：
   - ファイルを保存すると自動的にコンパイル
   - `.vscode/settings.json` で設定済み

2. **手動ビルド**：
   - `Ctrl+Alt+B` (Windows/Linux) または `Cmd+Option+B` (Mac)
   - コマンドパレット (`Ctrl+Shift+P`) → "LaTeX Workshop: Build LaTeX project"
   - 右クリックメニュー → "Build LaTeX project"

3. **PDF プレビュー**：
   - `Ctrl+Alt+V` (Windows/Linux) または `Cmd+Option+V` (Mac)
   - コマンドパレット → "LaTeX Workshop: View LaTeX PDF"

**使用されるコンパイラ**: デフォルトで `make` コマンドを使用（最も安定）

### 方法2: コマンドライン（Make）

```bash
make all          # PDFの作成
make clean        # 補助ファイルを削除
make rebuild      # クリーン＆リビルド
make answer       # 解答版の作成
```

**特徴**: uplatex → uplatex → dvipdfmx の2パスコンパイル

### 方法3: latexmk（汎用的）

```bash
latexmk main.tex  # PDFの作成
latexmk -c        # 補助ファイルを削除
latexmk -C        # すべての生成ファイルを削除
latexmk -pvc      # 自動監視モード
```

**特徴**: `.latexmkrc` で uplatex → dvipdfmx を設定済み

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

### 必須
- **LaTeX**: upLaTeX（日本語対応）
- **PDF 変換**: dvipdfmx
- **必要パッケージ**: preamble.tex 参照

### オプション
- **latexmk**: 汎用的なコンパイルツール（推奨）
- **fswatch**: ファイル監視ツール（macOS）
- **inotify-tools**: ファイル監視ツール（Linux）

### インストール例（macOS）

```bash
# Homebrew で TeX Live をインストール
brew install --cask mactex

# fswatch のインストール（オプション）
brew install fswatch

# latexmk は TeX Live に含まれています
```

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

### ❌ コンパイルエラーが出る

**問題**: 「File not found」などのエラー

**解決策**:
```bash
# 必ず uplatex を使用してください（pdflatex は不可）
make clean
make all

# または
latexmk main.tex
```

**重要**: このプロジェクトは **uplatex → dvipdfmx** でのコンパイルが必須です。
- ❌ `pdflatex` は使用できません
- ✅ `uplatex` または `make` を使用してください

### ❌ VS Code でコンパイルできない

**問題**: LaTeX Workshop がエラーを出す

**解決策**:
1. `.vscode/settings.json` が存在することを確認
2. LaTeX Workshop の設定で "make" がデフォルトレシピになっていることを確認
3. それでもダメな場合は、ターミナルで `make all` を実行

### ❌ 自動監視が動作しない

**解決策**:
- `fswatch`がインストールされているか確認
- `make watch-poll`でポーリング方式を試す
- `latexmk -pvc main.tex` を試す

## 作成者

Riku Sugawara  
ITTO 個別指導学院 札幌東校  
2025 年 12 月

