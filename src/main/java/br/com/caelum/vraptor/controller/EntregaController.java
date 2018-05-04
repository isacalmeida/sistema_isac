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
import br.edu.unoesc.dao.EntregaDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.produto.Entrega;

@Path("/entrega")
@Controller
public class EntregaController {
	
	@Inject
	private Result result;
	
	@Inject
	private EntregaDAO etdao;
	
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
			
			if(usuarioSessao.getPermissao("Acessos", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				result.include("usuario_nome", usuarioSessao.getNome());
				result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
				result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
				result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
				result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
				result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
				
				if(usuarioSessao.getPermissao("Acessos", 2) == false) {
					result.include("permissao", 2);
				}		
	
				List<Entrega> entregas = etdao.listar(Entrega.class,"TODAS_ENTREGAS");
				result.include("entregas", entregas);
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
			
			if(usuarioSessao.getPermissao("Entrega", 2) == false) {
				result.include("permissao", 1);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Entrega entrega, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(entrega.getCodigo() == null) {
				entrega.setCriacao(new DateTime());
				entrega.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(etdao.salvar(entrega),0);
			}
			else {
				List<Entrega> entregas = etdao.buscar(Entrega.class, entrega.getCodigo(), "ENTREGA_POR_CODIGO");
				Entrega entrega1 = entregas.get(0);
				
				entrega.setCriacao(entrega1.getCriacao());
				entrega.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(etdao.salvar(entrega),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(entrega.getCodigo(),etdao.salvar(entrega));
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
			
			if(usuarioSessao.getPermissao("Entrega", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Entrega", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Entrega> entrega = etdao.buscar(Entrega.class,cod,"ENTREGA_POR_CODIGO");
			
			result.include("var", var);
			result.include("entrega", entrega.get(0));
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
			
			if(usuarioSessao.getPermissao("Entrega", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Entrega> entrega = etdao.buscar(Entrega.class,cod,"ENTREGA_POR_CODIGO");
				
				result.redirectTo(this).index(etdao.excluir(entrega.get(0)),2);
				
			}
		}
	}
}
