package br.com.caelum.vraptor.controller;

import java.util.ArrayList;
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
import br.edu.unoesc.dao.ContatoDAO;
import br.edu.unoesc.dao.EnderecoDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.pessoa.Contato;
import br.edu.unoesc.model.pessoa.Endereco;
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
	private EnderecoDAO edao;
	
	@Inject
	private ContatoDAO ctdao;
	
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
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
	}
	
	@Post("/salvar")
	public void salvar(Pessoa pessoa) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		System.out.println("Pessoa: " + pessoa);
		
		 if(pessoa.getCodigo() == null) {
			pessoa.setCriacao(new Date());
			pessoa.setAlteracao(new Date());
			
			List<Endereco> endlist = new ArrayList<Endereco>();
			endlist = pessoa.getEndereco();
			for(Endereco end : endlist) {
				end.setCriacao(new Date());
				end.setAlteracao(new Date());
				edao.salvar(end);
			}
			
			List<Contato> contlist = new ArrayList<Contato>();
			contlist = pessoa.getContato();
			for(Contato cont : contlist) {
				cont.setCriacao(new Date());
				cont.setAlteracao(new Date());
				ctdao.salvar(cont);
			}
			
			pessoa.setEndereco(endlist);
			pessoa.setContato(contlist);
			
			result.redirectTo(this).index(pdao.salvar(pessoa),0,1);
		}
		else {
			pessoa.setAlteracao(new Date());
			
			List<Endereco> endlist = new ArrayList<Endereco>();
			endlist = pessoa.getEndereco();
			for(Endereco end : endlist) {
				end.setAlteracao(new Date());
				edao.salvar(end);
			}
			
			List<Contato> contlist = new ArrayList<Contato>();
			contlist = pessoa.getContato();
			for(Contato cont : contlist) {
				cont.setAlteracao(new Date());
				ctdao.salvar(cont);
			}
			
			pessoa.setEndereco(endlist);
			pessoa.setContato(contlist);
			
			result.redirectTo(this).index(pdao.salvar(pessoa),1,1); 
		} 
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		Pessoa pessoa = pdao.buscar(Pessoa.class, cod);
		
		List<Endereco> ends = pessoa.getEndereco();
		int conta = 0;
		int contb = 0;
		int flag = 0;
		for(Endereco enda : ends) {
			for(Endereco endb : ends) {
				if(conta != contb) {
					if(enda.getCodigo() == endb.getCodigo()) {
						ends.set(contb, null);
						flag = 1;
						break;
					}
				}
				contb++;
			}
			conta++;
			if(flag == 1) break;
		}
		
		
		result.include("pessoa", pessoa);
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
