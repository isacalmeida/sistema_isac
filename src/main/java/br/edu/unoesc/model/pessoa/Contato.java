package br.edu.unoesc.model.pessoa;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_CONTATOS", 
			query="select c from Contato c order by c.codigo")
})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "cod_pessoa", name = "FK_contato_pessoa"))
public class Contato implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa pessoa;
	
	@Column(nullable=false)
	private Character tipo;
	
	@Column(nullable=false)
	private String contato;
	
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

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Character getTipo() {
		return tipo;
	}

	public void setTipo(Character tipo) {
		this.tipo = tipo;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
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
		return "Contato [codigo=" + codigo + ", pessoa=" + pessoa + ", tipo=" + tipo + ", contato=" + contato
				+ ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
