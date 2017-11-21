package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.AcessosDAO;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Acessos;
import br.edu.unoesc.model.outros.Configuracoes;

@Path("/acessos")
@Controller
public class AcessosController {
	
	@Inject
	private Result result;
	
	@Inject
	private AcessosDAO acdao;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Long cod = (long) 1;
		Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
		
		List<Acessos> acessos = acdao.listar(Acessos.class,"TODOS_ACESSOS");
		int linhas = 10;
		if(conf != null) {
			linhas = conf.getTabela_linhas();
		}
		int colunas = acessos.size()/linhas;
		
		if(acessos.size()%linhas > 0) {
			colunas++;
		}
		
		Acessos[][] macess = new Acessos[colunas][linhas];
		
		int linha = 0;
		int coluna = 0;
		for(Acessos acesso : acessos) {
			macess[coluna][linha] = acesso;
			linha ++;
			if(linha == linhas) {
				linha = 0;
				coluna ++;
			}
		}
		
		if(tpag == null) {
			tpag = 0;
		}
		else {
			tpag--;
		}
		if(acessos.size() == 0) {
			result.include("acessos", null);
			colunas = 1;
		}
		else {
			result.include("acessos", macess[tpag]);
		}
		result.include("colunas", colunas);
		result.include("pag", tpag);
		result.include("var", var);
		result.include("acao", acao);
	}
	
	@Get("/novo")
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
	}
	
	@Post("/salvar")
	public void salvar(Acessos acessos) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
	
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
	}
}
