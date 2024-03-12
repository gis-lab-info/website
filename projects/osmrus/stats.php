<?php
$db = pg_connect('host=localhost dbname=osm user=labinfo password=incognito');
        $query = "SELECT * FROM osm_stat";

        $result = pg_query($query);
        if (!$result) {
            echo "Problem with query " . $query . "<br/>";
            echo pg_last_error();
            exit();
        }

        while($myrow = pg_fetch_assoc($result)) {
            echo $myrow['region'] . " " . $myrow['layer'] . "<br>";
        }
        ?> 