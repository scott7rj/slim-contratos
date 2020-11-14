<?php
namespace app\model;
use app\model\AppModel;

final class TipoDocumento extends AppModel {
    private $idTipoDocumento;
    private $tipoDocumento;
    private $possuiValidade;
    private $idDominioDocumento;
    private $ativo;

    public function __construct() {
        parent::__construct();
    }
    /**
     * @return mixed
     */
    public function getIdTipoDocumento()
    {
        return $this->idTipoDocumento;
    }

    /**
     * @param mixed $idTipoDocumento
     *
     * @return self
     */
    public function setIdTipoDocumento($idTipoDocumento)
    {
        $this->idTipoDocumento = $idTipoDocumento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
    }

    /**
     * @param mixed $tipoDocumento
     *
     * @return self
     */
    public function setTipoDocumento($tipoDocumento)
    {
        $this->tipoDocumento = $tipoDocumento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPossuiValidade()
    {
        return $this->possuiValidade;
    }

    /**
     * @param mixed $possuiValidade
     *
     * @return self
     */
    public function setPossuiValidade($possuiValidade)
    {
        $this->possuiValidade = $possuiValidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdDominioDocumento()
    {
        return $this->idDominioDocumento;
    }

    /**
     * @param mixed $idDominioDocumento
     *
     * @return self
     */
    public function setIdDominioDocumento($idDominioDocumento)
    {
        $this->idDominioDocumento = $idDominioDocumento;

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