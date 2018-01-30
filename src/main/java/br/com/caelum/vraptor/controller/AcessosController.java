package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.AcessosDAO;
import br.edu.unoesc.model.usuario.Acessos;

@Path("/acessos")
@Controller
public class AcessosController {
	
	@Inject
	private Result result;
	
	@Inject
	private AcessosDAO acdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Acessos", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Acessos", 2) == false) {
					result.include("permissao", 2);
				}		
	
				List<Acessos> acessos = acdao.listar(Acessos.class,"TODOS_ACESSOS");
				
				result.include("acessos", acessos);
			}
		}
	}
}
