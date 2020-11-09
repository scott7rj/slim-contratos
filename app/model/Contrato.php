<?php
namespace app\model;

final class Contrato {
    private $id_contrato;
    private $contrato;
    private $id_empresa;
    private $data_inicio;
    private $data_fim;
    private $id_tipo_contrato;
    private $valor_global_incial;
    private $objeto_contratual;
    private $compromisso_siplo;
    private $numero_processo;
    private $dia_pagamento;
    private $qtd_dias_alertar_pagamento;
    private $prazo_recebimento_nota_fiscal;
    private $dia_ateste;
    private $qtd_dias_alertar_ateste;
    private $ordem_servico;
    private $ultima_alteracao;
    private $usuario_alteracao;

    /**
     * @return mixed
     */
    public function getIdContrato()
    {
        return $this->id_contrato;
    }

    /**
     * @param mixed $id_contrato
     *
     * @return self
     */
    public function setIdContrato($id_contrato)
    {
        $this->id_contrato = $id_contrato;

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
        return $this->id_empresa;
    }

    /**
     * @param mixed $id_empresa
     *
     * @return self
     */
    public function setIdEmpresa($id_empresa)
    {
        $this->id_empresa = $id_empresa;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataInicio()
    {
        return $this->data_inicio;
    }

    /**
     * @param mixed $data_inicio
     *
     * @return self
     */
    public function setDataInicio($data_inicio)
    {
        $this->data_inicio = $data_inicio;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDataFim()
    {
        return $this->data_fim;
    }

    /**
     * @param mixed $data_fim
     *
     * @return self
     */
    public function setDataFim($data_fim)
    {
        $this->data_fim = $data_fim;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIdTipoContrato()
    {
        return $this->id_tipo_contrato;
    }

    /**
     * @param mixed $id_tipo_contrato
     *
     * @return self
     */
    public function setIdTipoContrato($id_tipo_contrato)
    {
        $this->id_tipo_contrato = $id_tipo_contrato;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getValorGlobalIncial()
    {
        return $this->valor_global_incial;
    }

    /**
     * @param mixed $valor_global_incial
     *
     * @return self
     */
    public function setValorGlobalIncial($valor_global_incial)
    {
        $this->valor_global_incial = $valor_global_incial;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getObjetoContratual()
    {
        return $this->objeto_contratual;
    }

    /**
     * @param mixed $objeto_contratual
     *
     * @return self
     */
    public function setObjetoContratual($objeto_contratual)
    {
        $this->objeto_contratual = $objeto_contratual;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getCompromissoSiplo()
    {
        return $this->compromisso_siplo;
    }

    /**
     * @param mixed $compromisso_siplo
     *
     * @return self
     */
    public function setCompromissoSiplo($compromisso_siplo)
    {
        $this->compromisso_siplo = $compromisso_siplo;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getNumeroProcesso()
    {
        return $this->numero_processo;
    }

    /**
     * @param mixed $numero_processo
     *
     * @return self
     */
    public function setNumeroProcesso($numero_processo)
    {
        $this->numero_processo = $numero_processo;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDiaPagamento()
    {
        return $this->dia_pagamento;
    }

    /**
     * @param mixed $dia_pagamento
     *
     * @return self
     */
    public function setDiaPagamento($dia_pagamento)
    {
        $this->dia_pagamento = $dia_pagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getQtdDiasAlertarPagamento()
    {
        return $this->qtd_dias_alertar_pagamento;
    }

    /**
     * @param mixed $qtd_dias_alertar_pagamento
     *
     * @return self
     */
    public function setQtdDiasAlertarPagamento($qtd_dias_alertar_pagamento)
    {
        $this->qtd_dias_alertar_pagamento = $qtd_dias_alertar_pagamento;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPrazoRecebimentoNotaFiscal()
    {
        return $this->prazo_recebimento_nota_fiscal;
    }

    /**
     * @param mixed $prazo_recebimento_nota_fiscal
     *
     * @return self
     */
    public function setPrazoRecebimentoNotaFiscal($prazo_recebimento_nota_fiscal)
    {
        $this->prazo_recebimento_nota_fiscal = $prazo_recebimento_nota_fiscal;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getDiaAteste()
    {
        return $this->dia_ateste;
    }

    /**
     * @param mixed $dia_ateste
     *
     * @return self
     */
    public function setDiaAteste($dia_ateste)
    {
        $this->dia_ateste = $dia_ateste;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getQtdDiasAlertarAteste()
    {
        return $this->qtd_dias_alertar_ateste;
    }

    /**
     * @param mixed $qtd_dias_alertar_ateste
     *
     * @return self
     */
    public function setQtdDiasAlertarAteste($qtd_dias_alertar_ateste)
    {
        $this->qtd_dias_alertar_ateste = $qtd_dias_alertar_ateste;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getOrdemServico()
    {
        return $this->ordem_servico;
    }

    /**
     * @param mixed $ordem_servico
     *
     * @return self
     */
    public function setOrdemServico($ordem_servico)
    {
        $this->ordem_servico = $ordem_servico;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUltimaAlteracao()
    {
        return $this->ultima_alteracao;
    }

    /**
     * @param mixed $ultima_alteracao
     *
     * @return self
     */
    public function setUltimaAlteracao($ultima_alteracao)
    {
        $this->ultima_alteracao = $ultima_alteracao;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUsuarioAlteracao()
    {
        return $this->usuario_alteracao;
    }

    /**
     * @param mixed $usuario_alteracao
     *
     * @return self
     */
    public function setUsuarioAlteracao($usuario_alteracao)
    {
        $this->usuario_alteracao = $usuario_alteracao;

        return $this;
    }
}