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
import br.edu.unoesc.dao.AcessosDAO;
import br.edu.unoesc.dao.PerfilAcessoDAO;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Programas;
import br.edu.unoesc.model.usuario.Acessos;
import br.edu.unoesc.model.usuario.PerfilAcesso;

@Path("/programas")
@Controller
public class ProgramasController {

	@Inject
	private Result result;
	
	@Inject
	private ProgramasDAO podao;
	
	@Inject
	private AcessosDAO acdao;
	
	@Inject
	private PerfilAcessoDAO padao;
	
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
			
			if(usuarioSessao.getPermissao("Programas", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Programas", 2) == false) {
					result.include("permissao", 2);
				}
				List<Programas> programas = podao.listar(Programas.class, "TODOS_PROGRAMAS");
				result.include("progs", programas);
				
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
			
			if(usuarioSessao.getPermissao("Programas", 2) == false) {
				result.include("permissao", 1);
			}
		}	
	}
	
	@Post("/salvar")
	public void salvar(Programas programa, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(programa.getCodigo() == null) {
				programa.setCriacao(new DateTime());
				programa.setAlteracao(new DateTime());
				
				List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
				List<Acessos> acessos = null;
				
				Acessos acesso = new Acessos();
				acesso.setPrograma(programa);
				acesso.setVisualizar(false);
				acesso.setIncluir(false);
				acesso.setAlterar(false);
				acesso.setRemover(false);
				
				Integer var = podao.salvar(programa);
				
				for(PerfilAcesso perfil : perfis) {
					acesso.setPerfilacesso(perfil);
					acessos = perfil.getAcessos();
					acessos.add(acesso);
					perfil.setAlteracao(new DateTime());
					padao.salvar(perfil);
				}
				
				result.redirectTo(this).index(var,0);
			}
			else {
				List<Programas> progs = podao.buscar(Programas.class, programa.getCodigo(), "PROGRAMA_POR_CODIGO");
				Programas prog = progs.get(0);
				
				programa.setCriacao(prog.getCriacao());
				programa.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(podao.salvar(programa),1);
				else if(submit == 2)
					result.redirectTo(this).editar(programa.getCodigo(),podao.salvar(programa));
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
			
			if(usuarioSessao.getPermissao("Programas", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Programas", 4) == false) {
				result.include("excluir", 1);
			}
			
			result.include("var", var);
			result.include("programa", podao.buscar(Programas.class, cod));
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
		
			if(usuarioSessao.getPermissao("Programas", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Acessos> acessos = acdao.listar(Acessos.class, "TODOS_ACESSOS");
				Programas prog = null;
				
				for (Acessos acesso : acessos) {
					if(acesso.getPrograma().getCodigo() == cod) {
						prog = acesso.getPrograma();
					}
				}
				
				if(prog == null){
					prog = podao.buscar(Programas.class, cod);
					result.redirectTo(this).index(podao.excluir(prog),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
