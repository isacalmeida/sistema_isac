package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.model.outros.Programas;

@Path("/menu")
@Controller
public class MenuController {
	
	@Inject
	private Result result;
	
	@Inject
	private ProgramasDAO pdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("programas", pdao.listar(Programas.class, "TODOS_PROGRAMAS"));
	}
	
	@Get("/cadastros")
	public void cadastros() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("programas", pdao.listar(Programas.class, "TODOS_PROGRAMAS"));
	}
	
	@Get("/configuracoes")
	public void configuracoes() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("programas", pdao.listar(Programas.class, "TODOS_PROGRAMAS"));
	}
}
