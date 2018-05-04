package br.edu.unoesc.model.pessoa;

import javax.persistence.Column;
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
	@NamedQuery(name="TODOS_ESTADOS", 
				query="select e from Estado e order by e.codigo"),
	@NamedQuery(name="ESTADO_POR_CODIGO",
				query="select e from Estado e where e.codigo = :codigo"),
	@NamedQuery(name="ULTIMO_ESTADO_INCLUIDO",
				query="select max(e.codigo) from Estado e"),
	@NamedQuery(name="ESTADO_POR_DESCRICAO",
				query="select e from Estado e where lower(e.descricao) like :descricao order by e.descricao")
})
public class Estado implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String descricao;
	
	@Column(nullable=false)
	private String sigla;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Estado() {
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

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
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
		return "Estado [codigo=" + codigo + ", descricao=" + descricao + ", sigla=" + sigla + ", criacao=" + criacao
				+ ", alteracao=" + alteracao + "]";
	}
}
