<?php
//Step1
$db = mysqli_connect('localhost','root','kriitinjsh1202','uzdevums')
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
<div ID="sakumlapa">

    <!-- Virsraksts-->
    <div>
        <p>
        <h1>TESTA UZDEVUMS</h1></p>
    </div>
    <!-- Ievades lauks -->
    <form id="forma1" title="Ievadiet tikai burtus">
        <input type="text" onkeydown="return alphaOnly(event);" name="vardaLauks" id="vards" placeholder="Ievadiet savu vardu">
    </form>
    <br> <!--  brīva rinda -->
    <div style="text-align: center">
        <!-- izvele/dropdown -->
        <select id="izvele">
            <?php
            //Iegūst cik dažādu testu ir, un iegūst to vērtības
            $query = 'select id,name from tests';
            mysqli_query($db, $query) or die('Error querying database.');

            //rezultāts iepriekšējam solim
            $result = mysqli_query($db, $query);

            // raksta uz ekrāna kamēr ir ko rakstīt
            while ($row = mysqli_fetch_array($result)) {
                echo  '<option value="' . $row['id'] .'">' . $row['name'] . '</option>';
            }
            //Step 4
            mysqli_close($db);
            ?>
        </select>
    </div>
    <div style="text-align: center;" id="Sakt">
        <button class="pogaSakt" type="submit" onclick="saglabat()">SAKT</button>
    </div>
</div>

</body>
</html>