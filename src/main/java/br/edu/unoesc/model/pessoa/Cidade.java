package br.edu.unoesc.model.pessoa;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
	@NamedQuery(name="TODAS_CIDADES", 
				query="select c from Cidade c order by c.codigo"),
	@NamedQuery(name="CIDADE_POR_CODIGO",
				query="select c from Cidade c where c.codigo = :codigo"),
	@NamedQuery(name="ULTIMA_CIDADE_INCLUIDA",
				query="select max(c.codigo) from Cidade c")
})
public class Cidade implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String descricao;
	
	@OneToOne(targetEntity = Estado.class)
	@JoinColumn(name="codigo_estado", foreignKey=@ForeignKey(name="FK_cidade_estado"))
	private Estado estado;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Cidade() {
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

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
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
		return "Cidade [codigo=" + codigo + ", descricao=" + descricao + ", estado=" + estado + ", criacao=" + criacao
				+ ", alteracao=" + alteracao + "]";
	}
}
