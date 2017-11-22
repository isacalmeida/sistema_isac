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
import br.edu.unoesc.dao.AcessosDAO;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.outros.Programas;
import br.edu.unoesc.model.usuario.Acessos;

@Path("/programas")
@Controller
public class ProgramasController {

	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private ProgramasDAO podao;
	
	@Inject
	private AcessosDAO acdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Programas", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Programas", 2) == false) {
				result.include("permissao", 2);
			}
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Programas> programas = podao.listar(Programas.class, "TODOS_PROGRAMAS");
			int linhas = 10;
			if(conf != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = programas.size()/linhas;
			
			if(programas.size()%linhas > 0) {
				colunas++;
			}
			
			Programas[][] mprog = new Programas[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Programas prog : programas) {
				mprog[coluna][linha] = prog;
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
			if(programas.size() == 0) {
				result.include("programas", null);
				colunas = 1;
			}
			else {
				result.include("programas", mprog[tpag]);
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
		
		if(usuarioSessao.getPermissao("Programas", 2) == false) {
			result.include("permissao", 1);
		}
	}
	
	@Post("/salvar")
	public void salvar(Programas programa) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(programa.getCodigo() == null) {
			programa.setCriacao(new DateTime());
			programa.setAlteracao(new DateTime());
			
			result.redirectTo(this).index(podao.salvar(programa),0,1);
		}
		else {
			List<Programas> progs = podao.buscar(Programas.class, programa.getCodigo(), "PROGRAMA_POR_CODIGO");
			Programas prog = progs.get(0);
			
			programa.setCriacao(prog.getCriacao());
			programa.setAlteracao(new DateTime());

			result.redirectTo(this).index(podao.salvar(programa),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Programas", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Programas", 4) == false) {
			result.include("excluir", 1);
		}
		
		result.include("programa", podao.buscar(Programas.class, cod));
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Programas", 4) == false) {
			result.redirectTo(this).index(1,2,1);
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
				result.redirectTo(this).index(podao.excluir(prog),2,1);
			}
			else {
				result.redirectTo(this).index(0,2,1);
			}
		}
	}
}
