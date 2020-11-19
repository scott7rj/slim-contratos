<?php
namespace app\model;
use app\model\AppModel;

final class CompromissoSiplo extends AppModel {
    private $idCompromissoSiplo;
    private $compromissoSiplo;
    private $idContrato;
    private $contrato;
    private $numeroProcesso;

    public function __construct() {
        parent::__construct();
    }
    

    /**
     * @return mixed
     */
    public function getIdCompromissoSiplo()
    {
        return $this->idCompromissoSiplo;
    }

    /**
     * @param mixed $idCompromissoSiplo
     *
     * @return self
     */
    public function setIdCompromissoSiplo($idCompromissoSiplo)
    {
        $this->idCompromissoSiplo = $idCompromissoSiplo;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getCompromissoSiplo()
    {
        return $this->compromissoSiplo;
    }

    /**
     * @param mixed $compromissoSiplo
     *
     * @return self
     */
    public function setCompromissoSiplo($compromissoSiplo)
    {
        $this->compromissoSiplo = $compromissoSiplo;

        return $this;
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
    public function getNumeroProcesso()
    {
        return $this->numeroProcesso;
    }

    /**
     * @param mixed $numeroProcesso
     *
     * @return self
     */
    public function setNumeroProcesso($numeroProcesso)
    {
        $this->numeroProcesso = $numeroProcesso;

        return $this;
    }
}