package br.edu.unoesc.model.outros;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;

@Entity
@NamedQueries({
		@NamedQuery(name="TODAS_CONFIGURACOES", 
					query="select c from Configuracoes c order by c.codigo"),
		@NamedQuery(name="CONFIGURACOES_POR_CODIGO",
					query="select c from Configuracoes c where c.codigo = :codigo")
})
public class Configuracoes implements MinhaEntidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private Integer tabela_linhas;
	
	private Long contador_endereco;
	
	private Long contador_contato;
	
	private boolean ativo;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;

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

	public Long getContador_endereco() {
		return contador_endereco;
	}

	public void setContador_endereco(Long contador_endereco) {
		this.contador_endereco = contador_endereco;
	}
	
	public Long getContador_contato() {
		return contador_contato;
	}

	public void setContador_contato(Long contador_contato) {
		this.contador_contato = contador_contato;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
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
		return "Configuracoes [codigo=" + codigo + ", tabela_linhas=" + tabela_linhas + ", contador_endereco="
				+ contador_endereco + ", contador_contato=" + contador_contato + ", ativo=" + ativo + ", criacao="
				+ criacao + ", alteracao=" + alteracao + "]";
	}
}
