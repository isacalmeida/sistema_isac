package br.edu.unoesc.beans;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;

import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.model.usuario.Acessos;
import br.edu.unoesc.model.usuario.PerfilAcesso;
import br.edu.unoesc.model.usuario.Usuario;

@SessionScoped
public class UsuarioBean implements Serializable {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Inject
	private UsuarioDAO udao;
	
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
	
	public void setPermissao(PerfilAcesso perfil) {
		this.logado.setPerfil(perfil);
	}
	
	public Boolean getPermissao(String programa, Integer permissao) {
		List<Usuario> user = udao.buscar(Usuario.class, logado.getCodigo(), "USUARIO_POR_CODIGO");
		this.logado = user.get(0);
		
		Boolean permitido = false;
		List<Acessos> acuser = this.logado.getPerfil().getAcessos();
		for(Acessos acess : acuser) {
			if(acess.getPrograma().getDescricao().equals(programa)) {
				if(permissao == 1 && acess.getVisualizar() == true)
					permitido = acess.getVisualizar();
				if(permissao == 2 && acess.getIncluir() == true)
					permitido = acess.getIncluir();
				if(permissao == 3 && acess.getAlterar() == true)
					permitido = acess.getAlterar();
				if(permissao == 4 && acess.getRemover() == true)
					permitido = acess.getRemover();
				if(permitido == true) break;
			}
		}
		return permitido;
	}
}
