package br.edu.unoesc.model.pessoa;

import java.util.Date;

import javax.persistence.Column;
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
	@NamedQuery(name="TODAS_PESSOAS", 
				query="select p from Pessoa p order by p.codigo"),
	@NamedQuery(name="TODAS_PESSOAS_ATIVAS", 
				query="select p from Pessoa p where p.ativo = TRUE"),
	@NamedQuery(name="TODAS_PESSOAS_INATIVAS",
				query="select p from Pessoa p where p.ativo = FALSE")
})
public class Pessoa implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private Character tipo;
	
	@Column(nullable=false)
	private String cpf_cnpj;
	
	@Column(nullable=false)
	private String nome_razao;
	
	private String fantasia;
	
	private Boolean cliente;
	
	private Boolean fornecedor;
	
	private Boolean ativo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
	public Pessoa() {
		super();
	}
	
	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Character getTipo() {
		return tipo;
	}

	public void setTipo(Character tipo) {
		this.tipo = tipo;
	}

	public String getCpf_cnpj() {
		return cpf_cnpj;
	}

	public void setCpf_cnpj(String cpf_cnpj) {
		this.cpf_cnpj = cpf_cnpj;
	}

	public String getNome_razao() {
		return nome_razao;
	}

	public void setNome_razao(String nome_razao) {
		this.nome_razao = nome_razao;
	}

	public String getFantasia() {
		return fantasia;
	}

	public void setFantasia(String fantasia) {
		this.fantasia = fantasia;
	}

	public Boolean getCliente() {
		return cliente;
	}

	public void setCliente(Boolean cliente) {
		this.cliente = cliente;
	}

	public Boolean getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Boolean fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Date getAlteracao() {
		return alteracao;
	}

	public void setAlteracao(Date alteracao) {
		this.alteracao = alteracao;
	}

	public Date getCriacao() {
		return criacao;
	}

	public void setCriacao(Date criacao) {
		this.criacao = criacao;
	}

	@Override
	public String toString() {
		return "Pessoa [codigo=" + codigo + ", tipo=" + tipo + ", cpf_cnpj=" + cpf_cnpj + ", nome_razao=" + nome_razao
				+ ", fantasia=" + fantasia + ", cliente=" + cliente + ", fornecedor=" + fornecedor + ", ativo=" + ativo
				+ ", alteracao=" + alteracao + ", criacao=" + criacao + "]";
	}
}
