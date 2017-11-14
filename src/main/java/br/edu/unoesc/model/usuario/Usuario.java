package br.edu.unoesc.model.usuario;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import br.edu.unoesc.model.MinhaEntidade;
import br.edu.unoesc.model.pessoa.Pessoa;

@Entity
@NamedQueries({
	@NamedQuery(name="TODOS_USUARIOS", 
				query="select u from Usuario u order by u.codigo"),
	@NamedQuery(name="TODOS_USUARIOS_ATIVOS",
				query="select u from Usuario u where u.ativo = TRUE"),
	@NamedQuery(name="TODOS_USUARIOS_INATIVOS",
				query="select u from Usuario u where u.ativo = FALSE")
})/*
	@NamedQuery(name="PESSOAS_EM_USUARIOS",
				query="select u from Usuario u left join Pessoa p on u.pessoa.codigo = p.codigo")
})*/
@Table(uniqueConstraints = {
		@UniqueConstraint(columnNames = "cod_pessoa", name = "FK_usuario_pessoa"),
		@UniqueConstraint(columnNames = "cod_perfil", name = "FK_usuario_perfil")
})
public class Usuario implements MinhaEntidade{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long codigo;
	
	@Column(nullable=false)
	private String usuario;
	
	@Column(nullable=false)
	private String senha;
	
	@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_pessoa")
	private Pessoa pessoa;
	
	@OneToOne(targetEntity = Pessoa.class)
	@JoinColumn(name = "cod_perfil")
	private PerfilAcesso perfil;
	
	private Boolean ativo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date criacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date alteracao;
	
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
		return "Usuario [codigo=" + codigo + ", usuario=" + usuario + ", senha=" + senha + ", pessoa=" + pessoa
				+ ", perfil=" + perfil + ", ativo=" + ativo + ", criacao=" + criacao + ", alteracao=" + alteracao + "]";
	}
}