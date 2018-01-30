package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.usuario.Usuario;

@Path("/login")
@Controller
public class LoginController {

	@Inject
	private Result result;
	
	@Inject 
	private UsuarioDAO udao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(String var) {
		if(usuarioSessao.isLogado() == true)
			result.redirectTo(MenuController.class).index();
		else {
			try {
				if(udao.buscar(Usuario.class, 1L) == null)
					result.redirectTo(IndexController.class).index();
				else
					result.include("pagina", "login");
			} catch (DAOException e) {
				e.printStackTrace();
			}
		}
		result.include("var", var);
	}
	
	@Get("/senha")
	public void senha() {
		
	}
	
	@Get("/sair")
	public void sair() {
		if(usuarioSessao.isLogado() == true) {
			usuarioSessao.logout();
			result.redirectTo(LoginController.class).index("D");
		}
	}
	
	@Post("/logar")
	public void logar(String user, String pass) {
		List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
		Usuario carregado = null;
		int aux = 0;
		for (Usuario usuario : usuarios) {
			if(usuario.getUsuario().equals(user)) 
				if(usuario.getSenha().equals(pass)) {
					aux = 1;
					carregado = usuario;
				}
		}
		if(aux == 1) {
			usuarioSessao.login(carregado);
			result.redirectTo(MenuController.class).index();
		}
		else {
			result.redirectTo(this).index("N");
		}
	}
}