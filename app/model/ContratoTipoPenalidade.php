<?php
namespace app\model;
use app\model\AppModel;

final class ContratoTipoPenalidade extends AppModel {
    private $idContrato;
    private $contrato;
    private $idTipoPenalidade;
    private $tipoPenalidade;

    public function __construct() {
        parent::__construct();
    }
    

    /**
     * @return mixed
     */
    public function getIdContrato()
    {
        return $this->idContrato;
    }

    /**
     * @param mixed $idContrato
     *
     * @return self
     */
    public function setIdContrato($idContrato)
    {
        $this->idContrato = $idContrato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getContrato()
    {
        return $this->contrato;
    }

    /**
     * @param mixed $contrato
     *
     * @return self
     */
    public function setContrato($contrato)
    {
        $this->contrato = $contrato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdTipoPenalidade()
    {
        return $this->idTipoPenalidade;
    }

    /**
     * @param mixed $idTipoPenalidade
     *
     * @return self
     */
    public function setIdTipoPenalidade($idTipoPenalidade)
    {
        $this->idTipoPenalidade = $idTipoPenalidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTipoPenalidade()
    {
        return $this->tipoPenalidade;
    }

    /**
     * @param mixed $tipoPenalidade
     *
     * @return self
     */
    public function setTipoPenalidade($tipoPenalidade)
    {
        $this->tipoPenalidade = $tipoPenalidade;

        return $this;
    }
}