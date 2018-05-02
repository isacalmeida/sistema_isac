package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.LicencaBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.EntregaDAO;
import br.edu.unoesc.model.produto.Entrega;

@Path("/entrega")
@Controller
public class EntregaController {
	
	@Inject
	private Result result;
	
	@Inject
	private EntregaDAO etdao;
	
	@Inject 
	private LicencaBean licencaSessao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			
			if(usuarioSessao.getPermissao("Acessos", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				result.include("usuario_nome", usuarioSessao.getNome());
				result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
				result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
				result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
				result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
				result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
				
				if(usuarioSessao.getPermissao("Acessos", 2) == false) {
					result.include("permissao", 2);
				}		
	
				List<Entrega> entregas = etdao.listar(Entrega.class,"TODAS_ENTREGAS");
				result.include("entregas", entregas);
			}
		}
	}
}
