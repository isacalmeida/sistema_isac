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
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;

@Path("/configuracoes")
@Controller
public class ConfiguracoesController {
	
	@Inject
	private Result result;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Geral", 1) == false) {
			result.include("permissao", 1);
		}
		else {
			if(usuarioSessao.getPermissao("Geral", 2) == false) {
				result.include("permissao", 2);
			}		
			Long cod = (long) 1;
			Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
			
			List<Configuracoes> confs = cdao.listar(Configuracoes.class, "TODAS_CONFIGURACOES");
			int linhas = 10;
			if(conf.getTabela_linhas() != null) {
				linhas = conf.getTabela_linhas();
			}
			int colunas = confs.size()/linhas;
			
			if(confs.size()%linhas > 0) {
				colunas++;
			}
			
			Configuracoes[][] mconfs = new Configuracoes[colunas][linhas];
			
			int linha = 0;
			int coluna = 0;
			for(Configuracoes confes : confs) {
				mconfs[coluna][linha] = confes;
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
			if(confs.size() == 0) {
				result.include("confs", null);
				colunas = 1;
			}
			else {
				result.include("confs", mconfs[tpag]);
			}
			result.include("colunas", colunas);
			result.include("pag", tpag);
			result.include("var", var);
			result.include("acao", acao);
		}
	}
	
	@Post("/salvar")
	public void salvar(Integer linhasMatriz, Boolean ativo, Long codigo) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Configuracoes confs = new Configuracoes();
		
		confs.setCodigo(codigo);
		confs.setTabela_linhas(linhasMatriz);
		confs.setAtivo(ativo);
		confs.setAlteracao(new DateTime());
		
		if(codigo == null) {
			result.redirectTo(this).index(cdao.salvar(confs),0,1);
		}
		else {
			result.redirectTo(this).index(cdao.salvar(confs),1,1);
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		if(usuarioSessao.getPermissao("Geral", 3) == false) {
			result.include("editar", 1);
		}
		if(usuarioSessao.getPermissao("Geral", 4) == false) {
			result.include("excluir", 1);
		}
		
		result.include("confs", cdao.buscar(Configuracoes.class, cod));
	}
}
