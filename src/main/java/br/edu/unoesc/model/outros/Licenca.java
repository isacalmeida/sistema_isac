package br.edu.unoesc.model.outros;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
	@NamedQuery(name="TODAS_LICENCAS", 
				query="select l from Licenca l order by l.codigo"),
	@NamedQuery(name="LICENCA_POR_CODIGO",
				query="select l from Licenca l where l.codigo = :codigo")
})
public class Licenca implements MinhaEntidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String versao;
	
	private String licenciamento;
	
	public Licenca() {
		super();
	}
	
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	
	public String getVersao() {
		return versao;
	}
	public void setVersao(String versao) {
		this.versao = versao;
	}
	public String getLicenciamento() {
		return licenciamento;
	}
	public void setLicenciamento(String licenciamento) {
		this.licenciamento = licenciamento;
	}
}
