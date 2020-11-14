<?php
namespace app\model;
use app\model\AppModel;

final class Uf extends AppModel {
    private $uf;
    private $nomeUf;
    
    public function __construct() {
        parent::__construct();
    }
    

    /**
     * @return mixed
     */
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * @param mixed $uf
     *
     * @return self
     */
    public function setUf($uf)
    {
        $this->uf = $uf;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getNomeUf()
    {
        return $this->nomeUf;
    }

    /**
     * @param mixed $nomeUf
     *
     * @return self
     */
    public function setNomeUf($nomeUf)
    {
        $this->nomeUf = $nomeUf;

        return $this;
    }
}