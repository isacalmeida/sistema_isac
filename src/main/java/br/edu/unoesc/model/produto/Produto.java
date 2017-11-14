package br.edu.unoesc.model.produto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import br.edu.unoesc.model.MinhaEntidade;
import br.edu.unoesc.model.pessoa.Pessoa;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_PRODUTOS", 
				query="select p from Produto p order by p.codigo")
})
@Table(uniqueConstraints = {
		@UniqueConstraint(columnNames = "cod_pessoa", name = "FK_produto_pessoa"),
		@UniqueConstraint(columnNames = "cod_departamento", name = "FK_produto_departamento")
		/*@UniqueConstraint(columnNames = "cod_cor", name = "FK_produto_cor")*/
})
public class Produto implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String descricao;
	
	@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa fornecedor;
	
	@OneToOne(targetEntity = Departamento.class)
	@JoinColumn(name = "cod_departamento")
	private Departamento departamento;
	
	@OneToMany(targetEntity = Cor.class)
	private List<Cor> cor = new ArrayList<>();
	
	private String codigo_barras;
	
	private Boolean ativo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
	public Produto() {
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

	public Pessoa getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Pessoa fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

	public String getCodigo_barras() {
		return codigo_barras;
	}

	public void setCodigo_barras(String codigo_barras) {
		this.codigo_barras = codigo_barras;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
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
		return "Produto [codigo=" + codigo + ", descricao=" + descricao + ", fornecedor=" + fornecedor
				+ ", departamento=" + departamento + ", codigo_barras=" + codigo_barras + ", ativo=" + ativo
				+ ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
