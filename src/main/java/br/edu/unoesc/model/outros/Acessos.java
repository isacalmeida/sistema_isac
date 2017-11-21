package br.edu.unoesc.model.outros;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries(
		@NamedQuery(name="TODOS_ACESSOS", 
					query="select a from Acessos a order by a.codigo"))
public class Acessos implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@OneToOne(targetEntity = Programas.class, optional=false)
	@JoinColumn(name="codigo_programa", foreignKey=@ForeignKey(name="FK_acessos_programas"))
	private Programas programa;
	
	private Boolean visualizar;
	
	private Boolean incluir;
	
	private Boolean alterar;
	
	private Boolean remover;

	public Acessos() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Programas getPrograma() {
		return programa;
	}

	public void setPrograma(Programas programa) {
		this.programa = programa;
	}

	public Boolean getVisualizar() {
		return visualizar;
	}

	public void setVisualizar(Boolean visualizar) {
		this.visualizar = visualizar;
	}

	public Boolean getIncluir() {
		return incluir;
	}

	public void setIncluir(Boolean incluir) {
		this.incluir = incluir;
	}

	public Boolean getAlterar() {
		return alterar;
	}

	public void setAlterar(Boolean alterar) {
		this.alterar = alterar;
	}

	public Boolean getRemover() {
		return remover;
	}

	public void setRemover(Boolean remover) {
		this.remover = remover;
	}

	@Override
	public String toString() {
		return "Acessos [codigo=" + codigo + ", programa=" + programa + ", visualizar=" + visualizar + ", incluir="
				+ incluir + ", alterar=" + alterar + ", remover=" + remover + "]";
	}
	
}
