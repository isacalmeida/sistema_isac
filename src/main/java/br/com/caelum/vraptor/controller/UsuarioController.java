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
import br.edu.unoesc.dao.PerfilAcessoDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.usuario.PerfilAcesso;
import br.edu.unoesc.model.usuario.Usuario;

@Path("/usuario")
@Controller
public class UsuarioController {

	@Inject
	private Result result;
	
	@Inject 
	private UsuarioDAO udao;
	
	@Inject
	private PessoaDAO pdao;
	
	@Inject
	private PerfilAcessoDAO padao;
	
	@Inject
	private LicencaBean licencaSessao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
		result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
		result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
		result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
		result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
		
		if(usuarioSessao.getPermissao("Usuario", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Usuario", 2) == false) {
				result.include("permissao", 2);
			}
			List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
			
			result.include("usuarios", usuarios);
			
			result.include("var", var);
			result.include("acao", acao);
		}
	}
	
	@Get("/novo")
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
		result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
		result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
		result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
		result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
		
		if(usuarioSessao.getPermissao("Usuario", 2) == false) {
			result.include("permissao", 1);
		}
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
		
		result.include("pessoas", pessoas);
		result.include("perfis", perfis);
	}
	
	@Post("/salvar")
	public void salvar(Usuario usuario, Integer submit) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuario.getCodigo() == null) {
			List<Pessoa> pessoa = pdao.buscar(Pessoa.class, usuario.getPessoa().getCodigo(), "PESSOA_POR_CODIGO");
			List<PerfilAcesso> perfil = padao.buscar(PerfilAcesso.class, usuario.getPerfil().getCodigo(), "PERFIL_POR_CODIGO");
			
			usuario.setCriacao(new DateTime());
			usuario.setAlteracao(new DateTime());
			
			usuario.setPessoa(pessoa.get(0));
			usuario.setPerfil(perfil.get(0));
			usuario.setFoto(pessoa.get(0).getImagem());
			
			result.redirectTo(this).index(udao.salvar(usuario),0);
		}
		else {
			List<Pessoa> pessoa = pdao.buscar(Pessoa.class, usuario.getPessoa().getCodigo(), "PESSOA_POR_CODIGO");
			List<PerfilAcesso> perfil = padao.buscar(PerfilAcesso.class, usuario.getPerfil().getCodigo(), "PERFIL_POR_CODIGO");
			List<Usuario> user = udao.buscar(Usuario.class, usuario.getCodigo(), "USUARIO_POR_CODIGO");
			
			usuario.setCriacao(user.get(0).getCriacao());
			usuario.setAlteracao(new DateTime());
			
			usuario.setPessoa(pessoa.get(0));
			usuario.setPerfil(perfil.get(0));
			usuario.setFoto(pessoa.get(0).getImagem());
			
			if(submit == 1)
				result.redirectTo(this).index(udao.salvar(usuario),1);
			else if(submit == 2)
				result.redirectTo(this).editar(usuario.getCodigo(),udao.salvar(usuario));
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod, Integer var) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
		result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
		result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
		result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
		result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
		
		if(usuarioSessao.getPermissao("Usuario", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Usuario", 4) == false) {
			result.include("excluir", 1);
		}
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
		result.include("pessoas", pessoas);
		result.include("perfis", perfis);
		result.include("var", var);
		result.include("usuario", udao.buscar(Usuario.class, cod));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Usuario", 4) == false) {
			result.redirectTo(this).index(1,2);
		}
		else {
			result.redirectTo(this).index(udao.excluir(udao.buscar(Usuario.class, cod)),2);
		}
	}
}
