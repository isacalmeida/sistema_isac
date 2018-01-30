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
@NamedQueries(
	@NamedQuery(name="TODOS_ENDERECOS", 
				query="select e from Endereco e order by e.codigo"))
public class Endereco implements MinhaEntidade{

	@Id
	private Long codigo;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name="codigo_pessoa", foreignKey=@ForeignKey(name="FK_endereco_pessoa"))
	private Pessoa pessoa;
	
	private Character tipo_endereco;
	
	private Character tipo_moradia;
	
	private String cep;
	
	private String cidade;
	
	private String bairro;
	
	private String uf;
	
	private String logradouro;
	
	private String numero;
	
	private String complemento;
	
	private boolean principal;
	
	public Endereco() {
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

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
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

	@Override
	public String toString() {
		return "Endereco [codigo=" + codigo + ", tipo_endereco=" + tipo_endereco + ", tipo_moradia=" + tipo_moradia
				+ ", cep=" + cep + ", cidade=" + cidade + ", bairro=" + bairro + ", uf=" + uf + ", logradouro="
				+ logradouro + ", numero=" + numero + ", complemento=" + complemento + ", principal=" + principal + "]";
	}
}
