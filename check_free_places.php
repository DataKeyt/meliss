<?php
require "config.php";
require "system/database.php";

if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    if (isset($_GET["kuupaeva_id"]) && !empty($_GET["kuupaeva_id"])) {
        $id = intval($_GET["kuupaeva_id"]);
        $inimeste_arv = get_one("SELECT SUM(inimeste_arv) FROM broneering WHERE kuupaeva_id = $id");
        $vabad = 26-$inimeste_arv;
        echo $vabad;
    }
}
else {
    echo "Sa oled vales kohas. <a href='/do'>Mine tagasi esilehele!</a>";
}