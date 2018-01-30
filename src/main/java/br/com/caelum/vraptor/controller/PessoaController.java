package br.com.caelum.vraptor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.edu.unoesc.beans.UsuarioBean;
import br.edu.unoesc.components.ValidaCpfCnpj;
import br.edu.unoesc.dao.ConfiguracoesDAO;
import br.edu.unoesc.dao.ContatoDAO;
import br.edu.unoesc.dao.EnderecoDAO;
import br.edu.unoesc.dao.PessoaDAO;
import br.edu.unoesc.dao.UsuarioDAO;
import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.outros.Configuracoes;
import br.edu.unoesc.model.pessoa.Contato;
import br.edu.unoesc.model.pessoa.Endereco;
import br.edu.unoesc.model.pessoa.Pessoa;
import br.edu.unoesc.model.usuario.Usuario;

@Path("/pessoa")
@Controller
public class PessoaController {
	
	@Inject
	private Result result;
	
	@Inject 
	private PessoaDAO pdao;	
	
	@Inject 
	private UsuarioDAO udao;
	
	@Inject
	private EnderecoDAO edao;
	
	@Inject
	private ContatoDAO ctdao;
	
	@Inject
	private ConfiguracoesDAO cdao;
	
	@Inject
	private UsuarioBean usuarioSessao;
	
