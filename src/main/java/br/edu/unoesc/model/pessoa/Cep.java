package br.edu.unoesc.model.pessoa;

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
	@NamedQuery(name="TODOS_CEPS", 
				query="select c from Cep c order by c.codigo"),
	@NamedQuery(name="CEP_POR_CODIGO",
				query="select c from Cep c where c.codigo = :codigo"),
	@NamedQuery(name="ULTIMO_CEP_INCLUIDO",
				query="select max(c.codigo) from Cep c")
})
public class Cep implements MinhaEntidade{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String logradouro;
	
	private String bairro;
	
	@OneToOne(targetEntity = Cidade.class)
	@JoinColumn(name="codigo_cidade", foreignKey=@ForeignKey(name="FK_cep_cidade"))
	private Cidade cidade;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Cep() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
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
		return "Cep [codigo=" + codigo + ", logradouro=" + logradouro + ", bairro=" + bairro + ", cidade=" + cidade
				+ ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
