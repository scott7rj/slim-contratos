<?php
require_once "vendor/autoload.php";
require_once "env.php";
require_once "./src/slimConfiguration.php";
use function src\slimConfiguration;

$app = new \Slim\App(slimConfiguration());
require_once "./routes/routes.php";
$app->run();