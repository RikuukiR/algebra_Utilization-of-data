#!/usr/bin/env perl

# LaTeXコンパイラの設定（日本語対応）
$latex = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'upbibtex %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';

# PDFの生成方法（3: LaTeX -> DVI -> PDF）
$pdf_mode = 3;

# 最大繰り返し回数
$max_repeat = 5;

# 出力ディレクトリ（コメントアウト：ルートに出力）
# $out_dir = 'build';

# クリーンアップ対象の拡張子
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo %R-blx.bib';

# プレビュー設定
$pvc_view_file_via_temporary = 0;

# macOSのプレビュー設定
if ($^O eq 'darwin') {
    $pdf_previewer = 'open -a Preview %S';
} elsif ($^O eq 'linux') {
    $pdf_previewer = 'evince %S';
}

