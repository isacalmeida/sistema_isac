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
@NamedQueries(
	@NamedQuery(name="TODOS_ENDERECOS", 
				query="select e from Endereco e order by e.codigo"))
public class Endereco implements MinhaEntidade{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	/*@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa pessoa;*/
	
	private Character tipo_endereco;
	
	private Character tipo_moradia;
	
	private String cep;
	
	private String cidade;
	
	private String bairro;
	
	private String logradouro;
	
	private String numero;
	
	private String complemento;
	
	private Boolean principal;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
	public Endereco() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Character getTipo_endereco() {
		return tipo_endereco;
	}

	public void setTipo_endereco(Character tipo_endereco) {
		this.tipo_endereco = tipo_endereco;
	}
	
	public Character getTipo_moradia() {
		return tipo_moradia;
	}

	public void setTipo_moradia(Character tipo_moradia) {
		this.tipo_moradia = tipo_moradia;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public Boolean getPrincipal() {
		return principal;
	}

	public void setPrincipal(Boolean principal) {
		this.principal = principal;
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
		return "Endereco [codigo=" + codigo + ", tipo_endereco=" + tipo_endereco
				+ ", tipo_moradia=" + tipo_moradia + ", cep=" + cep + ", cidade=" + cidade + ", bairro=" + bairro
				+ ", logradouro=" + logradouro + ", numero=" + numero + ", complemento=" + complemento + ", principal="
				+ principal + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
