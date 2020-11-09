<?php
namespace app\model;

final class Documento {
    private $idDocumento;
    private $idTipoDocumento;
    private $idEmpresa;
    private $idContrato;
    private $idAtestePagamento;
    private $idPenalidade;
    private $dataValidade;
    private $nomeDocumento;
    private $ultimaAlteracao;
    private $usuarioAlteracao;
    private $observacao;
    

    /**
     * @return mixed
     */
    public function getIdDocumento()
    {
        return $this->idDocumento;
    }

    /**
     * @param mixed $idDocumento
     *
     * @return self
     */
    public function setIdDocumento($idDocumento)
    {
        $this->idDocumento = $idDocumento;

        return $this;
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
    public function getIdAtestePagamento()
    {
        return $this->idAtestePagamento;
    }

    /**
     * @param mixed $idAtestePagamento
     *
     * @return self
     */
    public function setIdAtestePagamento($idAtestePagamento)
    {
        $this->idAtestePagamento = $idAtestePagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdPenalidade()
    {
        return $this->idPenalidade;
    }

    /**
     * @param mixed $idPenalidade
     *
     * @return self
     */
    public function setIdPenalidade($idPenalidade)
    {
        $this->idPenalidade = $idPenalidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataValidade()
    {
        return $this->dataValidade;
    }

    /**
     * @param mixed $dataValidade
     *
     * @return self
     */
    public function setDataValidade($dataValidade)
    {
        $this->dataValidade = $dataValidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getNomeDocumento()
    {
        return $this->nomeDocumento;
    }

    /**
     * @param mixed $nomeDocumento
     *
     * @return self
     */
    public function setNomeDocumento($nomeDocumento)
    {
        $this->nomeDocumento = $nomeDocumento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUltimaAlteracao()
    {
        return $this->ultimaAlteracao;
    }

    /**
     * @param mixed $ultimaAlteracao
     *
     * @return self
     */
    public function setUltimaAlteracao($ultimaAlteracao)
    {
        $this->ultimaAlteracao = $ultimaAlteracao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUsuarioAlteracao()
    {
        return $this->usuarioAlteracao;
    }

    /**
     * @param mixed $usuarioAlteracao
     *
     * @return self
     */
    public function setUsuarioAlteracao($usuarioAlteracao)
    {
        $this->usuarioAlteracao = $usuarioAlteracao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getObservacao()
    {
        return $this->observacao;
    }

    /**
     * @param mixed $observacao
     *
     * @return self
     */
    public function setObservacao($observacao)
    {
        $this->observacao = $observacao;

        return $this;
    }
}