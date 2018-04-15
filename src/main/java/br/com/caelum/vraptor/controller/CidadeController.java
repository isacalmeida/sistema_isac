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
import br.edu.unoesc.dao.CepDAO;
import br.edu.unoesc.dao.CidadeDAO;
import br.edu.unoesc.dao.EstadoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Cep;
import br.edu.unoesc.model.pessoa.Cidade;
import br.edu.unoesc.model.pessoa.Estado;

@Path("/cidade")
@Controller
public class CidadeController {
	
	@Inject
	private Result result;
	
	@Inject
	private CepDAO cedao;
	
	@Inject
	private CidadeDAO cidao;
	
	@Inject 
	private EstadoDAO esdao;
	
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
			
			if(usuarioSessao.getPermissao("Cidade", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Cidade", 2) == false) {
					result.include("permissao", 2);
				}
				List<Cidade> cidades = cidao.listar(Cidade.class, "TODAS_CIDADES");
				
				result.include("cidades", cidades);
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
			
			if(usuarioSessao.getPermissao("Cidade", 2) == false) {
				result.include("permissao", 1);
			}
			
			List<Estado> estados = esdao.listar(Estado.class, "TODOS_ESTADOS");
			
			result.include("estados", estados);
		}
	}
	
	
	@Post("/salvar")
	public void salvar(Cidade cidade, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(cidade.getCodigo() == null) {
				cidade.setCriacao(new DateTime());
				cidade.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(cidao.salvar(cidade),0);
			}
			else {
				List<Cidade> cidades = cidao.buscar(Cidade.class, cidade.getCodigo(), "CIDADE_POR_CODIGO");
				Cidade cidade1 = cidades.get(0);
				
				cidade.setCriacao(cidade1.getCriacao());
				cidade.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(cidao.salvar(cidade),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(cidade.getCodigo(),cidao.salvar(cidade));
			}
		}
	}
	
	@Consumes(value="application/json")
	@Post("/gravar")
	public void gravar(Cidade cidade) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(cidade.getCodigo() == null) {
				cidade.setCriacao(new DateTime());
				cidade.setAlteracao(new DateTime());
				
				Integer var = cidao.salvar(cidade);
				if(var == 0) {
					result.use(Results.nothing());
				}
				else {
					Long cidadeResult = cidao.buscar(Cidade.class, "ULTIMA_CIDADE_INCLUIDA");
					cidade.setCodigo(cidadeResult);
					result.use(Results.json()).withoutRoot().from(cidade).serialize();
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
			
			if(usuarioSessao.getPermissao("Cidade", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Cidade", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Cidade> cidade = cidao.buscar(Cidade.class,cod,"CIDADE_POR_CODIGO");
			List<Estado> estados = esdao.listar(Estado.class,  "TODOS_ESTADOS");
			
			result.include("var", var);
			result.include("cidade", cidade.get(0));
			result.include("estados", estados);
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
			
			if(usuarioSessao.getPermissao("Cidade", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Cep> ceps = cedao.listar(Cep.class, "TODOS_CEPS");
				Cidade cidade = null;
			
				for (Cep cep : ceps) {
					if(cep.getCidade().getCodigo()  == cod) {
						cidade = cep.getCidade();
					}
				}
				
				if(cidade == null){
					cidade = cidao.buscar(Cidade.class, cod);
					result.redirectTo(this).index(cidao.excluir(cidade),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
