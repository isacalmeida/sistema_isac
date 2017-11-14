package br.edu.unoesc.model.outros;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries(
		@NamedQuery(name="TODOS_PROGRAMAS", 
					query="select p from Programas p order by p.codigo"))
public class Programas implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String descricao;
	
	@Column(nullable=false)
	private String endereco;
	
	private Boolean ativo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;

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

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Date getCriacao() {
		return criacao;
	}

	public void setCriacao(Date criacao) {
		this.criacao = criacao;
	}

	public Date getAlteracao() {
		return alteracao;
	}

	public void setAlteracao(Date alteracao) {
		this.alteracao = alteracao;
	}

	@Override
	public String toString() {
		return "Programas [codigo=" + codigo + ", descricao=" + descricao + ", endereco=" + endereco + ", ativo="
				+ ativo + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
