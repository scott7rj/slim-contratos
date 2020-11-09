<?php
namespace app\LDAP;

use app\model\Usuario;

final class LdapDAO {

	public function autenticar(Usuario $usuario) {
		$array =  array("matricula" => "", "erro" => "");

		$ldap_connect = ldap_connect(getenv('LDAP_SERVER'));
		ldap_set_option($ldap_connect, LDAP_OPT_PROTOCOL_VERSION, 3);
		ldap_set_option($ldap_connect, LDAP_OPT_REFERRALS, 0);

		$ldapbind = @ldap_bind($ldap_connect, "uid=".$usuario->getMatricula().',ou=People,o=caixa', $usuario->getPassword());

		if($ldapbind) {
			$search_filter = sprintf('(uid=%s)', $usuario->getMatricula() );
			$search_handle = ldap_search($ldap_connect, 'ou=People,o=caixa', $search_filter);

			if(!$search_handle) {
				$array = array(
					"matricula" => "",
					"erro" => "Servidor de Autenticação Indisponí­vel (LDAP: erro na consulta)."
				);
			} else {
				$ldap_resultado = ldap_get_entries($ldap_connect, $search_handle);

				if($ldap_resultado['count'] === 0 ) {
					$array = array(
						"matricula" => "",
						"erro" => "Usuário sem perfil de acesso."
					);
				} else {

					$ldap_user	= $ldap_resultado[0];
					$id_unidade	= $ldap_user['nu-lotacaofisica'][0];
					$array = array(
						"matricula" => strtoupper($ldap_user["co-usuario"][0]),
						"nome" => $ldap_user["no-usuario"][0],
						"idFuncao"	=> $ldap_user["nu-funcao"][0],
						"funcao" => $ldap_user["title"][0],
						"idUnidade" => $id_unidade,
						"sgUnidade" => $ldap_user["sg-unidade"][0],
						"nmUnidade" => $ldap_user["no-lotacaofisica"][0],
						"erro" => ""
					);
				}
			}

		} else {
			$array = array("matricula" => "", "erro" => "Acesso Negado<br>Usuário ou senha incorretos.");
		}
		return $array;

	}

}