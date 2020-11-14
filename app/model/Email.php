<?php
namespace app\model;
use app\model\AppModel;

final class Email extends AppModel {
    private $idEmail;
    private $idEmpresa;
    private $idTipoContato;
    private $tipoContato;
    private $email;
    private $usuarioAlteracao;
    private $ultimaAlteracao;

    public function __construct() {
        parent::__construct();
    }
    
    /**
     * @return mixed
     */
    public function getIdEmail()
    {
        return $this->idEmail;
    }

    /**
     * @param mixed $idEmail
     *
     * @return self
     */
    public function setIdEmail($idEmail)
    {
        $this->idEmail = $idEmail;

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
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $Email
     *
     * @return self
     */
    public function setEmail($email)
    {
        $this->email = $email;

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
}



