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
import br.edu.unoesc.dao.EntregaDAO;
import br.edu.unoesc.dao.EstadoDAO;
import br.edu.unoesc.dao.FreteDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.pessoa.Estado;
import br.edu.unoesc.model.produto.Entrega;
import br.edu.unoesc.model.produto.Frete;

@Path("/frete")
@Controller
public class FreteController {
	
	@Inject
	private Result result;
	
	@Inject
	private FreteDAO ftdao;
	
	@Inject
	private EntregaDAO etdao;
	
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
			
			if(usuarioSessao.getPermissao("Frete", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				result.include("usuario_nome", usuarioSessao.getNome());
				result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
				result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
				result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
				result.include("versao_sistema", licencaSessao.getLicenca().getVersao());
				result.include("licenciamento", licencaSessao.getLicenca().getLicenciamento());
				
				if(usuarioSessao.getPermissao("Frete", 2) == false) {
					result.include("permissao", 2);
				}		
	
				List<Frete> fretes = ftdao.listar(Frete.class,"TODOS_FRETES");
				result.include("fretes", fretes);
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
			
			if(usuarioSessao.getPermissao("Frete", 2) == false) {
				result.include("permissao", 1);
			}
		}
	}
	
	@Post("/salvar")
	public void salvar(Frete frete, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(frete.getCodigo() == null) {
				frete.setCriacao(new DateTime());
				frete.setAlteracao(new DateTime());
				
				result.redirectTo(this).index(ftdao.salvar(frete),0);
			}
			else {
				List<Frete> fretes = ftdao.buscar(Frete.class, frete.getCodigo(), "FRETE_POR_CODIGO");
				Frete frete1 = fretes.get(0);
				
				frete.setCriacao(frete1.getCriacao());
				frete.setAlteracao(new DateTime());
				
				if(submit == 1)
					result.redirectTo(this).index(ftdao.salvar(frete),1);
				else if(submit == 2) 
					result.redirectTo(this).editar(frete.getCodigo(),ftdao.salvar(frete));
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
			
			if(usuarioSessao.getPermissao("Frete", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Frete", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Frete> frete = ftdao.buscar(Frete.class,cod,"FRETE_POR_CODIGO");
			
			result.include("var", var);
			result.include("frete", frete.get(0));
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
			
			if(usuarioSessao.getPermissao("Frete", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Entrega> entregas = etdao.listar(Entrega.class, "TODAS_ENTREGAS");
				Frete frete = null;
				
				for (Entrega entrega : entregas) {
					if(entrega.getFrete().getCodigo() == cod) {
						frete = entrega.getFrete();
					}
				}
				
				if(frete == null){
					frete = ftdao.buscar(Frete.class, cod);
					result.redirectTo(this).index(ftdao.excluir(frete),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
	
	@Consumes(value="application/json")
	@Post("/calcula_frete")
	public void calcula_frete(String uf_origem, String uf_destino, Double peso) {
		
		List<Estado> origem = esdao.buscar(Estado.class, uf_origem, "ESTADO_POR_DESCRICAO");
		List<Estado> destino = esdao.buscar(Estado.class, uf_destino, "ESTADO_POR_DESCRICAO");
		
		if(origem.isEmpty() || destino.isEmpty() || peso == null)
			result.use(Results.json()).withoutRoot().from(0).serialize();
		else {
			Frete frete = null;
			List<Frete> fretes = ftdao.listar(Frete.class, "TODOS_FRETES");
			
			for(Frete freteaux : fretes) {
				if(freteaux.getUf_origem().getCodigo() == origem.get(0).getCodigo())
					if(freteaux.getUf_destino().getCodigo() == destino.get(0).getCodigo())
						if(freteaux.getQuilo_de() <= peso && freteaux.getQuilo_ate() >= peso)
							frete = freteaux;
			}
			
			if(frete == null)
				result.use(Results.json()).withoutRoot().from(0).serialize();
			else {
				frete.setValor_quilo(frete.getValor_quilo()*peso);
				result.use(Results.json()).withoutRoot().from(frete).exclude("codigo","quilo_de","quilo_ate","criacao","alteracao").serialize();
			}
		}
	}
}
