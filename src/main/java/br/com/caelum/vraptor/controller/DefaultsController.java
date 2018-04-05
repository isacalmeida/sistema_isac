package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;

@Path("/defaults")
@Controller
public class DefaultsController {
	
	@Inject
	private Result result;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("/header")
	public void header(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
	
	@Get("/main")
	public void main(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
	
	@Get("/menu")
	public void menu(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
	
	@Get("/copyright")
	public void copyright(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
	
	@Get("/footer")
	public void footer(){
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.redirectTo(MenuController.class).index();
		}
	}
}
