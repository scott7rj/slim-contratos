<?php
namespace app\model;

final class TipoContrato {
    private $idTipoContrato;
    private $tipoContrato;
    private $ativo;
    private $ultimaAlteracao;
    private $usuarioAlteracao;

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
}