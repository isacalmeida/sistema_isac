package br.edu.unoesc.model.produto;

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
import br.edu.unoesc.model.pessoa.Estado;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_FRETES", 
				query="select f from Frete f order by f.codigo"),
	@NamedQuery(name="FRETE_POR_CODIGO",
				query="select f from Frete f where f.codigo = :codigo"),
	@NamedQuery(name="ULTIMO_FRETE_INCLUIDO",
				query="select max(f.codigo) from Frete f")
})
public class Frete implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@OneToOne(targetEntity = Estado.class)
	@JoinColumn(name="codigo_uf_origem", foreignKey=@ForeignKey(name="FK_frete_uf_origem"))
	private Estado uf_origem;
	
	@OneToOne(targetEntity = Estado.class)
	@JoinColumn(name="codigo_uf_destino", foreignKey=@ForeignKey(name="FK_frete_uf_destino"))
	private Estado uf_destino;
	
	@Column(nullable=false)
	private Double valor_quilo;
	
	@Column(nullable=false)
	private Double quilo_de;
	
	@Column(nullable=false)
	private Double quilo_ate;
	
	@Column(nullable=false)
	private Long previsao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Frete() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Estado getUf_origem() {
		return uf_origem;
	}

	public void setUf_origem(Estado uf_origem) {
		this.uf_origem = uf_origem;
	}

	public Estado getUf_destino() {
		return uf_destino;
	}

	public void setUf_destino(Estado uf_destino) {
		this.uf_destino = uf_destino;
	}

	public Double getValor_quilo() {
		return valor_quilo;
	}

	public void setValor_quilo(Double valor_quilo) {
		this.valor_quilo = valor_quilo;
	}

	public Double getQuilo_de() {
		return quilo_de;
	}

	public void setQuilo_de(Double quilo_de) {
		this.quilo_de = quilo_de;
	}

	public Double getQuilo_ate() {
		return quilo_ate;
	}

	public void setQuilo_ate(Double quilo_ate) {
		this.quilo_ate = quilo_ate;
	}
	
	public Long getPrevisao() {
		return previsao;
	}
	
	public void setPrevisao(Long previsao) {
		this.previsao = previsao;
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
		return "Frete [codigo=" + codigo + ", uf_origem=" + uf_origem + ", uf_destino=" + uf_destino + ", valor_quilo="
				+ valor_quilo + ", quilo_de=" + quilo_de + ", quilo_ate=" + quilo_ate + ", criacao=" + criacao
				+ ", alteracao=" + alteracao + "]";
	}
}
