<?php
namespace app\model;
use app\model\AppModel;

final class Contrato extends AppModel {
    private $idContrato;
    private $contrato;
    private $idEmpresa;
    private $empresa;
    private $dataInicio;
    private $dataFim;
    private $idTipoContrato;
    private $tipoContrato;
    private $valorGlobalInicial;
    private $objetoContratual;
    private $compromissoSiplo;
    private $numeroProcesso;
    private $diaPagamento;
    private $qtdDiasAlertarPagamento;
    private $prazoRecebimentoNotaFiscal;
    private $diaAteste;
    private $qtdDiasAlertarAteste;
    private $ordemServico;

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
    public function getIdEmpresa()
    {
        return $this->idEmpresa;
    }

    /**
     * @param mixed $idEmpresa
     *
     * @return self
     */
    public function setIdEmpresa($idEmpresa)
    {
        $this->idEmpresa = $idEmpresa;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getEmpresa()
    {
        return $this->empresa;
    }

    /**
     * @param mixed $empresa
     *
     * @return self
     */
    public function setEmpresa($empresa)
    {
        $this->empresa = $empresa;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataInicio()
    {
        return $this->dataInicio;
    }

    /**
     * @param mixed $dataInicio
     *
     * @return self
     */
    public function setDataInicio($dataInicio)
    {
        $this->dataInicio = $dataInicio;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataFim()
    {
        return $this->dataFim;
    }

    /**
     * @param mixed $dataFim
     *
     * @return self
     */
    public function setDataFim($dataFim)
    {
        $this->dataFim = $dataFim;

        return $this;
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
    public function getValorGlobalInicial()
    {
        return $this->valorGlobalInicial;
    }

    /**
     * @param mixed $valorGlobalIncial
     *
     * @return self
     */
    public function setValorGlobalInicial($valorGlobalInicial)
    {
        $this->valorGlobalInicial = $valorGlobalInicial;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getObjetoContratual()
    {
        return $this->objetoContratual;
    }

    /**
     * @param mixed $objetoContratual
     *
     * @return self
     */
    public function setObjetoContratual($objetoContratual)
    {
        $this->objetoContratual = $objetoContratual;

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

    /**
     * @return mixed
     */
    public function getDiaPagamento()
    {
        return $this->diaPagamento;
    }

    /**
     * @param mixed $diaPagamento
     *
     * @return self
     */
    public function setDiaPagamento($diaPagamento)
    {
        $this->diaPagamento = $diaPagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getQtdDiasAlertarPagamento()
    {
        return $this->qtdDiasAlertarPagamento;
    }

    /**
     * @param mixed $qtdDiasAlertarPagamento
     *
     * @return self
     */
    public function setQtdDiasAlertarPagamento($qtdDiasAlertarPagamento)
    {
        $this->qtdDiasAlertarPagamento = $qtdDiasAlertarPagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoRecebimentoNotaFiscal()
    {
        return $this->prazoRecebimentoNotaFiscal;
    }

    /**
     * @param mixed $prazoRecebimentoNotaFiscal
     *
     * @return self
     */
    public function setPrazoRecebimentoNotaFiscal($prazoRecebimentoNotaFiscal)
    {
        $this->prazoRecebimentoNotaFiscal = $prazoRecebimentoNotaFiscal;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDiaAteste()
    {
        return $this->diaAteste;
    }

    /**
     * @param mixed $diaAteste
     *
     * @return self
     */
    public function setDiaAteste($diaAteste)
    {
        $this->diaAteste = $diaAteste;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getQtdDiasAlertarAteste()
    {
        return $this->qtdDiasAlertarAteste;
    }

    /**
     * @param mixed $qtdDiasAlertarAteste
     *
     * @return self
     */
    public function setQtdDiasAlertarAteste($qtdDiasAlertarAteste)
    {
        $this->qtdDiasAlertarAteste = $qtdDiasAlertarAteste;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getOrdemServico()
    {
        return $this->ordemServico;
    }

    /**
     * @param mixed $ordemServico
     *
     * @return self
     */
    public function setOrdemServico($ordemServico)
    {
        $this->ordemServico = $ordemServico;

        return $this;
    }
}