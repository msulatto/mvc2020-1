<?php
spl_autoload_register(function($class){
    //prefixo do namespace
    $prefix = 'MVC2020';
 
    //diretorio base para as classes
    $base_dir = 'app';
 
    //Se a classe usar o namespace correto
    $len = strlen($prefix);
 
    if(strncmp($prefix, $class, $len) !== 0)
    {
        return;
    }
 
    //Pegar o nome relativo da classe
    $relative_class = substr($class, $len);
 
    //substitui o namespace prefix com o diretorio
    $file = $base_dir.str_replace('\\','/',$relative_class).'.php';
 
    if(file_exists($file))
    {        
        require_once $file;
    }
 
});