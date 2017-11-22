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
import br.edu.unoesc.dao.CorDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.produto.Cor;
import br.edu.unoesc.model.produto.Produto;

@Path("/cor")
@Controller
public class CorController {
	
	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private CorDAO crdao;
	
	@Inject
	private ProdutoDAO prdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Cor", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Cor", 2) == false) {
				result.include("permissao", 2);
			}
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Cor> cores = crdao.listar(Cor.class, "TODAS_CORES");
			int linhas = 10;
			if(conf != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = cores.size()/linhas;
			
			if(cores.size()%linhas > 0) {
				colunas++;
			}
			
			Cor[][] mcors = new Cor[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Cor cor : cores) {
				mcors[coluna][linha] = cor;
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
			if(cores.size() == 0) {
				result.include("cores", null);
				colunas = 1;
			}
			else {
				result.include("cores", mcors[tpag]);
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
		
		if(usuarioSessao.getPermissao("Cor", 2) == false) {
			result.include("permissao", 1);
		}
	}
	
	@Post("/salvar")
	public void salvar(Cor cor) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(cor.getCodigo() == null) {
			cor.setCriacao(new DateTime());
			cor.setAlteracao(new DateTime());
			
			result.redirectTo(this).index(crdao.salvar(cor),0,1);
		}
		else {
			List<Cor> cores = crdao.buscar(Cor.class, cor.getCodigo(), "COR_POR_CODIGO");
			Cor cor1 = cores.get(0);
			
			cor.setCriacao(cor1.getCriacao());
			cor.setAlteracao(new DateTime());

			result.redirectTo(this).index(crdao.salvar(cor),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Cor", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Cor", 4) == false) {
			result.include("excluir", 1);
		}
		
		List<Cor> cor = crdao.buscar(Cor.class,cod,"COR_POR_CODIGO");
		
		result.include("cor", cor.get(0));
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
			List<Produto> produtos = prdao.listar(Produto.class, "TODOS_PRODUTOS");
			Cor cor = null;
			
			for (Produto produto : produtos) {
				for(Cor coraux : produto.getCor()) {
					if(coraux.getCodigo() == cod) {
						cor = coraux;
					}
				}
			}
			
			if(cor == null){
				cor = crdao.buscar(Cor.class, cod);
				result.redirectTo(this).index(crdao.excluir(cor),2,1);
			}
			else {
				result.redirectTo(this).index(0,2,1);
			}
		}
	}
}
