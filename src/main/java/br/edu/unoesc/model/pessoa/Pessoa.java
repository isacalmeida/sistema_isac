package br.edu.unoesc.model.pessoa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
	@NamedQuery(name="TODAS_PESSOAS", 
				query="select p from Pessoa p order by p.codigo"),
	@NamedQuery(name="TODAS_PESSOAS_ATIVAS", 
				query="select p from Pessoa p where p.ativo = TRUE"),
	@NamedQuery(name="TODAS_PESSOAS_INATIVAS",
				query="select p from Pessoa p where p.ativo = FALSE"),
	@NamedQuery(name="PESSOA_POR_CODIGO",
				query="select p from Pessoa p where p.codigo = :codigo"),
	@NamedQuery(name="PESSOA_ENDERECO_CONTATO",
				query="SELECT p FROM Pessoa p "
						+ "JOIN p.endereco e JOIN p.contato c "
						+ "WHERE p.codigo = :codigo")
})
public class Pessoa implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	/* @Lob
	//@Column(columnDefinition="blob")
	@Basic(fetch = FetchType.EAGER) */
	private String imagem;
	
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
	
	private Character sexo;
	
	private Character estado_civil;
	
	private String data_fundacao;
	
	private Character finalidade;
	
	private Boolean cliente;
	
	private Boolean fornecedor;
	
	private Boolean ativo;
	
	@OneToMany(mappedBy="pessoa", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Endereco> endereco = new ArrayList<Endereco>();
	
	@OneToMany(mappedBy="pessoa", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Contato> contato = new ArrayList<Contato>();
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Pessoa() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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
	
	public Character getSexo() {
		return sexo;
	}

	public void setSexo(Character sexo) {
		this.sexo = sexo;
	}


	public Character getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(Character estado_civil) {
		this.estado_civil = estado_civil;
	}

	public String getData_fundacao() {
		return data_fundacao;
	}

	public void setData_fundacao(String data_fundacao) {
		this.data_fundacao = data_fundacao;
	}

	public Character getFinalidade() {
		return finalidade;
	}

	public void setFinalidade(Character finalidade) {
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
		return "Pessoa [codigo=" + codigo + ", tipo=" + tipo + ", cpf=" + cpf + ", cnpj=" + cnpj + ", nome=" + nome
				+ ", razao=" + razao + ", fantasia=" + fantasia + ", identidade=" + identidade + ", data_emissao="
				+ data_emissao + ", inscricao_estadual=" + inscricao_estadual + ", data_nascimento=" + data_nascimento
				+ ", sexo=" + sexo + ", estado_civil=" + estado_civil + ", data_fundacao=" + data_fundacao
				+ ", finalidade=" + finalidade + ", cliente=" + cliente + ", fornecedor=" + fornecedor + ", ativo="
				+ ativo + ", endereco=" + endereco + ", contato=" + contato + ", criacao=" + criacao + ", alteracao="
				+ alteracao + "]";
	}

}
