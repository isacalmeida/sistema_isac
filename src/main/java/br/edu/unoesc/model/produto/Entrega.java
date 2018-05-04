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

@Entity
@NamedQueries({
	@NamedQuery(name="TODAS_ENTREGAS", 
				query="select e from Entrega e order by e.codigo"),
	@NamedQuery(name="ENTREGA_POR_CODIGO",
				query="select e from Entrega e where e.codigo = :codigo"),
	@NamedQuery(name="ULTIMA_ENTREGA_INCLUIDA",
				query="select max(e.codigo) from Entrega e")
})
public class Entrega implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@OneToOne(targetEntity = Frete.class)
	@JoinColumn(name="codigo_frete", foreignKey=@ForeignKey(name="FK_entrega_frete"))
	private Frete frete;
	
	@Column(nullable=false)
	private Long codigo_pedido;	
	
	@Column(nullable=false)
	private Double peso;
	
	@Column(nullable=false)
	private Double custo;
	
	@Column(nullable=false)
	private Long status;
	
	@Column(nullable=false)
	private String observacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Entrega() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Frete getFrete() {
		return frete;
	}

	public void setFrete(Frete frete) {
		this.frete = frete;
	}

	public Long getCodigo_pedido() {
		return codigo_pedido;
	}

	public void setCodigo_pedido(Long codigo_pedido) {
		this.codigo_pedido = codigo_pedido;
	}

	public Double getPeso() {
		return peso;
	}

	public void setPeso(Double peso) {
		this.peso = peso;
	}

	public Double getCusto() {
		return custo;
	}

	public void setCusto(Double custo) {
		this.custo = custo;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
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
		return "Entrega [codigo=" + codigo + ", frete=" + frete + ", codigo_pedido=" + codigo_pedido + ", peso=" + peso
				+ ", custo=" + custo + ", status=" + status + ", observacao=" + observacao + ", criacao=" + criacao
				+ ", alteracao=" + alteracao + "]";
	}	
}