	@Get("")
	public void index(Integer var, Integer acao) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Pessoa", 1) == false) {
				result.include("permissao", 1);
			}
			else {
				if(usuarioSessao.getPermissao("Pessoa", 2) == false) {
					result.include("permissao", 2);
				}
				List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
				result.include("pessoas", pessoas);
				
				result.include("var", var);
				result.include("acao", acao);
			}
		}
	}
	
	@Get("/novo")
	public void novo(Pessoa pessoa, List<String> erros) {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Pessoa", 2) == false) {
				result.include("permissao", 1);
			}
			result.include("pessoa", pessoa);
			result.include("erros", erros);
		}
	}
	
	@SuppressWarnings("unused")
	@Post("/salvar")
	public void salvar(Pessoa pessoa, UploadedFile imagem, Integer submit) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			Configuracoes confs = cdao.buscar(Configuracoes.class, 1L);
			
			List<String> validacao = new ArrayList<String>();
			
			if(pessoa.getTipo() == 'F') {
				if(ValidaCpfCnpj.isValidCPF(pessoa.getCpf()) == false) {
					validacao.add("CPF Inválido");
				}
				pessoa.setCnpj(null);
				pessoa.setRazao(null);
				pessoa.setFantasia(null);
				pessoa.setInscricao_estadual(null);
				pessoa.setData_fundacao(null);
			}
			else if(pessoa.getTipo() == 'J') {
				if(ValidaCpfCnpj.isValidCNPJ(pessoa.getCnpj()) == false) {
					validacao.add("CNPJ Inválido");
				}
				pessoa.setCpf(null);
				pessoa.setNome(null);
				pessoa.setIdentidade(null);
				pessoa.setData_emissao(null);
				pessoa.setData_nascimento(null);
				pessoa.setSexo(null);
				pessoa.setEstado_civil(null);
			}
			
			if(pessoa.getCodigo() == null) {
				pessoa.setCriacao(new DateTime());
				pessoa.setAlteracao(new DateTime());
				
				if(imagem == null) {
					String endImagem = new String("/imagem/pessoa/avatar_default-160x160.png");
					pessoa.setImagem(endImagem);
				}
				else {
					String endImagem = new String("/imagem/pessoa/avatar_default-160x160.png");
					pessoa.setImagem(endImagem);
				}
				
				if(pessoa.getEndereco().size() > 0) {
					for(Endereco end : pessoa.getEndereco()) {
						end.setCodigo(confs.getContador_endereco());
						confs.setContador_endereco(confs.getContador_endereco()+1L);
						end.setPessoa(pessoa);
					}
				}
				
				if(pessoa.getContato().size() > 0) {
					for(Contato cont : pessoa.getContato()) {
						cont.setCodigo(confs.getContador_contato());
						confs.setContador_contato(confs.getContador_contato()+1L);
						cont.setPessoa(pessoa);
					}
				}
				
				if(validacao == null) {
					cdao.salvar(confs);
					result.redirectTo(this).index(pdao.salvar(pessoa),0);
				}
				else {
					result.redirectTo(this).novo(pessoa, validacao);
				}
			}
			else {
				List<Pessoa> pes = pdao.buscar(Pessoa.class, pessoa.getCodigo(), "PESSOA_POR_CODIGO");
				Pessoa pess = pes.get(0);
				
				pessoa.setCriacao(pess.getCriacao());
				pessoa.setAlteracao(new DateTime());
				
				List<Endereco> endremov = pess.getEndereco();
				if(endremov.size() > 0) {
					for(Endereco end : endremov) {
						confs.setContador_endereco(confs.getContador_endereco()-1L);
						end.setPessoa(null);
						edao.salvar(end);
						edao.excluir(end);
					}
				}
				
				List<Contato> contremov = pess.getContato();
				if(contremov.size() > 0) {
					for(Contato cont : contremov) {
						confs.setContador_contato(confs.getContador_contato()-1L);
						cont.setPessoa(null);
						ctdao.salvar(cont);
						ctdao.excluir(cont);
					}
				}
				
				if(pessoa.getEndereco().size() > 0) {
					for(Endereco end : pessoa.getEndereco()) {
						end.setCodigo(confs.getContador_endereco());
						confs.setContador_endereco(confs.getContador_endereco()+1L);
						end.setPessoa(pessoa);
					}
				}
				
				if(pessoa.getContato().size() > 0) {
					for(Contato cont : pessoa.getContato()) {
						cont.setCodigo(confs.getContador_contato());
						confs.setContador_contato(confs.getContador_contato()+1L);
						cont.setPessoa(pessoa);
					}
				}
				cdao.salvar(confs);
				if(submit == 1)
					result.redirectTo(this).index(pdao.salvar(pessoa),1);
				else if(submit == 2)
					result.redirectTo(this).editar(pessoa.getCodigo(),pdao.salvar(pessoa));
			}
		}
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod, Integer var) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			result.include("usuario_foto", usuarioSessao.getUsuario().getFoto());
			result.include("usuario_colaborador", usuarioSessao.getUsuario().getColaborador());
			result.include("usuario_perfil", usuarioSessao.getUsuario().getPerfil().getDescricao());
			
			if(usuarioSessao.getPermissao("Pessoa", 3) == false) {
				result.include("editar", 1);
			}
			if(usuarioSessao.getPermissao("Pessoa", 4) == false) {
				result.include("excluir", 1);
			}
			
			List<Pessoa> pessoa = pdao.buscar(Pessoa.class,cod,"PESSOA_POR_CODIGO");
			
			result.include("qtdendereco", pessoa.get(0).getEndereco().size());
			result.include("qtdcontato", pessoa.get(0).getContato().size());
			result.include("pessoa", pessoa.get(0));
			result.include("var", var);
		}
	}
	
	@Get("/{cod}/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.equals(null))
			result.redirectTo(LoginController.class).index(null);
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		else {
			result.include("usuario_nome", usuarioSessao.getNome());
			
			if(usuarioSessao.getPermissao("Pessoa", 4) == false) {
				result.redirectTo(this).index(1,2);
			}
			else {
				List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
				Pessoa pessoa = null;
				
				for (Usuario usuario : usuarios) {
					if(usuario.getPessoa().getCodigo() == cod)
						 pessoa = usuario.getPessoa();
				}
				
				if(pessoa == null){
					pessoa = pdao.buscar(Pessoa.class, cod);
					result.redirectTo(this).index(pdao.excluir(pessoa),2);
				}
				else {
					result.redirectTo(this).index(0,2);
				}
			}
		}
	}
}
