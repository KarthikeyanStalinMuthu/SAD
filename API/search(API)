<?php
   class MyDB extends SQLite3
   {
      function __construct()
      {
         $this->open('podcast.db');
      }
   }
   $db = new MyDB();
   if(!$db){
      echo $db->lastErrorMsg();
   } else {
      //echo "Opened database successfully\n";
   }

   $sql =<<<EOF
      SELECT articlename from informatics;
EOF;

   $ret = $db->query($sql);
   while($row = $ret->fetchArray(SQLITE3_ASSOC) ){

      //echo "articleid = ". $row['articleid'] . "\n";
     // echo "articlename = ". $row['articlename'] ."\n";
      //echo "content = ". $row['content'] ."\n";
      //echo "format =  ".$row['format'] ."\n\n";

   //Passing the Articlename to the array
      $arr[] = $row['articlename'];

   }
//encoding JSON in PHP - 
 echo json_encode($arr);

   //echo "Operation done successfully\n";
  // $db->close();

?>
