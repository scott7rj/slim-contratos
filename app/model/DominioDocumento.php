<?php
namespace app\model;
use app\model\AppModel;

final class DominioDocumento extends AppModel {
    private $idDominioDocumento;
    private $DominioDocumento;

    public function __construct() {
        parent::__construct();
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
    public function getDominioDocumento()
    {
        return $this->DominioDocumento;
    }

    /**
     * @param mixed $DominioDocumento
     *
     * @return self
     */
    public function setDominioDocumento($DominioDocumento)
    {
        $this->DominioDocumento = $DominioDocumento;

        return $this;
    }
}