package br.edu.unoesc.model.pessoa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
	
	private Character tipo;
	
	private String cpf;
	
	private String cnpj;
	
	private String nome;

	private String razao;
	
	private String fantasia;
	
	private String identidade;
	
	private String data_emissao;
	
	private String inscricao_estadual;
	
	private String data_nascimento;
	
	private String estado_civil;
	
	private String data_fundacao;
	
	private String finalidade;
	
	private Boolean cliente;
	
	private Boolean fornecedor;
	
	private Boolean ativo;
	
	@OneToMany(targetEntity = Endereco.class)
	private List<Endereco> endereco = new ArrayList<Endereco>();
	
	@OneToMany(targetEntity = Contato.class)
	private List<Contato> contato = new ArrayList<Contato>();
	
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

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRazao() {
		return razao;
	}

	public void setRazao(String razao) {
		this.razao = razao;
	}

	public String getFantasia() {
		return fantasia;
	}

	public void setFantasia(String fantasia) {
		this.fantasia = fantasia;
	}

	public String getIdentidade() {
		return identidade;
	}

	public void setIdentidade(String identidade) {
		this.identidade = identidade;
	}

	public String getData_emissao() {
		return data_emissao;
	}

	public void setData_emissao(String data_emissao) {
		this.data_emissao = data_emissao;
	}

	public String getInscricao_estadual() {
		return inscricao_estadual;
	}

	public void setInscricao_estadual(String inscricao_estadual) {
		this.inscricao_estadual = inscricao_estadual;
	}

	public String getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	public String getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(String estado_civil) {
		this.estado_civil = estado_civil;
	}

	public String getData_fundacao() {
		return data_fundacao;
	}

	public void setData_fundacao(String data_fundacao) {
		this.data_fundacao = data_fundacao;
	}

	public String getFinalidade() {
		return finalidade;
	}

	public void setFinalidade(String finalidade) {
		this.finalidade = finalidade;
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

	public List<Endereco> getEndereco() {
		return endereco;
	}

	public void setEndereco(List<Endereco> endereco) {
		this.endereco = endereco;
	}

	public List<Contato> getContato() {
		return contato;
	}

	public void setContato(List<Contato> contato) {
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
		return "Pessoa [codigo=" + codigo + ", tipo=" + tipo + ", cpf=" + cpf + ", cnpj=" + cnpj + ", nome=" + nome
				+ ", razao=" + razao + ", fantasia=" + fantasia + ", identidade=" + identidade + ", data_emissao="
				+ data_emissao + ", inscricao_estadual=" + inscricao_estadual + ", data_nascimento=" + data_nascimento
				+ ", estado_civil=" + estado_civil + ", data_fundacao=" + data_fundacao + ", finalidade=" + finalidade
				+ ", cliente=" + cliente + ", fornecedor=" + fornecedor + ", ativo=" + ativo + ", endereco=" + endereco
				+ ", contato=" + contato + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
