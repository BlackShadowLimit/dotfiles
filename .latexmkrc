$out_dir = 'build';

$pdf_mode = 5;
$postscript_mode = $dvi_mode = 0;

if ( ! -e $out_dir ) { mkdir $out_dir; }
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$pdf_previewer = 'sioyek %S';

$pvc_view_file_via_temporary = 0;
