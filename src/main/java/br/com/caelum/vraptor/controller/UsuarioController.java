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
import br.edu.unoesc.dao.PerfilAcessoDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
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
	private ConfiguracoesDAO cdao;
	
	@Inject
	private PerfilAcessoDAO padao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Usuario", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Usuario", 2) == false) {
				result.include("permissao", 2);
			}
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
			int linhas = 10;
			if(conf != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = usuarios.size()/linhas;
			
			if(usuarios.size()%linhas > 0) {
				colunas++;
			}
			
			Usuario[][] muser = new Usuario[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Usuario usuario : usuarios) {
				muser[coluna][linha] = usuario;
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
			if(usuarios.size() == 0) {
				result.include("usuarios", null);
				colunas = 1;
			}
			else {
				result.include("usuarios", muser[tpag]);
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
		
		if(usuarioSessao.getPermissao("Usuario", 2) == false) {
			result.include("permissao", 1);
		}
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
		
		result.include("pessoas", pessoas);
		result.include("perfis", perfis);
	}
	
	@Post("/salvar")
	public void salvar(Usuario usuario) throws DAOException {
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
			
			result.redirectTo(this).index(udao.salvar(usuario),0,1);
		}
		else {
			System.out.println("USUARIO: "+ usuario);
			List<Pessoa> pessoa = pdao.buscar(Pessoa.class, usuario.getPessoa().getCodigo(), "PESSOA_POR_CODIGO");
			List<PerfilAcesso> perfil = padao.buscar(PerfilAcesso.class, usuario.getPerfil().getCodigo(), "PERFIL_POR_CODIGO");
			List<Usuario> user = udao.buscar(Usuario.class, usuario.getCodigo(), "USUARIO_POR_CODIGO");
			
			usuario.setCriacao(user.get(0).getCriacao());
			usuario.setAlteracao(new DateTime());
			
			usuario.setPessoa(pessoa.get(0));
			usuario.setPerfil(perfil.get(0));
			
			result.redirectTo(this).index(udao.salvar(usuario),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
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
		result.include("user", udao.buscar(Usuario.class, cod));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Usuario", 4) == false) {
			result.redirectTo(this).index(1,2,1);
		}
		else {
			result.redirectTo(this).index(udao.excluir(udao.buscar(Usuario.class, cod)),2,1);
		}
	}
}
