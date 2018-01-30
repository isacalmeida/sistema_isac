package br.edu.unoesc.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.joda.time.DateTime;

import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.outros.Programas;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.usuario.Acessos;
import br.edu.unoesc.model.usuario.PerfilAcesso;
import br.edu.unoesc.model.usuario.Usuario;

@ApplicationScoped
public class ConfiguracoesBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Configuracoes confs;
	private Pessoa pess;
	private PerfilAcesso perfil;
	private Usuario user;
	private List<Programas> programas;
	private List<Acessos> acessos;
	
	public ConfiguracoesBean(){
		super();
		this.setDefinicoes();
	}

	void setDefinicoes() {
		Configuracoes confs = new Configuracoes();
		confs.setCodigo(1L);
		confs.setCriacao(new DateTime());
		confs.setAlteracao(new DateTime());
		confs.setAtivo(true);
		confs.setTabela_linhas(10);
		confs.setContador_endereco(1L);
		confs.setContador_contato(1L);
		
		Pessoa pess = new Pessoa();
		pess.setCodigo(1L);
		pess.setTipo('F');
		pess.setCpf("031.094.190-33");
		pess.setNome("Administrador");
		pess.setCliente(true);
		pess.setFornecedor(false);
		pess.setAtivo(true);
		pess.setFinalidade('C');
		pess.setImagem("/imagem/pessoa/avatar_default-160x160.png");
		pess.setCriacao(new DateTime());
		pess.setAlteracao(new DateTime());
		
		List<Programas> programas = new ArrayList<Programas>();
		
		Programas prog1 = new Programas();
		prog1.setDescricao("Pessoa");
		prog1.setEndereco("/pessoa");
		prog1.setGrupo(2L);
		prog1.setCriacao(new DateTime());
		prog1.setAlteracao(new DateTime());
		prog1.setAtivo(true);
		programas.add(prog1);
		
		Programas prog2 = new Programas();
		prog2.setDescricao("Produto");
		prog2.setEndereco("/produto");
		prog2.setGrupo(3L);
		prog2.setCriacao(new DateTime());
		prog2.setAlteracao(new DateTime());
		prog2.setAtivo(true);
		programas.add(prog2);
		
		Programas prog3 = new Programas();
		prog3.setDescricao("Usuario");
		prog3.setEndereco("/usuario");
		prog3.setGrupo(2L);
		prog3.setCriacao(new DateTime());
		prog3.setAlteracao(new DateTime());
		prog3.setAtivo(true);
		programas.add(prog3);
		
		Programas prog4 = new Programas();
		prog4.setDescricao("Perfil de Acesso");
		prog4.setEndereco("/perfil_acesso");
		prog4.setGrupo(2L);
		prog4.setCriacao(new DateTime());
		prog4.setAlteracao(new DateTime());
		prog4.setAtivo(true);
		programas.add(prog4);
		
		Programas prog5 = new Programas();
		prog5.setDescricao("Cor");
		prog5.setEndereco("/cor");
		prog5.setGrupo(3L);
		prog5.setCriacao(new DateTime());
		prog5.setAlteracao(new DateTime());
		prog5.setAtivo(true);
		programas.add(prog5);
		
		Programas prog6 = new Programas();
		prog6.setDescricao("Departamento");
		prog6.setEndereco("/departamento");
		prog6.setGrupo(3L);
		prog6.setCriacao(new DateTime());
		prog6.setAlteracao(new DateTime());
		prog6.setAtivo(true);
		programas.add(prog6);

		Programas prog7 = new Programas();
		prog7.setDescricao("Geral");
		prog7.setEndereco("/configuracoes");
		prog7.setGrupo(1L);
		prog7.setCriacao(new DateTime());
		prog7.setAlteracao(new DateTime());
		prog7.setAtivo(true);
		programas.add(prog7);

		Programas prog8 = new Programas();
		prog8.setDescricao("Programas");
		prog8.setEndereco("/programas");
		prog8.setGrupo(1L);
		prog8.setCriacao(new DateTime());
		prog8.setAlteracao(new DateTime());
		prog8.setAtivo(true);
		programas.add(prog8);

		Programas prog9 = new Programas();
		prog9.setDescricao("Acessos");
		prog9.setEndereco("/acessos");
		prog9.setGrupo(1L);
		prog9.setCriacao(new DateTime());
		prog9.setAlteracao(new DateTime());
		prog9.setAtivo(true);
		programas.add(prog9);
		
		PerfilAcesso perfil = new PerfilAcesso();
		perfil.setCodigo(1L);
		perfil.setDescricao("Administrador");
		perfil.setCriacao(new DateTime());
		perfil.setAlteracao(new DateTime());
		
		List<Acessos> acessos = new ArrayList<Acessos>();
		
		Acessos acesso1 = new Acessos();
		acesso1.setPrograma(prog1);
		acesso1.setVisualizar(true);
		acesso1.setIncluir(true);
		acesso1.setAlterar(true);
		acesso1.setRemover(true);
		acesso1.setPerfilacesso(perfil);
		acessos.add(acesso1);
		
		Acessos acesso2 = new Acessos();
		acesso2.setPrograma(prog2);
		acesso2.setVisualizar(true);
		acesso2.setIncluir(true);
		acesso2.setAlterar(true);
		acesso2.setRemover(true);
		acesso2.setPerfilacesso(perfil);
		acessos.add(acesso2);
		
		Acessos acesso3 = new Acessos();
		acesso3.setPrograma(prog3);
		acesso3.setVisualizar(true);
		acesso3.setIncluir(true);
		acesso3.setAlterar(true);
		acesso3.setRemover(true);
		acesso3.setPerfilacesso(perfil);
		acessos.add(acesso3);
		
		Acessos acesso4 = new Acessos();
		acesso4.setPrograma(prog4);
		acesso4.setVisualizar(true);
		acesso4.setIncluir(true);
		acesso4.setAlterar(true);
		acesso4.setRemover(true);
		acesso4.setPerfilacesso(perfil);
		acessos.add(acesso4);
		
		Acessos acesso5 = new Acessos();
		acesso5.setPrograma(prog5);
		acesso5.setVisualizar(true);
		acesso5.setIncluir(true);
		acesso5.setAlterar(true);
		acesso5.setRemover(true);
		acesso5.setPerfilacesso(perfil);
		acessos.add(acesso5);
		
		Acessos acesso6 = new Acessos();
		acesso6.setPrograma(prog6);
		acesso6.setVisualizar(true);
		acesso6.setIncluir(true);
		acesso6.setAlterar(true);
		acesso6.setRemover(true);
		acesso6.setPerfilacesso(perfil);
		acessos.add(acesso6);
		
		Acessos acesso7 = new Acessos();
		acesso7.setPrograma(prog7);
		acesso7.setVisualizar(true);
		acesso7.setIncluir(true);
		acesso7.setAlterar(true);
		acesso7.setRemover(true);
		acesso7.setPerfilacesso(perfil);
		acessos.add(acesso7);
		
		Acessos acesso8 = new Acessos();
		acesso8.setPrograma(prog8);
		acesso8.setVisualizar(true);
		acesso8.setIncluir(true);
		acesso8.setAlterar(true);
		acesso8.setRemover(true);
		acesso8.setPerfilacesso(perfil);
		acessos.add(acesso8);
		
		Acessos acesso9 = new Acessos();
		acesso9.setPrograma(prog9);
		acesso9.setVisualizar(true);
		acesso9.setIncluir(true);
		acesso9.setAlterar(true);
		acesso9.setRemover(true);
		acesso9.setPerfilacesso(perfil);
		acessos.add(acesso9);
		
		perfil.setAcessos(acessos);
		
		
		Usuario user = new Usuario();
		user.setCodigo(1L);
		user.setUsuario("admin");
		user.setSenha("admin");
		user.setCriacao(new DateTime());
		user.setAlteracao(new DateTime());
		user.setPerfil(perfil);
		user.setPessoa(pess);
		user.setFoto(pess.getImagem());
		user.setColaborador("01/01/2018");
		user.setAtivo(true);

		this.setConfs(confs);
		this.setPess(pess);
		this.setProgramas(programas);
		this.setAcessos(acessos);
		this.setPerfil(perfil);
		this.setUser(user);
	}

	public Configuracoes getConfs() {
		return confs;
	}

	public void setConfs(Configuracoes confs) {
		this.confs = confs;
	}

	public Pessoa getPess() {
		return pess;
	}

	public void setPess(Pessoa pess) {
		this.pess = pess;
	}
	
	public PerfilAcesso getPerfil() {
		return perfil;
	}
	
	public void setPerfil(PerfilAcesso perfil) {
		this.perfil = perfil;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public List<Programas> getProgramas() {
		return programas;
	}

	public void setProgramas(List<Programas> programas) {
		this.programas = programas;
	}

	public List<Acessos> getAcessos() {
		return acessos;
	}

	public void setAcessos(List<Acessos> acessos) {
		this.acessos = acessos;
	}
}
