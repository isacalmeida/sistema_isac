package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.LicencaBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.CorDAO;
import br.edu.unoesc.dao.DepartamentoDAO;
import br.edu.unoesc.dao.FabricanteDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.produto.Cor;
import br.edu.unoesc.model.produto.Departamento;
import br.edu.unoesc.model.produto.Fabricante;
import br.edu.unoesc.model.produto.Produto;

@Path("/produto")
@Controller
public class ProdutoController {
	
	@Inject
	private Result result;
	
	@Inject
	private ProdutoDAO prdao;
	
	@Inject
	private CorDAO crdao;
	
	@Inject
	private DepartamentoDAO dpdao;
	
	@Inject
	private FabricanteDAO fdao;
	
	@Inject
	private PessoaDAO pedao;
	
	@Inject
	private LicencaBean licencaSessao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
			result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
			
			if(usuarioSessao.getPermissao("Produto", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Produto", 2) == false) {
					result.include("permissao", 2);
				}
				List<Produto> produtos = prdao.listar(Produto.class, "TODOS_PRODUTOS");
				result.include("produtos", produtos);
				
				result.include("var", var);
				result.include("acao", acao);
			}
		}
	}
	
	@Get("/novo")
	public void novo(Produto prod) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
			result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
			
			if(usuarioSessao.getPermissao("Produto", 2) == false) {
				result.include("permissao", 1);
			}
			
			List<Cor> cores = crdao.listar(Cor.class, "TODAS_CORES");
			List<Departamento> departamentos = dpdao.listar(Departamento.class, "TODOS_DEPARTAMENTOS");
			List<Fabricante> fabricantes = fdao.listar(Fabricante.class, "TODOS_FABRICANTES");
			List<Pessoa> fornecedores = pedao.listar(Pessoa.class, "PESSOA_FORNECEDOR");
			
			if(prod != null) {
				result.include("produto", prod);
			}
			result.include("cores", cores);
			result.include("departamentos", departamentos);
			result.include("fabricantes", fabricantes);
			result.include("fornecedores", fornecedores);
		}
	}
	
	@Post("/salvar")
	public void salvar(Produto produto, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(produto.getCodigo() == null) {
				produto.setCriacao(new DateTime());
				produto.setAlteracao(new DateTime());
				
				if(produto.getImagem() == null) {
					String endImagem = new String("/imagem/produto/avatar_default.png");
					produto.setImagem(endImagem);
				}
				else {
					String endImagem = new String("/imagem/produto/avatar_default.png");
					produto.setImagem(endImagem);
				}
				
				result.redirectTo(this).index(prdao.salvar(produto),0);
			}
			else {
				List<Produto> produtos = prdao.buscar(Produto.class, produto.getCodigo(), "PRODUTO_POR_CODIGO");
				Produto prod = produtos.get(0);
				
				produto.setCriacao(prod.getCriacao());
				produto.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(prdao.salvar(produto),1);
				else if(submit == 2)
					result.redirectTo(this).editar(produto.getCodigo(),prdao.salvar(produto));
					
			}
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod, Integer var) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
			result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
			
			if(usuarioSessao.getPermissao("Produto", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Produto", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Produto> produto = prdao.buscar(Produto.class,cod,"PRODUTO_POR_CODIGO");
			List<Cor> cores = crdao.listar(Cor.class, "TODAS_CORES");
			List<Departamento> departamentos = dpdao.listar(Departamento.class, "TODOS_DEPARTAMENTOS");
			List<Pessoa> fornecedores = pedao.listar(Pessoa.class, "PESSOA_FORNECEDOR");
			
			result.include("cores", cores);
			result.include("departamentos", departamentos);
			result.include("fornecedores", fornecedores);
			result.include("produto", produto.get(0));
			result.include("var", var);
		}
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(usuarioSessao.getPermissao("Cor", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				result.redirectTo(this).index(prdao.excluir(prdao.buscar(Produto.class, cod)),2);
			}
		}
	}
}
