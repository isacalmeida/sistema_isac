package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.serialization.gson.WithoutRoot;
import br.com.caelum.vraptor.view.Results;
import br.edu.unoesc.beans.LicencaBean;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.dao.ProgramasDAO;
import br.edu.unoesc.model.outros.Programas;

@Path("/busca")
@Controller
public class BuscaController {
	
	@Inject
	private Result result;
	
	@Inject
	private ProgramasDAO podao;
	
	@Inject
	private LicencaBean licencaSessao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(String q){
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
			
			if(q != null) {
				List<Programas> programas = podao.buscar(Programas.class, q, "PROGRAMA_POR_DESCRICAO");
				result.include("programas", programas);
				System.out.println(programas);
				result.include("resultado", q);
			}
			else {
				result.include("programas", null);
				result.include("resultado", q);
			}
			
		}
	}
	
	@Consumes(value="application/json", options=WithoutRoot.class)
	@Get("/buscar")
	public void buscar(String desc) {
		List<Programas> programas = podao.buscar(Programas.class, desc, "PROGRAMA_POR_DESCRICAO");
		System.out.println("TESTANDO /BUSCAR: "+ desc);
		System.out.println("RESULTADO: "+ programas);
		result.use(Results.json()).withoutRoot().from(programas).exclude("codigo","grupo","ativo","criacao","alteracao").serialize();
		//return programas;
	}
}
