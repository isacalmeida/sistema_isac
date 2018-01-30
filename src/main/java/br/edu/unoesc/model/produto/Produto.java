package br.edu.unoesc.model.produto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;
import br.edu.unoesc.model.pessoa.Pessoa;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_PRODUTOS", 
				query="select p from Produto p order by p.codigo"),
	@NamedQuery(name="PRODUTO_POR_CODIGO",
				query="select p from Produto p where p.codigo = :codigo")
})
public class Produto implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String descricao;
	
	private String imagem;
	
	@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name="codigo_pessoa", foreignKey=@ForeignKey(name="FK_produto_pessoa"))
	private Pessoa fornecedor;
	
	@OneToOne(targetEntity = Departamento.class)
	@JoinColumn(name="codigo_departamento", foreignKey=@ForeignKey(name="FK_produto_departamento"))
	private Departamento departamento;
	
	@OneToMany(targetEntity = Cor.class, fetch = FetchType.EAGER)
	private List<Cor> cor = new ArrayList<Cor>();
	
	private String codigo_barras;
	
	private boolean ativo;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
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

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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

	public List<Cor> getCor() {
		return cor;
	}

	public void setCor(List<Cor> cor) {
		this.cor = cor;
	}

	public String getCodigo_barras() {
		return codigo_barras;
	}

	public void setCodigo_barras(String codigo_barras) {
		this.codigo_barras = codigo_barras;
	}

	public boolean getAtivo() {
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
		return "Produto [codigo=" + codigo + ", descricao=" + descricao + ", imagem=" + imagem + ", fornecedor="
				+ fornecedor + ", departamento=" + departamento + ", cor=" + cor + ", codigo_barras=" + codigo_barras
				+ ", ativo=" + ativo + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}
