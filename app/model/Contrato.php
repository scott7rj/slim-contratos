<?php
namespace app\model;
use app\model\AppModel;

final class Contrato extends AppModel {
    private $idContrato;
    private $idEmpresa;
    private $idTipoContrato;
    private $numeroProcesso;
    private $numeroOrdemServico;
    private $dataAssinatura;
    private $dataInicioVigencia;
    private $dataFimVigencia;
    private $valorGlobalInicial;
    private $valorGlobalAtualizado;
    private $objetoContratual;
    private $diaPagamento;
    private $diaPagamentoCorridos;
    private $prazoAlertaDiasPagamento;
    private $prazoAlertaDiasAteste;
    private $prazoAlertaDiasNotaFiscal;
    private $prazoAlertaMesesFimVigencia;

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
    public function getNumeroOrdemServico()
    {
        return $this->numeroOrdemServico;
    }

    /**
     * @param mixed $numeroOrdemServico
     *
     * @return self
     */
    public function setNumeroOrdemServico($numeroOrdemServico)
    {
        $this->numeroOrdemServico = $numeroOrdemServico;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataAssinatura()
    {
        return $this->dataAssinatura;
    }

    /**
     * @param mixed $dataAssinatura
     *
     * @return self
     */
    public function setDataAssinatura($dataAssinatura)
    {
        $this->dataAssinatura = $dataAssinatura;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataInicioVigencia()
    {
        return $this->dataInicioVigencia;
    }

    /**
     * @param mixed $dataInicioVigencia
     *
     * @return self
     */
    public function setDataInicioVigencia($dataInicioVigencia)
    {
        $this->dataInicioVigencia = $dataInicioVigencia;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataFimVigencia()
    {
        return $this->dataFimVigencia;
    }

    /**
     * @param mixed $dataFimVigencia
     *
     * @return self
     */
    public function setDataFimVigencia($dataFimVigencia)
    {
        $this->dataFimVigencia = $dataFimVigencia;

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
     * @param mixed $valorGlobalInicial
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
    public function getValorGlobalAtualizado()
    {
        return $this->valorGlobalAtualizado;
    }

    /**
     * @param mixed $valorGlobalAtualizado
     *
     * @return self
     */
    public function setValorGlobalAtualizado($valorGlobalAtualizado)
    {
        $this->valorGlobalAtualizado = $valorGlobalAtualizado;

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
    public function getDiaPagamentoCorridos()
    {
        return $this->diaPagamentoCorridos;
    }

    /**
     * @param mixed $diaPagamentoCorridos
     *
     * @return self
     */
    public function setDiaPagamentoCorridos($diaPagamentoCorridos)
    {
        $this->diaPagamentoCorridos = $diaPagamentoCorridos;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoAlertaDiasPagamento()
    {
        return $this->prazoAlertaDiasPagamento;
    }

    /**
     * @param mixed $prazoAlertaDiasPagamento
     *
     * @return self
     */
    public function setPrazoAlertaDiasPagamento($prazoAlertaDiasPagamento)
    {
        $this->prazoAlertaDiasPagamento = $prazoAlertaDiasPagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoAlertaDiasAteste()
    {
        return $this->prazoAlertaDiasAteste;
    }

    /**
     * @param mixed $prazoAlertaDiasAteste
     *
     * @return self
     */
    public function setPrazoAlertaDiasAteste($prazoAlertaDiasAteste)
    {
        $this->prazoAlertaDiasAteste = $prazoAlertaDiasAteste;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoAlertaDiasNotaFiscal()
    {
        return $this->prazoAlertaDiasNotaFiscal;
    }

    /**
     * @param mixed $prazoAlertaDiasNotaFiscal
     *
     * @return self
     */
    public function setPrazoAlertaDiasNotaFiscal($prazoAlertaDiasNotaFiscal)
    {
        $this->prazoAlertaDiasNotaFiscal = $prazoAlertaDiasNotaFiscal;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoAlertaMesesFimVigencia()
    {
        return $this->prazoAlertaMesesFimVigencia;
    }

    /**
     * @param mixed $prazoAlertaMesesFimVigencia
     *
     * @return self
     */
    public function setPrazoAlertaMesesFimVigencia($prazoAlertaMesesFimVigencia)
    {
        $this->prazoAlertaMesesFimVigencia = $prazoAlertaMesesFimVigencia;

        return $this;
    }
}