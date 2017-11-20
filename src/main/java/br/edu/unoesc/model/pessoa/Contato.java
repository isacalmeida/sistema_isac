package br.edu.unoesc.model.pessoa;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_CONTATOS", 
			query="select c from Contato c order by c.codigo")
})
public class Contato implements MinhaEntidade{
	
	@Id
	private Long codigo;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name="codigo_pessoa", foreignKey=@ForeignKey(name="FK_contato_pessoa"))
	private Pessoa pessoa;
	
	private Character tipo_contato;
	
	private String valor_contato;
	
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

	@Override
	public String toString() {
		return "Contato [codigo=" + codigo + ", tipo_contato=" + tipo_contato + ", valor_contato=" + valor_contato
				+ "]";
	}
	
}
