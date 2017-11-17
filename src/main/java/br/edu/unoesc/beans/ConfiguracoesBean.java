package br.edu.unoesc.beans;

import java.io.Serializable;
import java.util.Date;

import javax.enterprise.context.ApplicationScoped;

import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.usuario.Usuario;

@ApplicationScoped
public class ConfiguracoesBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Configuracoes confs;
	private Pessoa pess;
	private Usuario user;
	
	public ConfiguracoesBean(){
		super();
		this.setDefinicoes();
	}

	void setDefinicoes() {
		Configuracoes confs = new Configuracoes();
		confs.setCodigo(1L);
		confs.setCriacao(new Date());
		confs.setAlteracao(new Date());
		confs.setAtivo(true);
		confs.setTabela_linhas(10);
		
		Pessoa pess = new Pessoa();
		pess.setCodigo(1L);
		pess.setTipo('F');
		pess.setCpf("031.094.190-33");
		pess.setNome("Administrador");
		pess.setCliente(true);
		pess.setFornecedor(false);
		pess.setAtivo(true);
		pess.setFinalidade('C');
		pess.setCriacao(new Date());
		pess.setAlteracao(new Date());
		
		Usuario user = new Usuario();
		user.setCodigo(1L);
		user.setUsuario("admin");
		user.setSenha("admin");
		user.setCriacao(new Date());
		user.setAlteracao(new Date());
		user.setPessoa(pess);
		user.setAtivo(true);

		this.setConfs(confs);
		this.setPess(pess);
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

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}
	
}
