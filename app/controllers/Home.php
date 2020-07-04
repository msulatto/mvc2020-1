<?php
namespace MVC2020\Controllers;

class Home extends Controller
{
    public function index()
    {
        $this->view->render('home');
    }
}