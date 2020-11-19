<?php
namespace app\controller;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use app\dao\TipoContatoDAO;
use app\model\TipoContato;
use app\controller\AppController;
use Exception;

final class TwigController extends AppController {
    public function __construct() {
        parent::__construct();
    }
    public function twig(Request $request, Response $response, array $args): Response {
        return $this->view->render($response, 'twig.twig');
    }
}