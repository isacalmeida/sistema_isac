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
import br.edu.unoesc.dao.EnderecoDAO;
import br.edu.unoesc.dao.EstadoDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Cep;
import br.edu.unoesc.model.pessoa.Cidade;
import br.edu.unoesc.model.pessoa.Endereco;
import br.edu.unoesc.model.pessoa.Estado;

@Path("/cep")
@Controller
public class CepController {
	
	@Inject
	private Result result;
	
	@Inject
	private CepDAO cedao;
	
	@Inject
	private CidadeDAO cidao;
	
	@Inject
	private EstadoDAO esdao;
	
	@Inject
	private EnderecoDAO endao;
	
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
			
			if(usuarioSessao.getPermissao("Cep", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Cep", 2) == false) {
					result.include("permissao", 2);
				}
				List<Cep> ceps = cedao.listar(Cep.class, "TODOS_CEPS");
				
				result.include("ceps", ceps);
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
			
			if(usuarioSessao.getPermissao("Cep", 2) == false) {
				result.include("permissao", 1);
			}
			
			List<Cidade> cidades = cidao.listar(Cidade.class, "TODAS_CIDADES");
			List<Estado> estados = esdao.listar(Estado.class, "TODOS_ESTADOS");
			
			result.include("cidades", cidades);
			result.include("estados", estados);
		}
	}
	
	@Post("/salvar")
	public void salvar(Cep cep, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(cep.getCodigo() == null) {
				cep.setCriacao(new DateTime());
				cep.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(cedao.salvar(cep),0);
			}
			else {
				List<Cep> ceps = cedao.buscar(Cep.class, cep.getCodigo(), "CEP_POR_CODIGO");
				Cep cep1 = ceps.get(0);
				
				cep.setCriacao(cep1.getCriacao());
				cep.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(cedao.salvar(cep),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(cep.getCodigo(),cedao.salvar(cep));
			}
		}
	}
	
	@Consumes(value="application/json")
	@Post("/gravar")
	public void gravar(Cep cep) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(cep.getCodigo() == null) {
				cep.setCriacao(new DateTime());
				cep.setAlteracao(new DateTime());
				
				Integer var = cedao.salvar(cep);
				if(var == 0) {
					result.use(Results.nothing());
				}
				else {
					Long cepResult = cedao.buscar(Cep.class, "ULTIMO_CEP_INCLUIDO");
					cep.setCodigo(cepResult);
					result.use(Results.json()).withoutRoot().from(cep).serialize();
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
			
			if(usuarioSessao.getPermissao("Cep", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Cep", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Cep> cep = cedao.buscar(Cep.class,cod,"CEP_POR_CODIGO");
			
			result.include("var", var);
			result.include("cep", cep.get(0));
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
			
			if(usuarioSessao.getPermissao("Cep", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Endereco> enderecos = endao.listar(Endereco.class, "TODOS_ENDERECOS");
				Cep cep = null;
			
				for (Endereco endereco : enderecos) {
					if(endereco.getCep().getCodigo()  == cod) {
						cep = endereco.getCep();
					}
				}
				
				if(cep == null){
					cep = cedao.buscar(Cep.class, cod);
					result.redirectTo(this).index(cedao.excluir(cep),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
