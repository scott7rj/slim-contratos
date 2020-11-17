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
	$view->addExtension(new \Slim\Views\TwigExtension(
		$container['router'],
		$container['request']->getUri()
	));
	return $view;
};

require_once "./routes/routes.php";
$app->run();