<?php
namespace app\model;
use app\model\AppModel;

final class TipoContrato extends AppModel {
    private $idTipoContrato;
    private $tipoContrato;
    private $ativo;

    public function __construct() {
        parent::__construct();
    }
    
    /**
     * @return mixed
     */
    public function getIdTipoContrato()
    {
        return $this->idTipoContrato;
    }

    /**
     * @param mixed $idTipoContrato
     *
     * @return self
     */
    public function setIdTipoContrato($idTipoContrato)
    {
        $this->idTipoContrato = $idTipoContrato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTipoContrato()
    {
        return $this->tipoContrato;
    }

    /**
     * @param mixed $tipoContrato
     *
     * @return self
     */
    public function setTipoContrato($tipoContrato)
    {
        $this->tipoContrato = $tipoContrato;

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