package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.ConfiguracoesBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.PerfilAcessoDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.outros.Programas;

@Path("/")
@Controller
public class IndexController {

	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private PessoaDAO pdao;
	
	@Inject
	private ProgramasDAO podao;
	
	@Inject
	private PerfilAcessoDAO pfdao;
	
	@Inject
	private UsuarioDAO udao;
	
	@Inject
	private UsuarioBean usuarioSessao;
		
	@Get("")
	public void index() throws DAOException{
		if(cdao.buscar(Configuracoes.class, 1L) == null) {
			ConfiguracoesBean confs = new ConfiguracoesBean();
			
			cdao.salvar(confs.getConfs());
			pdao.salvar(confs.getPess());
			for(Programas prog : confs.getProgramas()) {
				podao.salvar(prog);
			}
			pfdao.salvar(confs.getPerfil());
			udao.salvar(confs.getUser());
			
		}
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else
			result.redirectTo(MenuController.class).index();
	}
}
