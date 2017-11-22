package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.CorDAO;
import br.edu.unoesc.dao.DepartamentoDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.produto.Cor;
import br.edu.unoesc.model.produto.Departamento;
import br.edu.unoesc.model.produto.Produto;

@Path("/produto")
@Controller
public class ProdutoController {
	
	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private ProdutoDAO prdao;
	
	@Inject
	private CorDAO crdao;
	
	@Inject
	private DepartamentoDAO dpdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Produto", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Produto", 2) == false) {
				result.include("permissao", 2);
			}
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Produto> produtos = prdao.listar(Produto.class, "TODOS_PRODUTOS");
			int linhas = 10;
			if(conf != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = produtos.size()/linhas;
			
			if(produtos.size()%linhas > 0) {
				colunas++;
			}
			
			Produto[][] mprod = new Produto[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Produto produto : produtos) {
				mprod[coluna][linha] = produto;
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
			if(produtos.size() == 0) {
				result.include("produtos", null);
				colunas = 1;
			}
			else {
				result.include("produtos", mprod[tpag]);
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
		
		if(usuarioSessao.getPermissao("Produto", 2) == false) {
			result.include("permissao", 1);
		}
		
		List<Cor> cores = crdao.listar(Cor.class, "TODAS_CORES");
		List<Departamento> departamentos = dpdao.listar(Departamento.class, "TODOS_DEPARTAMENTOS");
		
		result.include("cores", cores);
		result.include("departamentos", departamentos);
	}
	
	@Post("/salvar")
	public void salvar(Produto produto) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(produto.getCodigo() == null) {
			
			
		}
		else {
			
			
		}
		
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Produto", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Produto", 4) == false) {
			result.include("excluir", 1);
		}
		
		List<Produto> produto = prdao.buscar(Produto.class,cod,"PRODUTO_POR_CODIGO");
		
		result.include("produto", produto.get(0));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Cor", 4) == false) {
			result.redirectTo(this).index(1,2,1);
		}
		else {
			
		}
	}
}
