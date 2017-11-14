package br.com.caelum.vraptor.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.outros.Programas;

@Path("/programas")
@Controller
public class ProgramasController {

	@Inject
	private Result result;
	
	@Inject
	private ProgramasDAO pdao;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Long cod = (long) 1;
		Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
		
		List<Programas> programas = pdao.listar(Programas.class, "TODOS_PROGRAMAS");
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
	
	@Get("/novo")
	public void novo(Integer logado, Integer menu, Integer var) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("logado", logado);
		result.include("menu", menu);
		result.include("var", var);
		
		List<Programas> programas = pdao.listar(Programas.class, "TODOS_PROGRAMAS");
		result.include("programas", programas);
	}
	
	@Post("/salvar")
	public void salvar(String programa, String endereco, Boolean ativo, Long codigo) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Programas programas = new Programas();
		
		programas.setCodigo(codigo);
		programas.setDescricao(programa);
		programas.setEndereco(endereco);
		programas.setAtivo(ativo);
		programas.setCriacao(new Date());
		
		if(codigo == null) {
			result.redirectTo(this).index(pdao.salvar(programas),0,1);
		}
		else {
			result.redirectTo(this).index(pdao.salvar(programas),1,1);
		}
	}
	
	@Post("/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.include("prog", pdao.buscar(Programas.class, cod));
	}
	
	@Get("/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		result.redirectTo(this).index(pdao.excluir(pdao.buscar(Programas.class, cod)),2,1);
	}
	
	@Get("/busca.json")
	public void buscaJson(String nome){
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		//A lista = json().newInstance().withoutRoot().from(pdao.listar(Programas.class, "TODOS_PROGRAMAS")).serialize();
		
				
		List<Programas> lista = pdao.listar(Programas.class, "TODOS_PROGRAMAS");

		System.out.println("Teste: "+ lista);
		//result.use(json()).withoutRoot().from(pdao.buscar(Programas.class, nome, "TODOS_PRODUTOS")).exclude("codigo", "data", "ativo").serialize();
	}
}
