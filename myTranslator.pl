#Malavika Iyer
open(INPUT, "cell-phones.csv") or die "Can't open cell-phones.csv: $!\n";
 $ct=0;
 $android=0;
 $ios=0;
 $windows=0;
   sub fn1
   {LABEL1: while ($line = <INPUT>) 
   {next LABEL1 if /^#/;
	
       ($univ,$os, $number) = split(",", $line);
              $numbers{$os} .= $number . " ";
   }
   foreach $os (sort keys %numbers) {

      $total = 0;
      @numbers = split(" ", $numbers{$os});
      foreach $number (@numbers) {
          $total += $number;
      }
	$array1[$ct]=$total;
$ct=$ct+1;
 }
 $android=$array1[1];
$windows = $array1[2];
$ios = $array1[3];
}

open($file,'>' ,"cell-phones.html") or die("Error in opening the file");
fn1;
$a=$android/5;
$i=$ios/5;
$w=($window/5)+1;
$html = '<!DOCTYPE html>'.
'<html>'.
'<head>'.
'<meta charset="UTF-8">'.
'<title>Cell Phone Usage-Assignment 3</title>'.
'<link rel="stylesheet" href="style.css">'.
'<link rel="stylesheet" href="style.scss">'.
'<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />'.
'</head>'.
'<body style="background-color:seashell;">'.
'<div class="Container">'.
'<h1><center>Cell Phone Usage</center></h1>'.
'<svg id="ex1">'.
'<circle class="path" cx="50%" cy="50%" r="100" fill="transparent" stroke-width="10"stroke="orange" />'.
'</svg>'.
'<svg id="ex2">'.
'<circle class="path" cx="50%" cy="50%" r="85" fill="transparent" stroke-width="10" stroke="gold" />'.
'</svg>'.
'<svg id="ex3">'.
'<circle class="path" cx="50%" cy="50%" r="70" fill="transparent" stroke-width="10" stroke="#FA8072" />'.
'</svg>'.
'<div id="key" style="float:left;position:relative;left:100px;text-align:center;">'.
'<p style="background-color:gold;width:'.$w.';height:50px;">Windows: '.$windows.' </p>'.
'<p style="background-color:orange;width:'.$i.';height:50px;">iOS: '.$ios.'  </p>'.
'<p style="background-color:#FA8072;width:'.$a.';height:50px;">Android: '.$android.' </p>'.
'</div>'.
'</div>'.
'</body>'.
'</html>';

print $file $html;
close $file; 
