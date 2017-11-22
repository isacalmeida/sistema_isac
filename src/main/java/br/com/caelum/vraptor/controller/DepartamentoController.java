package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.DepartamentoDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.produto.Departamento;
import br.edu.unoesc.model.produto.Produto;

@Path("/departamento")
@Controller
public class DepartamentoController {
	
	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private DepartamentoDAO dpdao;
	
	@Inject
	private ProdutoDAO prdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Departamento", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Departamento", 2) == false) {
				result.include("permissao", 2);
			}
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Departamento> departamentos = dpdao.listar(Departamento.class,"TODOS_DEPARTAMENTOS");
			int linhas = 10;
			if(conf != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = departamentos.size()/linhas;
			
			if(departamentos.size()%linhas > 0) {
				colunas++;
			}
			
			Departamento[][] mdepts = new Departamento[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Departamento dpto : departamentos) {
				mdepts[coluna][linha] = dpto;
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
			if(departamentos.size() == 0) {
				result.include("departamentos", null);
				colunas = 1;
			}
			else {
				result.include("departamentos", mdepts[tpag]);
			}
			result.include("colunas", colunas);
			result.include("pag", tpag);
			result.include("var", var);
			result.include("acao", acao);
		}
	}
	
	@Get("/novo")
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Departamento", 2) == false) {
			result.include("permissao", 1);
		}
	}
	
	@Post("/salvar")
	public void salvar(Departamento departamento) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(departamento.getCodigo() == null) {
			departamento.setCriacao(new DateTime());
			departamento.setAlteracao(new DateTime());
			
			result.redirectTo(this).index(dpdao.salvar(departamento),0,1);
		}
		else {
			List<Departamento> dpto = dpdao.buscar(Departamento.class, departamento.getCodigo(), "DEPARTAMENTO_POR_CODIGO");
			Departamento dep = dpto.get(0);
			
			departamento.setCriacao(dep.getCriacao());
			departamento.setAlteracao(new DateTime());

			result.redirectTo(this).index(dpdao.salvar(departamento),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Departamento", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Departamento", 4) == false) {
			result.include("excluir", 1);
		}
		
		List<Departamento> departamento = dpdao.buscar(Departamento.class, cod,"DEPARTAMENTO_POR_CODIGO");
		
		result.include("departamento", departamento.get(0));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Pessoa", 4) == false) {
			result.redirectTo(this).index(1,2,1);
		}
		else {
			List<Produto> produtos = prdao.listar(Produto.class, "TODOS_PRODUTOS");
			Departamento departamento = null;
			
			for (Produto produto : produtos) {
				if(produto.getDepartamento().getCodigo() == cod)
					departamento = produto.getDepartamento();
			}
			
			if(departamento == null){
				departamento = dpdao.buscar(Departamento.class, cod);
				result.redirectTo(this).index(dpdao.excluir(departamento),2,1);
			}
			else {
				result.redirectTo(this).index(0,2,1);
			}
		}
		
	}
}
