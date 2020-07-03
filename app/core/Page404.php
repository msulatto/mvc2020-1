<?php


namespace MVC2020\Core;

class Page404
{
    public function index()
    {

        $nome = 'marcelli'; 
        echo $conteudo = <<<ETEC
        <h1>boa noite {$nome}</<h1>
        <h1>erro 404 PÁGINA NÃO FOI ENCONTRADA! :(((( </h1>
        <div style='text-align: center'>
        <img src='https://www.pngkey.com/png/detail/212-2124171_404-error-404-pagina-no-encontrada.png'>
        </div>
ETEC;
    }
}