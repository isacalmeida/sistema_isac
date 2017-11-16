package br.edu.unoesc.model.pessoa;

import java.util.Date;

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
@NamedQueries({
	@NamedQuery(name="TODOS_CONTATOS", 
			query="select c from Contato c order by c.codigo")
})
//@Table(uniqueConstraints = @UniqueConstraint(columnNames = "cod_pessoa", name = "FK_contato_pessoa"))
public class Contato implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	/*@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa pessoa;*/
	
	private Character tipo_contato;
	
	private String valor_contato;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
	public Contato() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Character getTipo_contato() {
		return tipo_contato;
	}

	public void setTipo_contato(Character tipo_contato) {
		this.tipo_contato = tipo_contato;
	}

	public String getValor_contato() {
		return valor_contato;
	}

	public void setValor_contato(String valor_contato) {
		this.valor_contato = valor_contato;
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
		return "Contato [codigo=" + codigo + ", tipo_contato=" + tipo_contato
				+ ", valor_contato=" + valor_contato + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
