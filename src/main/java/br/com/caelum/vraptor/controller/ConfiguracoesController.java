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
			
			if(usuarioSessao.getPermissao("Geral", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Geral", 2) == false) {
					result.include("permissao", 2);
				}		
				
				List<Configuracoes> confs = cdao.listar(Configuracoes.class, "TODAS_CONFIGURACOES");
				
				result.include("confs", confs);
			
				result.include("var", var);
				result.include("acao", acao);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Configuracoes configuracao, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(configuracao.getCodigo() == null) {
				configuracao.setCriacao(new DateTime());
				configuracao.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(cdao.salvar(configuracao), 0);
			}
			else {
				List<Configuracoes> confs = cdao.buscar(Configuracoes.class, configuracao.getCodigo(), "CONFIGURACOES_POR_CODIGO");
				
				configuracao.setCriacao(confs.get(0).getCriacao());
				configuracao.setAlteracao(new DateTime());
				
				if(submit == 1) {
					result.redirectTo(this).index(cdao.salvar(configuracao), 1);
				}
				if(submit == 2) {
					result.redirectTo(this).editar(configuracao.getCodigo(), cdao.salvar(configuracao));
				}
			}
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod, Integer var) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Geral", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Geral", 4) == false) {
				result.include("excluir", 1);
			}
			
			result.include("var", var);
			result.include("configuracao", cdao.buscar(Configuracoes.class, cod));
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
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Geral", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
				result.redirectTo(this).index(cdao.excluir(conf),2);
			}
		}
	}
}
