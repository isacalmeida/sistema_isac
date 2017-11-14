package br.edu.unoesc.model.outros;

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
@NamedQueries(
		@NamedQuery(name="TODAS_CONFIGURACOES", 
					query="select c from Configuracoes c order by c.codigo"))
public class Configuracoes implements MinhaEntidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private Integer tabela_linhas;
	
	private boolean ativo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;

	public Configuracoes() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Integer getTabela_linhas() {
		return tabela_linhas;
	}

	public void setTabela_linhas(Integer tabela_linhas) {
		this.tabela_linhas = tabela_linhas;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
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
		return "Configuracoes [codigo=" + codigo + ", tabela_linhas=" + tabela_linhas + ", ativo=" + ativo
				+ ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
