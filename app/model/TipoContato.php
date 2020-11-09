<?php
namespace app\model;

use AppModel;

final class TipoContato extends AppModel {
    private $idTipoContato;
    private $tipoContato;
    private $ativo;
    
    public function __construct() {
        parent::__construct();
    }
    /**
     * @return mixed
     */
    public function getIdTipoContato()
    {
        return $this->idTipoContato;
    }

    /**
     * @param mixed $idTipoContato
     *
     * @return self
     */
    public function setIdTipoContato($idTipoContato)
    {
        $this->idTipoContato = $idTipoContato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTipoContato()
    {
        return $this->tipoContato;
    }

    /**
     * @param mixed $tipoContato
     *
     * @return self
     */
    public function setTipoContato($tipoContato)
    {
        $this->tipoContato = $tipoContato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getAtivo()
    {
        return $this->ativo;
    }

    /**
     * @param mixed $ativo
     *
     * @return self
     */
    public function setAtivo($ativo)
    {
        $this->ativo = $ativo;

        return $this;
    }
}