package br.edu.unoesc.model.usuario;

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
	@NamedQuery(name="TODOS_PERFIS", 
				query="select p from PerfilAcesso p order by p.codigo"),
	@NamedQuery(name="PERFIL_POR_CODIGO",
				query="select p from PerfilAcesso p where p.codigo = :codigo")
})
public class PerfilAcesso implements MinhaEntidade{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String descricao;
	
	@OneToMany(mappedBy="perfilacesso", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Acessos> acessos = new ArrayList<Acessos>();

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
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

	public List<Acessos> getAcessos() {
		return acessos;
	}

	public void setAcessos(List<Acessos> acessos) {
		this.acessos = acessos;
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
		return "PerfilAcesso [codigo=" + codigo + ", descricao=" + descricao + ", acessos=" + acessos + ", criacao="
				+ criacao + ", alteracao=" + alteracao + "]";
	}
}
