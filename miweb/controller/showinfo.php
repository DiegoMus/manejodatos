<?php

require('../connectordb.php');

$cui = $_POST["cui"];

$query = "SELECT * FROM usuario WHERE cui = $cui";
echo "<b> <center>Notas del usuario</center> </b> <br> <br>";

if ($result = $mysqli->query($query)) {

    while ($row = $result->fetch_assoc()) {
  
        $field1name = $row["idusuario"];
        $field2name = $row["cui"];
        $field3name = $row["nota1"];
        $field4name = $row["nota2"];
        $field5name = $row["nota3"];
        $field6name = $row["nota4"];
        $field7name = $row["nombre"];
        $field8name = $row["apellido"];
        
        echo "<div align = center>";
        echo "<table class = 'default' border='1'>";
        
        echo "<tr>";
        echo "          <td align = center> <strong>id </td>";
        echo "          <td align = center> <strong>CUI</td>";
        echo "          <td align = center> <strong>Nombre</td>";
        echo "          <td align = center> <strong>Nota 1</td>";
        echo "          <td align = center> <strong>Nota 2</td>";
        echo "          <td align = center> <strong>Nota 3</td>";
        echo "          <td align = center> <strong>Nota 4</td>";
        echo "</tr>";
        

        echo "<tr>";
        echo "          <td align =center>".$field7name."</td>";
        echo "          <td align =center>".$field1name."</td>";
        echo "          <td align =center>".$field2name."</td>";
        echo "          <td align =center>".$field3name."</td>";
        echo "          <td align =center>".$field4name."</td>";
        echo "          <td align =center>".$field5name;"</td>";
        echo "          <td align =center>".$field6name;"</td>";
        echo "</tr>";
    
        echo "</div>";    
    }

/*freeresultset*/
$result->free();
}
    
 // }
?>