package br.edu.unoesc.model.usuario;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import br.edu.unoesc.model.MinhaEntidade;
import br.edu.unoesc.model.pessoa.Pessoa;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_USUARIOS", 
				query="select u from Usuario u order by u.codigo"),
	@NamedQuery(name="TODOS_USUARIOS_ATIVOS",
				query="select u from Usuario u where u.ativo = TRUE"),
	@NamedQuery(name="TODOS_USUARIOS_INATIVOS",
				query="select u from Usuario u where u.ativo = FALSE"),
	@NamedQuery(name="USUARIO_POR_CODIGO",
				query="select u from Usuario u where u.codigo = :codigo")
})/*
	@NamedQuery(name="PESSOAS_EM_USUARIOS",
				query="select u from Usuario u left join Pessoa p on u.pessoa.codigo = p.codigo")
})*/
public class Usuario implements MinhaEntidade{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	private String usuario;
	
	private String senha;
	
	@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "codigo_pessoa", foreignKey=@ForeignKey(name="FK_usuario_pessoa"))
	private Pessoa pessoa;
	
	@OneToOne(targetEntity = PerfilAcesso.class)
	@JoinColumn(name = "codigo_perfil", foreignKey=@ForeignKey(name="FK_usuario_perfil"))
	private PerfilAcesso perfil;
	
	private Boolean ativo;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime criacao;
	
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime alteracao;
	
	public Usuario() {
		super();
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public PerfilAcesso getPerfil() {
		return perfil;
	}

	public void setPerfil(PerfilAcesso perfil) {
		this.perfil = perfil;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
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
		return "Usuario [codigo=" + codigo + ", usuario=" + usuario + ", senha=" + senha + ", pessoa=" + pessoa
				+ ", perfil=" + perfil + ", ativo=" + ativo + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}