# コンパイル方法

このプロジェクトは日本語LaTeX文書（jsarticle + uplatex）です。

## ✅ 推奨方法（エラーが出ない）

### 方法1: VS Code（最も簡単）
1. ファイルを開く
2. **ファイルを保存**するだけで自動コンパイル
3. エラーが出た場合：`Cmd+Shift+P` → "LaTeX Workshop: Build LaTeX project"

**内部で使用**: `latexmk`（.latexmkrc で uplatex を指定）

### 方法2: latexmk コマンド
```bash
latexmk main.tex     # コンパイル
latexmk -c           # クリーンアップ
latexmk -pvc         # 自動監視モード
```

### 方法3: Make コマンド
```bash
make all             # コンパイル
make clean           # クリーンアップ
make rebuild         # 完全リビルド
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

## 📝 トラブルシューティング

### エラー: "Unicode character デ (U+30C7)"
→ **原因**: pdflatex が使われている
→ **解決**: 上記の推奨方法を使用

### VS Codeでビルドできない
→ `Cmd+Shift+P` → "LaTeX Workshop: Build LaTeX project"
→ レシピは "latexmk (uplatex)" を選択

### それでもダメな場合
```bash
make clean
latexmk main.tex
```
