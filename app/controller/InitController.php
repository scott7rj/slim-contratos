<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\controller\AppController;
use app\ldap\LdapDAO;
use app\model\Usuario;
use Exception;

final class InitController extends AppController {

    public function __construct() {
        parent::__construct();
    }

    public function init(Request $request, Response $response, array $args): Response {
    	try {
    		$response->getBody()->write("Hello Slim");
            //$response = $response->withJson($result);
            return $response;
        } catch (Exception $e) {
            $response = $response->withJson($this->getErroJson($e->getMessage()));
            return $response;
        }
    }
}