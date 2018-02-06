<?php ob_start(); ?>
<?php
//Step1
$db = mysqli_connect('localhost', 'root', 'kriitinjsh1202', 'uzdevums')
or die('Error connecting to MySQL server.');
?>

<html>
<head>
    <script src="uzdevums.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>2. Functions</title>
        <link rel="stylesheet" href="uzdevums.css">
</head>
<body>
<?php
function phpAlert($msg) {
    echo '<script type="text/javascript">alert("' . $msg . '")</script>';
}
?>
<?php
// iegūst izvelētā testa numuru

$testaNR = intval($_GET['test_id']);
//Iegūst jautājumu atkarībā no izvēlētā testa
$stmnt = $db->prepare("select id,question_text FROM question WHERE test_id=?"); // pasargā pret sql injekcijām
$stmnt->bind_param("i", $testaNR);//i-integer, iegūst testa numuru, kā integer vertību
$stmnt->execute();



//pēc izvēlētā testa atrod attiecīgos jautajumus DB

$result = $stmnt->get_result();
$visiJaut = mysqli_fetch_all($result, MYSQLI_ASSOC); //ņem attiecīgās vertības

// iespējams, ka te jau ir feiliņš, jo ja ir tests2 tad question_id nevajadzētu būt

$jautNR = intval($_GET['question_id']);
$jautTeksts = $visiJaut[$jautNR]['question_text']; //ieguvu jautajuma tekstu
$stmnt = $db->prepare("select id,answer_text FROM answers WHERE question_id=?");
$stmnt->bind_param("i", $visiJaut[$jautNR]['id']);
$stmnt->execute();
$result = $stmnt->get_result();


// saglabā lietotāja vārdu un testu DB, kuru tas izvēlas, ja jautājuma numurs = 0 (sākts jauns tests)
if ($jautNR == 0) {
    $lietVards = $_GET['full_name']; // URL pēc ? zīmes ir parametri. Pieliek ievadīto pie tiem.
    $stmnt = $db->prepare("insert into user_name(full_name,test_id)VALUES (?,?)");
    $stmnt->bind_param("si", $lietVards, $testaNR);//si-string+integer, saglabā DB ievadīto vērtību un kuru testu izvēlas
    $stmnt->execute();
//    $_GET['user_id'] = mysqli_insert_id($db);
    setcookie('user_id', mysqli_insert_id($db));
} else {
    //ieliek atbildi DB
    $atbId = intval($_GET['answer_id']); // URL pēc ? zīmes ir parametri. Pieliek ievadīto pie tiem.
    $userId = intval($_COOKIE['user_id']);
    $bus=intval($jautNR-1); // citādi, kad jautNr=2 tad questionId meklēs id trešajam jautājumam (numerācija no 0 sākas)
    $questionId= intval($visiJaut[$bus]['id']);
    $stmnt = $db->prepare("insert into user_answers(user_name_id,question_id,answers_id)VALUES (?,?,?)");
    $stmnt->bind_param("iii", $userId, $questionId,$atbId);//si-string+integer, saglabā DB ievadīto vērtību un kuru testu izvēlas
    $stmnt->execute();
}

mysqli_close($db);

?>
<!-- Ja nākošā jautajuma numurs ir lielāks par kopējo jautājumu skaitu, tad pārmet uz gala lapu-->
<?php
$nakosa_lapa='http://localhost:63342/uzdevums/beigas.php?galaLapa';
$redirect=intval($visiJaut)+1; //cik ir jautājumu
$nakosaisJaut=$jautNR+1; // nakošā jaut nr
if ($nakosaisJaut>$redirect){
    header('Location: '.$nakosa_lapa);
}
ob_end_flush();
?>
<div id="Lapa1_1">
    <br>
    <p>
    <h1><?php echo $jautNR + 1 ?>. Jautājums</h1></p>
    <p>
    <h3 style="text-align: center"><?php echo $jautTeksts ?></h3></p>
    <div class="visasPogas">
        <?php $poguSk=0;
           while ($row = mysqli_fetch_array($result)) {
               if (($poguSk%2)==1) {
                   echo '<button class="AtbHover poga" onClick="last_clicked=' . $row['id'] . ';">' . $row['answer_text'] . '</button>';
               $poguSk++;
           }else {
            echo '<br>';
                   echo '<button class="AtbHover poga" onClick="last_clicked=' . $row['id'] . ';">' . $row['answer_text'] . '</button>';
            $poguSk++;
           }
       }
        ?>
    </div>
    <?php
    $progrVert=100/(intval($visiJaut)+1);
    $progr=$progrVert+($jautNR*$progrVert);
    ?>
    <div class="prog">
        <progress value="<?php echo $progr?>"  max="100"></progress>
    </div>
    <div id="uzLapu2" class="nextPage">
        <button  class="pogaTurpinat turpinatHover" onclick="turpinat();">Turpinat</button>
    </div>

</div>
<script>

</script>
</body>
</html>