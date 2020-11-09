<?php
namespace app\model;

final class DominioDocumento {
    private $idDominioDocumento;
    private $DominioDocumento;

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