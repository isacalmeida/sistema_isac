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
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
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
	private ConfiguracoesDAO cdao;
	
	@Inject
	private PerfilAcessoDAO padao;
	
	@Inject
	private ProgramasDAO podao;
	
	@Inject
	private UsuarioDAO udao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Long cod = (long) 1;
		Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
		
		List<PerfilAcesso> perfis = padao.listar(PerfilAcesso.class, "TODOS_PERFIS");
		int linhas = 10;
		if(conf != null) {
			linhas = conf.getTabela_linhas();
		}
		int colunas = perfis.size()/linhas;
		
		if(perfis.size()%linhas > 0) {
			colunas++;
		}
		
		PerfilAcesso[][] mperfs = new PerfilAcesso[colunas][linhas];
		
		int linha = 0;
		int coluna = 0;
		for(PerfilAcesso perfil : perfis) {
			mperfs[coluna][linha] = perfil;
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
		if(perfis.size() == 0) {
			result.include("perfis", null);
			colunas = 1;
		}
		else {
			result.include("perfis", mperfs[tpag]);
		}
		result.include("colunas", colunas);
		result.include("pag", tpag);
		result.include("var", var);
		result.include("acao", acao);
	}
	
	@Get("/novo")
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<Programas> programas = podao.listar(Programas.class, "TODOS_PROGRAMAS");
		
		result.include("programas", programas);
	}
	
	@Post("/salvar")
	public void salvar(PerfilAcesso perfil) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		System.out.println("Salvando: "+ perfil);
		
		if(perfil.getCodigo() == null) {
			perfil.setCriacao(new DateTime());
			perfil.setAlteracao(new DateTime());
			
			List<Programas> prog = null;
			for(Acessos acesso : perfil.getAcessos()) {
				prog = podao.buscar(Programas.class, acesso.getPrograma().getCodigo(), "PROGRAMA_POR_CODIGO");
				acesso.setPerfilacesso(perfil);
				acesso.setPrograma(prog.get(0));
				if(acesso.getVisualizar() == null)
					acesso.setVisualizar(false);
				if(acesso.getIncluir() == null)
					acesso.setIncluir(false);
				if(acesso.getAlterar() == null)
					acesso.setAlterar(false);
				if(acesso.getRemover() == null)
					acesso.setRemover(false);
			}
			result.redirectTo(this).index(padao.salvar(perfil),0,1);
		}
		else {
			List<PerfilAcesso> perf = padao.buscar(PerfilAcesso.class, perfil.getCodigo(), "PERFIL_POR_CODIGO");
			PerfilAcesso per = perf.get(0);
			
			perfil.setCriacao(per.getCriacao());
			perfil.setAlteracao(new DateTime());
			
			for(Acessos acesso : perfil.getAcessos()) {
				if(acesso.getVisualizar() == null)
					acesso.setVisualizar(false);
				if(acesso.getIncluir() == null)
					acesso.setIncluir(false);
				if(acesso.getAlterar() == null)
					acesso.setAlterar(false);
				if(acesso.getRemover() == null)
					acesso.setRemover(false);
				acesso.setPerfilacesso(perfil);
			}
			
			if(usuarioSessao.getUsuario().getPerfil().getCodigo() == perfil.getCodigo())
				usuarioSessao.setPermissao(perfil);
			
			result.redirectTo(this).index(padao.salvar(perfil),0,1);
		}
		
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<PerfilAcesso> perfil = padao.buscar(PerfilAcesso.class,cod,"PERFIL_POR_CODIGO");
		//List<Programas> programas = podao.listar(Programas.class, "TODOS_PROGRAMAS");
		
		//result.include("programas", programas);
		result.include("perfil", perfil.get(0));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
		PerfilAcesso perfil = null;
		
		for (Usuario usuario : usuarios) {
			if(usuario.getPerfil().getCodigo() == cod)
				 perfil = usuario.getPerfil();
		}
		
		if(perfil == null){
			perfil = padao.buscar(PerfilAcesso.class, cod);
			result.redirectTo(this).index(padao.excluir(perfil),2,1);
		}
		else {
			result.redirectTo(this).index(0,2,1);
		}
	}
}
