<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\controller\AppController;
use app\LDAP\LdapDAO;
use app\model\Usuario;
use Exception;

final class LoginController extends AppController {

    public function __construct() {
        parent::__construct();
    }

    public function autenticar(Request $request, Response $response, array $args): Response {
    	try {
    		$data = $request->getParsedBody();
    		$model = new Usuario();
            $model->setMatricula($data['matricula']);
            $model->setPassword($data['password']);
            $ldapDAO = new LdapDAO();
            $result = $ldapDAO->autenticar($model);
            $response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
}