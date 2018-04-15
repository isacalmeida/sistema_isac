package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.edu.unoesc.beans.LicencaBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.FabricanteDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.produto.Fabricante;
import br.edu.unoesc.model.produto.Produto;

@Path("/fabricante")
@Controller
public class FabricanteController {
	
	@Inject
	private Result result;
	
	@Inject
	private FabricanteDAO fdao;
	
	@Inject
	private ProdutoDAO prdao;
	
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
			
			if(usuarioSessao.getPermissao("Fabricante", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Fabricante", 2) == false) {
					result.include("permissao", 2);
				}
				List<Fabricante> fabricantes = fdao.listar(Fabricante.class, "TODOS_FABRICANTES");
				
				result.include("fabricantes", fabricantes);
				result.include("var", var);
				result.include("acao", acao);
			}
		}
	}
	
	@Get("/novo")
	public void novo() {
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
			
			if(usuarioSessao.getPermissao("Fabricante", 2) == false) {
				result.include("permissao", 1);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Fabricante fabricante, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(fabricante.getCodigo() == null) {
				fabricante.setCriacao(new DateTime());
				fabricante.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(fdao.salvar(fabricante),0);
			}
			else {
				List<Fabricante> fabricantes = fdao.buscar(Fabricante.class, fabricante.getCodigo(), "FABRICANTE_POR_CODIGO");
				Fabricante fabri = fabricantes.get(0);
				
				fabricante.setCriacao(fabri.getCriacao());
				fabricante.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(fdao.salvar(fabricante),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(fabricante.getCodigo(),fdao.salvar(fabricante));
			}
		}
	}
	
	@Consumes(value="application/json")
	@Post("/gravar")
	public void gravar(Fabricante fabricante) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			System.out.println("TEste Fabricante: "+fabricante);
			if(fabricante.getCodigo() == null) {
				fabricante.setCriacao(new DateTime());
				fabricante.setAlteracao(new DateTime());
				
				Integer var = fdao.salvar(fabricante);
				if(var == 0) {
					result.use(Results.nothing());
				}
				else {
					Long fabResult = fdao.buscar(Fabricante.class, "ULTIMO_FABRICANTE_INCLUIDO");
					fabricante.setCodigo(fabResult);
					result.use(Results.json()).withoutRoot().from(fabricante).serialize();
				}
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
			
			if(usuarioSessao.getPermissao("Fabricante", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Fabricante", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Fabricante> fabricante = fdao.buscar(Fabricante.class,cod,"FABRICANTE_POR_CODIGO");
			
			result.include("var", var);
			result.include("fabricante", fabricante.get(0));
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
			
			if(usuarioSessao.getPermissao("Fabricante", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Produto> produtos = prdao.listar(Produto.class, "TODOS_PRODUTOS");
				Fabricante fabricante = null;
				
				for (Produto produto : produtos) {
					if(produto.getFabricante().getCodigo() == cod) {
						fabricante = produto.getFabricante();
					}
				}
				
				if(fabricante == null){
					fabricante = fdao.buscar(Fabricante.class, cod);
					result.redirectTo(this).index(fdao.excluir(fabricante),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
