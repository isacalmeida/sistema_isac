package br.edu.unoesc.beans;

import java.io.Serializable;

import javax.enterprise.context.ApplicationScoped;

import org.joda.time.DateTime;

import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.pessoa.Pessoa;
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
		pess.setImagem("/imagem/pessoa/avatarpadrao.png");
		pess.setCriacao(new DateTime());
		pess.setAlteracao(new DateTime());
		
		PerfilAcesso perfil = new PerfilAcesso();
		perfil.setCodigo(1L);
		perfil.setDescricao("Administrador");
		perfil.setCriacao(new DateTime());
		perfil.setAlteracao(new DateTime());
		
		Usuario user = new Usuario();
		user.setCodigo(1L);
		user.setUsuario("admin");
		user.setSenha("admin");
		user.setCriacao(new DateTime());
		user.setAlteracao(new DateTime());
		user.setPerfil(perfil);
		user.setPessoa(pess);
		user.setAtivo(true);

		this.setConfs(confs);
		this.setPess(pess);
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
	
}
