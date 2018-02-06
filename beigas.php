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

<!-- Testa pēdējā lapa -->

    <?php
    // lietotāja id
    $userId=$_COOKIE['user_id']; //strādā
    $stmnt = $db->prepare("select id,full_name FROM user_name WHERE id=?");
    $stmnt->bind_param("i", $userId);
    $stmnt->execute();
    $result = $stmnt->get_result();

    $row = mysqli_fetch_array($result);
    $lietotajs=$row['full_name'];
    $cikJaut=intval($row)+1;

    // pareizo atbilžu skaits
    $stmnt = $db->prepare("SELECT count(*) FROM answers WHERE id IN (SELECT answers_id FROM user_answers WHERE user_name_id=?) AND correct_answer=true");
    $stmnt->bind_param("i", $userId);
    $stmnt->execute();
    $atb = $stmnt->get_result();
    $rinda=mysqli_fetch_array($atb);
    $stmnt = $db->prepare("update user_name set result=? where id=?");
    $stmnt->bind_param("ii", $rinda[0],$userId);
    $stmnt->execute();

?>
<div id="galaLapa">
    <h1>Paldies, <?php echo$lietotajs;?></h1>
    <br>
    <br>
    <h2>Jūs pareizi atbildējāt uz <?php echo$rinda[0];?> no <?php echo$cikJaut;?> jautājumiem!</h2>

</div>
</body>
</html>

