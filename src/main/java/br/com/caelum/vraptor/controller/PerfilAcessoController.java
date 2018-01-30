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
import br.edu.unoesc.dao.PerfilAcessoDAO;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Programas;
import br.edu.unoesc.model.usuario.Acessos;
import br.edu.unoesc.model.usuario.PerfilAcesso;
import br.edu.unoesc.model.usuario.Usuario;

@Path("/perfil_acesso")
@Controller
public class PerfilAcessoController {
	
	@Inject
	private Result result;
	
	@Inject
	private PerfilAcessoDAO padao;
	
	@Inject
	private ProgramasDAO pdao;
	
	@Inject
	private UsuarioDAO udao;
	
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
			
			if(usuarioSessao.getPermissao("Perfil de Acesso", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Perfil de Acesso", 2) == false) {
					result.include("permissao", 2);
				}		
				List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
				
				result.include("perfis", perfis);
				
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
			
			if(usuarioSessao.getPermissao("Perfil de Acesso", 2) == false) {
				result.include("permissao", 1);
			}
			
			result.include("programas", pdao.listar(Programas.class, "TODOS_PROGRAMAS"));
		}
	}
	
	@Post("/salvar")
	public void salvar(PerfilAcesso perfil, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(perfil.getCodigo() == null) {
				perfil.setCriacao(new DateTime());
				perfil.setAlteracao(new DateTime());
				
				List<Programas> prog = null;
				for(Acessos acesso : perfil.getAcessos()) {
					prog = pdao.buscar(Programas.class, acesso.getPrograma().getCodigo(), "PROGRAMA_POR_CODIGO");
					acesso.setPerfilacesso(perfil);
					acesso.setPrograma(prog.get(0));
				}
				
				result.redirectTo(this).index(padao.salvar(perfil),0);
			}
			else {
				List<PerfilAcesso> perf = padao.buscar(PerfilAcesso.class, perfil.getCodigo(), "PERFIL_POR_CODIGO");
				PerfilAcesso per = perf.get(0);
				
				perfil.setCriacao(per.getCriacao());
				perfil.setAlteracao(new DateTime());
				
				for(Acessos acesso : perfil.getAcessos()) {
					acesso.setPerfilacesso(perfil);
				}
				
				if(usuarioSessao.getUsuario().getPerfil().getCodigo() == perfil.getCodigo())
					usuarioSessao.setPermissao(perfil);
				
				if(submit == 1)
					result.redirectTo(this).index(padao.salvar(perfil),0);
				else if(submit == 2)
					result.redirectTo(this).editar(perfil.getCodigo(),padao.salvar(perfil));
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
			
			if(usuarioSessao.getPermissao("Perfil de Acesso", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Perfil de Acesso", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<PerfilAcesso> perfil = padao.buscar(PerfilAcesso.class,cod,"PERFIL_POR_CODIGO");
	
			result.include("var", var);
			result.include("perfil", perfil.get(0));
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
				List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
				PerfilAcesso perfil = null;
				
				for (Usuario usuario : usuarios) {
					if(usuario.getPerfil().getCodigo() == cod)
						 perfil = usuario.getPerfil();
				}
				
				if(perfil == null){
					perfil = padao.buscar(PerfilAcesso.class, cod);
					result.redirectTo(this).index(padao.excluir(perfil),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
