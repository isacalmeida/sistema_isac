package br.com.caelum.vraptor.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.usuario.Usuario;

@Path("/pessoa")
@Controller
public class PessoaController {
	
	@Inject
	private Result result;
	
	@Inject 
	private PessoaDAO pdao;	
	
	@Inject 
	private UsuarioDAO udao;
	
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
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		int linhas = 10;
		if(conf != null) {
			linhas = conf.getTabela_linhas();
		}
		int colunas = pessoas.size()/linhas;
		
		if(pessoas.size()%linhas > 0) {
			colunas++;
		}
		
		Pessoa[][] mpess = new Pessoa[colunas][linhas];
		
		int linha = 0;
		int coluna = 0;
		for(Pessoa pessoa : pessoas) {
			mpess[coluna][linha] = pessoa;
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
		if(pessoas.size() == 0) {
			result.include("pessoas", null);
			colunas = 1;
		}
		else {
			result.include("pessoas", mpess[tpag]);
		}
		result.include("colunas", colunas);
		result.include("pag", tpag);
		result.include("var", var);
		result.include("acao", acao);
	}
	
	@Get("/novo")
	public void novo(Integer logado, Integer menu, Integer var) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("logado", logado);
		result.include("menu", menu);
		result.include("var", var);
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		result.include("pessoas", pessoas);
	}
	
	@Post("/salvar")
	public void salvar(String nome, Boolean ativo, Long codigo) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Pessoa pessoa = new Pessoa();
		
		pessoa.setCodigo(codigo);
		pessoa.setNome_razao(nome);
		pessoa.setAtivo(ativo);
		pessoa.setCriacao(new Date());
		
		if(codigo == null) {
			result.redirectTo(this).index(pdao.salvar(pessoa),0,1);
		}
		else {
			result.redirectTo(this).index(pdao.salvar(pessoa),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("pessoa", pdao.buscar(Pessoa.class, cod));
	}
	
	@Get("/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
		Pessoa pessoa = null;
		
		for (Usuario usuario : usuarios) {
			if(usuario.getPessoa().getCodigo() == cod)
				 pessoa = usuario.getPessoa();
		}
		
		if(pessoa == null){
			pessoa = pdao.buscar(Pessoa.class, cod);
			result.redirectTo(this).index(pdao.excluir(pessoa),2,1);
		}
		else {
			result.redirectTo(this).index(0,2,1);
		}
	}
}
