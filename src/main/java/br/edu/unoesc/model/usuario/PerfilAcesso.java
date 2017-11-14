package br.edu.unoesc.model.usuario;

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
	@NamedQuery(name="TODOS_PERFIS", 
				query="select u from Usuario u order by u.codigo")
})
public class PerfilAcesso implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String descricao;
	
	@Column(nullable=false)
	private Character pessoa;
	
	@Column(nullable=false)
	private Character usuario;
	
	@Column(nullable=false)
	private Character perfis;
	
	@Column(nullable=false)
	private Character produto;
	
	@Column(nullable=false)
	private Character departamento;
	
	@Column(nullable=false)
	private Character cor;
	
	@Column(nullable=false)
	private Character configuracoes;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
	public PerfilAcesso() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Character getPessoa() {
		return pessoa;
	}

	public void setPessoa(Character pessoa) {
		this.pessoa = pessoa;
	}

	public Character getUsuario() {
		return usuario;
	}

	public void setUsuario(Character usuario) {
		this.usuario = usuario;
	}

	public Character getPerfis() {
		return perfis;
	}

	public void setPerfis(Character perfis) {
		this.perfis = perfis;
	}

	public Character getProduto() {
		return produto;
	}

	public void setProduto(Character produto) {
		this.produto = produto;
	}

	public Character getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Character departamento) {
		this.departamento = departamento;
	}

	public Character getCor() {
		return cor;
	}

	public void setCor(Character cor) {
		this.cor = cor;
	}

	public Character getConfiguracoes() {
		return configuracoes;
	}

	public void setConfiguracoes(Character configuracoes) {
		this.configuracoes = configuracoes;
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
		return "PerfilAcesso [codigo=" + codigo + ", descricao=" + descricao + ", pessoa=" + pessoa + ", usuario="
				+ usuario + ", perfis=" + perfis + ", produto=" + produto + ", departamento=" + departamento + ", cor="
				+ cor + ", configuracoes=" + configuracoes + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
