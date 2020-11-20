<?php
namespace app\model;

abstract class AppModel {

    protected $usuarioAlteracao;
    protected $ultimaAlteracao;
    protected $mensagem;
    protected $status;
    protected $ativo;

    public function __construct() {

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
        $this->usuarioAlteracao = trim($usuarioAlteracao);

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
    public function getMensagem()
    {
        return $this->mensagem;
    }

    /**
     * @param mixed $mensagem
     *
     * @return self
     */
    public function setMensagem($mensagem)
    {
        $this->mensagem = $mensagem;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param mixed $status
     *
     * @return self
     */
    public function setStatus($status)
    {
        $this->status = $status;

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
     * @param mixed $status
     *
     * @return self
     */
    public function setAtivo($ativo)
    {
        $this->ativo = $ativo;

        return $this;
    }
}