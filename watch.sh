#!/bin/bash

# LaTeX Auto-compile Script
# リアルタイムでファイル変更を監視してPDFを自動生成

echo "=== LaTeX Auto-compile Script ==="
echo "監視対象: main.tex, preamble.tex, sections/*.tex"
echo "終了するには Ctrl+C を押してください"
echo ""

# 初回コンパイル
echo "初回コンパイル中..."
make all
echo "初回コンパイル完了"
echo ""

# fswatch が利用可能かチェック
if command -v fswatch >/dev/null 2>&1; then
    echo "fswatch を使用してファイル監視を開始します..."
    fswatch -o main.tex preamble.tex sections/*.tex | while read f; do
        echo "ファイル変更を検出しました ($(date +"%H:%M:%S"))"
        make all 2>&1 | tail -3
        echo "✓ コンパイル完了"
        echo ""
    done
else
    echo "fswatch が見つかりません。ポーリング方式で監視します..."
    echo "fswatch をインストールすることをお勧めします: brew install fswatch"
    echo ""

    # 最新のタイムスタンプを記録
    get_latest_mtime() {
        stat -f %m main.tex preamble.tex sections/*.tex 2>/dev/null | sort -rn | head -1
    }

    last_mtime=$(get_latest_mtime)

    # ポーリング方式でファイル監視
    while true; do
        sleep 1
        current_mtime=$(get_latest_mtime)

        if [[ "$current_mtime" != "$last_mtime" ]]; then
            echo "ファイル変更を検出しました ($(date +"%H:%M:%S"))"
            make all 2>&1 | tail -3
            echo "✓ コンパイル完了"
            echo ""
            last_mtime=$current_mtime
        fi
    done
fi

