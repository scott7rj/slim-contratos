<?php
namespace app\model;
use app\model\AppModel;

final class Usuario extends AppModel {
	private $idUnidade;
    private $matricula;
    private $nome;
    private $idFuncao;
    private $funcao;
    private $sgUnidade;
    private $unidade;
    private $password;

    public function __construct() {
        parent::__construct();
    }

    /**
     * @return mixed
     */
    public function getIdUnidade()
    {
        return $this->idUnidade;
    }

    /**
     * @param mixed $idUnidade
     *
     * @return self
     */
    public function setIdUnidade($idUnidade)
    {
        $this->idUnidade = $idUnidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getMatricula()
    {
        return $this->matricula;
    }

    /**
     * @param mixed $matricula
     *
     * @return self
     */
    public function setMatricula($matricula)
    {
        $this->matricula = $matricula;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * @param mixed $nome
     *
     * @return self
     */
    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdFuncao()
    {
        return $this->idFuncao;
    }

    /**
     * @param mixed $idFuncao
     *
     * @return self
     */
    public function setIdFuncao($idFuncao)
    {
        $this->idFuncao = $idFuncao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getFuncao()
    {
        return $this->funcao;
    }

    /**
     * @param mixed $funcao
     *
     * @return self
     */
    public function setFuncao($funcao)
    {
        $this->funcao = $funcao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getSgUnidade()
    {
        return $this->sgUnidade;
    }

    /**
     * @param mixed $sgUnidade
     *
     * @return self
     */
    public function setSgUnidade($sgUnidade)
    {
        $this->sgUnidade = $sgUnidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUnidade()
    {
        return $this->unidade;
    }

    /**
     * @param mixed $unidade
     *
     * @return self
     */
    public function setUnidade($unidade)
    {
        $this->unidade = $unidade;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param mixed $password
     *
     * @return self
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }
}