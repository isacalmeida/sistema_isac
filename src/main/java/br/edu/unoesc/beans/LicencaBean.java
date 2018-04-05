package br.edu.unoesc.beans;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;

import br.edu.unoesc.model.outros.Licenca;

@SessionScoped
public class LicencaBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Licenca licenca;
	
	public Licenca getLicenca() {
		return licenca;
	}
	
	public void setLicenca(Licenca licenca) {
		this.licenca = licenca;
	}

}
