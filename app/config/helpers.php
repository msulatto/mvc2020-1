<?php

function asset($path)
{
    return ROOT . "app/views/assets/{$path}";
}

function debug($param)
{
    echo "<pre style='background-color:#222; color:limegreen'>";
    echo "<p>D E B U G A N D O</p>";
    print_r($param);
    echo "</pre>";
}