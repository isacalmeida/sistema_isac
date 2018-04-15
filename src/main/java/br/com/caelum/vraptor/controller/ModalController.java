package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;

@Path("/modal")
@Controller
public class ModalController {
	
	@Inject
	private Result result;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("/cor")
	public void cor(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
	
	@Get("/fabricante")
	public void fabricante(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}

}
