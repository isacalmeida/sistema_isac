package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.edu.unoesc.beans.LicencaBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.CidadeDAO;
import br.edu.unoesc.dao.EstadoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Cidade;
import br.edu.unoesc.model.pessoa.Estado;

@Path("/estado")
@Controller
public class EstadoController {
	
	@Inject
	private Result result;
	
	@Inject
	private EstadoDAO esdao;
	
	@Inject
	private CidadeDAO cidao;
	
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
			
			if(usuarioSessao.getPermissao("Estado", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Estado", 2) == false) {
					result.include("permissao", 2);
				}
				List<Estado> estados = esdao.listar(Estado.class, "TODOS_ESTADOS");
				
				result.include("estados", estados);
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
			
			if(usuarioSessao.getPermissao("Estado", 2) == false) {
				result.include("permissao", 1);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Estado estado, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(estado.getCodigo() == null) {
				estado.setCriacao(new DateTime());
				estado.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(esdao.salvar(estado),0);
			}
			else {
				List<Estado> estados = esdao.buscar(Estado.class, estado.getCodigo(), "ESTADO_POR_CODIGO");
				Estado estado1 = estados.get(0);
				
				estado.setCriacao(estado1.getCriacao());
				estado.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(esdao.salvar(estado),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(estado.getCodigo(),esdao.salvar(estado));
			}
		}
	}
	
	@Consumes(value="application/json")
	@Post("/gravar")
	public void gravar(Estado estado) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(estado.getCodigo() == null) {
				estado.setCriacao(new DateTime());
				estado.setAlteracao(new DateTime());
				
				Integer var = esdao.salvar(estado);
				if(var == 0) {
					result.use(Results.nothing());
				}
				else {
					Long estadoResult = esdao.buscar(Estado.class, "ULTIMO_ESTADO_INCLUIDO");
					estado.setCodigo(estadoResult);
					result.use(Results.json()).withoutRoot().from(estado).serialize();
				}
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
			
			if(usuarioSessao.getPermissao("Estado", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Estado", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Estado> estado = esdao.buscar(Estado.class,cod,"ESTADO_POR_CODIGO");
			
			result.include("var", var);
			result.include("estado", estado.get(0));
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
				List<Cidade> cidades = cidao.listar(Cidade.class, "TODAS_CIDADES");
				Estado estado = null;
			
				for (Cidade cidade : cidades) {
					if(cidade.getEstado().getCodigo()  == cod) {
						estado = cidade.getEstado();
					}
				}
				
				if(estado == null){
					estado = esdao.buscar(Estado.class, cod);
					result.redirectTo(this).index(esdao.excluir(estado),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
