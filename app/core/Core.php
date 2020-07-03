<?php
namespace MVC2020\Core;

 

class Core
{
    public function __construct()
    {
        $flag = false;
        // 1. Rotas
        if(isset($_GET['path'])){
            $token = explode('/', rtrim($_GET['path'], '/'));
            // 2. Dispatcher
            $controllerName = ucfirst(array_shift($token));
           
            // Verifica se o arquivo existe na pasta controller
           if(file_exists('app/controllers/'.$controllerName.'.php')){
                $controllerName = '\\MVC2020\\Controllers\\'.$controllerName;
                $controller = new $controllerName();
                // 2.1. Metodo
                if(!empty($token)){
                    $actionName = array_shift($token);
                    if(method_exists($controller, $actionName ))
                    {
                        $controller->{$actionName}(@$token);
                    }
                }
                else{
                    //Valor Default Index
                    $controller->index();
                }
            }
            else{
            // Se o controller nao foi encontrado
            $flag = true;
            }
        } else {
            //NAO TEM CONTROLLER
            //CHAMA O CONTROLLER GENERICO
            $controllerName = '\\MVC2020\\controllers\\Home';
            $controller = new $controllerName();
            $controller->index();
        }

 

        //ERROR PAGE

 

    }
}