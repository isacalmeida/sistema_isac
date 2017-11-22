package br.edu.unoesc.beans;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;

import br.edu.unoesc.model.usuario.Usuario;

@SessionScoped
public class UsuarioBean implements Serializable {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Usuario logado;
	
	public void login(Usuario usuario) {
		this.logado = usuario;
	}
	
	public Usuario getUsuario() {
		return this.logado;
	}
	
	public String getNome() {
		if(logado == null) {
			return null;
		}
		else {
			return logado.getPessoa().getNome();
		}
	}
	
	public boolean isLogado() {
		return logado != null;
	}
	
	public void logout() {
		this.logado = null;
	}
}
