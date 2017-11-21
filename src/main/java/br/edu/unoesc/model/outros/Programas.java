package br.edu.unoesc.model.outros;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
		@NamedQuery(name="TODOS_PROGRAMAS", 
					query="select p from Programas p order by p.codigo"),
		@NamedQuery(name="PROGRAMA_POR_CODIGO",
					query="select p from Programas p where p.codigo = :codigo")
})
public class Programas implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String descricao;
	
	private String endereco;
	
	private Long grupo;
	
	private Boolean ativo;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;

	public Programas() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Long getGrupo() {
		return grupo;
	}

	public void setGrupo(Long grupo) {
		this.grupo = grupo;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public DateTime getCriacao() {
		return criacao;
	}

	public void setCriacao(DateTime criacao) {
		this.criacao = criacao;
	}

	public DateTime getAlteracao() {
		return alteracao;
	}

	public void setAlteracao(DateTime alteracao) {
		this.alteracao = alteracao;
	}

	@Override
	public String toString() {
		return "Programas [codigo=" + codigo + ", descricao=" + descricao + ", endereco=" + endereco + ", grupo="
				+ grupo + ", ativo=" + ativo + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
