<?php
require_once "vendor/autoload.php";
require_once "env.php";
require_once "./src/slimConfiguration.php";
use function src\slimConfiguration;

$app = new \Slim\App(slimConfiguration());

$container = $app->getContainer();
$container['view'] = function($container) {
	$view = new \Slim\Views\Twig(__DIR__.'/views', [
		'cache' => false,
	]);
	$basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
	$view->addExtension(new \Slim\Views\TwigExtension($container['router'], $basePath));
	return $view;
};

require_once "./routes/routesRest.php";
require_once "./routes/routesWeb.php";
$app->run();