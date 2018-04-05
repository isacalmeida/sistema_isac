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
import br.edu.unoesc.dao.DepartamentoDAO;
import br.edu.unoesc.dao.ProdutoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.produto.Departamento;
import br.edu.unoesc.model.produto.Produto;

@Path("/departamento")
@Controller
public class DepartamentoController {
	
	@Inject
	private Result result;
	
	@Inject
	private DepartamentoDAO dpdao;
	
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
			
			if(usuarioSessao.getPermissao("Departamento", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Departamento", 2) == false) {
					result.include("permissao", 2);
				}
				
				List<Departamento> departamentos = dpdao.listar(Departamento.class,"TODOS_DEPARTAMENTOS");
				
				result.include("departamentos", departamentos);
				
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
			
			if(usuarioSessao.getPermissao("Departamento", 2) == false) {
				result.include("permissao", 1);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Departamento departamento, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(departamento.getCodigo() == null) {
				departamento.setCriacao(new DateTime());
				departamento.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(dpdao.salvar(departamento),0);
			}
			else {
				List<Departamento> dpto = dpdao.buscar(Departamento.class, departamento.getCodigo(), "DEPARTAMENTO_POR_CODIGO");
				Departamento dep = dpto.get(0);
				
				departamento.setCriacao(dep.getCriacao());
				departamento.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(dpdao.salvar(departamento),1);
				else if(submit == 2)
					result.redirectTo(this).editar(departamento.getCodigo(),dpdao.salvar(departamento));
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
			
			if(usuarioSessao.getPermissao("Departamento", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Departamento", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Departamento> departamento = dpdao.buscar(Departamento.class, cod,"DEPARTAMENTO_POR_CODIGO");
			
			result.include("var", var);
			result.include("departamento", departamento.get(0));
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
			
			if(usuarioSessao.getPermissao("Pessoa", 4) == false) {
				result.redirectTo(this).index(1,2);
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
					result.redirectTo(this).index(dpdao.excluir(departamento),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
