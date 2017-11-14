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
@NamedQueries(
	@NamedQuery(name="TODOS_ENDERECOS", 
				query="select e from Endereco e order by e.codigo"))
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "cod_pessoa", name = "FK_endereco_pessoa"))
public class Endereco implements MinhaEntidade{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@ManyToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa pessoa;
	
	@Column(nullable=false)
	private Character tipo;
	
	@Column(nullable=false)
	private String cep;
	
	@Column(nullable=false)
	private String cidade;
	
	@Column(nullable=false)
	private String bairro;
	
	@Column(nullable=false)
	private String rua;
	
	@Column(nullable=false)
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

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
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
		return "Endereco [codigo=" + codigo + ", pessoa=" + pessoa + ", tipo=" + tipo + ", cep=" + cep + ", cidade="
				+ cidade + ", bairro=" + bairro + ", rua=" + rua + ", numero=" + numero + ", complemento=" + complemento
				+ ", principal=" + principal + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
