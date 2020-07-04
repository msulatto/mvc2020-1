<?php

namespace MVC2020\Controllers;

class Produtos extends Controller
{
    public function index()
    {
        $this->view->mensagem = 'dado vindo do banco';
        $this->view->render('produtos');
    }
}