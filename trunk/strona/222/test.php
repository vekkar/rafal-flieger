<?php 

  # name = "katalog.pdf"
  header("Content-type: application/octet-stream"); 
  header("Content-Disposition: attachment; filename=$name"); 
  readfile("[http://www.adres_strony.pl/pliki/$name"];);   
?> 