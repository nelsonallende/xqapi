<?php
require '/vendor/autoload.php';
use RedBean_Facade as R;

R::setup('mysql:host=localhost;dbname=site;charset=utf8', 'root',''); //Redbean PDO
R::freeze(true); //to stop redbean of creating objects dynamically

//Slim Middleware for authentication
$app = new \Slim\Slim();
$authentication = function (){
    $app = \Slim\Slim::getInstance();
    $user = $app->request->headers->get('HTTP_USER');
    $pass = $app->request->headers->get('HTTP_PASS');
    //$pass = sha1($pass);
    //Validating access data
    $isvalid = R::findOne('keys', 'user=? AND pass=?',array($user,$pass));
    try{
        if(!$isvalid)
        {
            throw new Exception('User or password not found');
        }
    }catch(Exception $e){
        $app->status(401);
        echo json_encode(array('status' => 'error', 'message' => $e->getMessage()));
        $app->stop();
    }
};

$app->get('/', function () use($app){
    $app->response->headers->set('Content-type', 'text/html');
    echo 'Welcome to API';
});

//get all users
$app->group('/api', function () use($app, $authentication){
    $app->group('/users', function() use($app, $authentication){
        $app->response->headers->set('Content-type', 'application/json');
        $app->get('/all', $authentication, function() use($app){
            $all = R::find('users');
            $all_users = R::exportAll($all);
            echo json_encode($all_users);
        });

        $app->get('/id/:id', $authentication, function ($id) use ($app){
            try{
                //get user by id
                $userid = R::load('users', $id);
                if($userid->id)
                {
                    $user = $userid->export();
                    echo json_encode($user);
                }
                else
                {
                    throw new Exception('User not found');
                }
            }catch(Exception $e){
                $app->status(400);
                echo json_encode(array('status' => 'error', 'message' => $e->getMessage()));
            }
        });
        //add new user
        $app->post('/new', $authentication, function () use($app){
            //get the data via POST
            try{
                $request = $app->request;
                $data = json_decode($request->getBody());
                $user = R::dispense('users');
                $user->name = $data->name;
                $user->lastname = $data->lastname;
                $user->email = $data->email;
                $inserted = R::store($user);
                if($inserted)
                {
                    echo json_encode(array('status' => 'success', 'message' => 'User added'));
                }
                else
                {
                    throw new Exception('Error while saving data');
                }
            }catch(Exception $e){
                $app->status(400);
                echo json_encode(array('status' => 'error', 'mesage' => $e->getMessage()));
            }
        });
        // update user
        $app->put('/update/:id', $authentication, function ($id) use($app) {
            //update user data
            try{
                $id = (int)$id;
                $request = $app->request;
                $data = json_decode($request->getBody());
                $user = R::load('users', $id);
                if($user->id)
                {
                    //updating user data
                    $user->name = $data->name;
                    $user->lastname = $data->lastname;
                    $user->email = $data->email;
                    R::store($user);
                    echo json_encode(array('status' => 'success', 'message' => 'User updated'));
                }
                else
                {
                    throw new Exception('Error while updating data');
                }
            }catch(Exception $e){
                $app->status(400);
                echo json_encode(array('status' => 'error', 'mesage' => $e->getMessage()));
            }
        });

        //delete user
        $app->delete('/delete/:id', $authentication, function ($id) use($app) {
            $id = (int)$id;

            try {
                //search and delete user
                $user =R::load('users', $id);
                if($user->id)
                {
                    R::trash($user);
                    echo json_encode(array('status' => 'success', 'message' => 'User deleted'));
                }
                else
                {
                    throw new Exception('Error while deleting user');
                }
            }catch(Exception $e){
                $app->status(400);
                echo json_encode(array('status' => 'error', 'mesage' => $e->getMessage()));
            }
        });

    });
});

$app->run();
