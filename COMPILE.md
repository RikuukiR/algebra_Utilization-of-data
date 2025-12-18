# コンパイル方法

このプロジェクトは日本語LaTeX文書（jsarticle + uplatex）です。

## ✅ 推奨方法（エラーが出ない）

### 方法1: VS Code + LaTeX Workshop（最も簡単）
1. ファイルを開く
2. **ファイルを保存（Cmd+S）**するだけで自動コンパイル
3. PDFが自動的にタブで開く

**内部で実行されるコマンド**:
```bash
uplatex main.tex  # 1回目
uplatex main.tex  # 2回目（相互参照のため）
dvipdfmx main.dvi # DVI → PDF変換
```

### 方法2: Make コマンド
```bash
make all             # コンパイル
make clean           # クリーンアップ
make rebuild         # 完全リビルド
```

### 方法3: 手動コンパイル
```bash
uplatex -synctex=1 -interaction=nonstopmode main.tex
uplatex -synctex=1 -interaction=nonstopmode main.tex
dvipdfmx main.dvi
```

## ❌ 使用してはいけないコマンド

```bash
pdflatex main.tex    # ❌ 日本語非対応（Unicodeエラーが出る）
```

## 🔧 コンパイルの仕組み

```
main.tex → uplatex → main.dvi → dvipdfmx → main.pdf
         (2回実行)              (DVI→PDF変換)
```

**なぜ2回実行？**
- 1回目：文書の構造を解析
- 2回目：相互参照（目次、ページ番号等）を解決

## 📝 VS Code LaTeX Workshop の使い方

### ショートカットキー
- **ビルド**: `Cmd+Option+B` (Mac) / `Ctrl+Alt+B` (Windows)
- **PDFプレビュー**: `Cmd+Option+V` (Mac) / `Ctrl+Alt+V` (Windows)
- **保存**: `Cmd+S` (自動ビルドが実行される)

### コマンドパレット
1. `Cmd+Shift+P` を押す
2. "LaTeX Workshop: Build LaTeX project" を選択

### サイドバー
- 左サイドバーのLaTeXアイコンをクリック
- "Build LaTeX project" をクリック

## 🎯 現在の設定の特徴

### シンプルで確実
- ✅ `latexmk`を使用しない（シンプル）
- ✅ 直接`uplatex`を実行（確実）
- ✅ 参考プロジェクト（Cases-and-Probability）と同じ方式

### 自動化
- ✅ ファイル保存時に自動コンパイル
- ✅ 自動クリーンアップ（補助ファイルを削除）
- ✅ SyncTeX対応（PDF⟷ソース間の同期）

### エラー対策
- ✅ pdflatexは使用されない
- ✅ 日本語（Unicode文字）が正しく処理される
- ✅ エラーは表示、警告は非表示

## 📋 トラブルシューティング

### エラー: "Unicode character デ (U+30C7)"
→ **原因**: pdflatex が使われている  
→ **解決**: VS Codeを再起動し、ファイルを保存してください

### ビルドが失敗する
```bash
# 一度クリーンアップしてから再ビルド
make clean
make all
```

### VS Codeでビルドできない
1. `Cmd+Shift+P` → "LaTeX Workshop: Build LaTeX project"
2. レシピは "uplatex -> dvipdfmx" を選択
3. それでもダメな場合は VS Code を再起動

### PDFが更新されない
- PDFビューアを閉じてから再度ビルド
- または `make rebuild` を実行

## 📚 参考

このプロジェクトの設定は以下のプロジェクトを参考にしています：
```
/Users/riku/Desktop/ITTO/h-mathematics/math-A/Cases-and-Probability
```

同じ設定方式を採用しているため、安定して動作します。
