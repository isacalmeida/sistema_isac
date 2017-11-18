package br.com.caelum.vraptor.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.stream.ImageInputStream;
import javax.inject.Inject;

import org.apache.tomcat.util.http.fileupload.MultipartStream;
import org.joda.time.DateTime;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.MultipartConfig;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.edu.unoesc.beans.UsuarioBean;
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
	public void index(Integer var, Integer acao, Integer tpag) {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		Long cod = (long) 1;
		Configuracoes conf = cdao.buscar(Configuracoes.class, cod);
		
		List<Pessoa> pessoas = pdao.listar(Pessoa.class, "TODAS_PESSOAS");
		int linhas = 10;
		if(conf != null) {
			linhas = conf.getTabela_linhas();
		}
		int colunas = pessoas.size()/linhas;
		
		if(pessoas.size()%linhas > 0) {
			colunas++;
		}
		
		Pessoa[][] mpess = new Pessoa[colunas][linhas];
		
		int linha = 0;
		int coluna = 0;
		for(Pessoa pessoa : pessoas) {
			mpess[coluna][linha] = pessoa;
			linha ++;
			if(linha == linhas) {
				linha = 0;
				coluna ++;
			}
		}
		
		if(tpag == null) {
			tpag = 0;
		}
		else {
			tpag--;
		}
		if(pessoas.size() == 0) {
			result.include("pessoas", null);
			colunas = 1;
		}
		else {
			result.include("pessoas", mpess[tpag]);
		}
		result.include("colunas", colunas);
		result.include("pag", tpag);
		result.include("var", var);
		result.include("acao", acao);
	}
	
	@Get("/novo")
	public void novo() {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
	}
	
	@Post("/salvar")
	public void salvar(Pessoa pessoa, File imagem) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		System.out.println("Pessoa: "+ pessoa);
		System.out.println("Imagem: "+ imagem);
		
		
		
		if(pessoa.getCodigo() == null) {
			pessoa.setCriacao(new DateTime());
			pessoa.setAlteracao(new DateTime());
			
			if(pessoa.getEndereco().size() > 0) {
				for(Endereco end : pessoa.getEndereco()) {
					end.setPessoa(pessoa);
				}
			}
			
			if(pessoa.getContato().size() > 0) {
				for(Contato cont : pessoa.getContato()) {
					cont.setPessoa(pessoa);
				}
			}

			result.redirectTo(this).index(pdao.salvar(pessoa),0,1);
		}
		else {
			Pessoa pess = pdao.buscar(Pessoa.class, pessoa.getCodigo());
			
			pessoa.setCriacao(pess.getCriacao());
			pessoa.setAlteracao(new DateTime());
			
			/*
			System.out.println("Pessoa1: "+pess);
			System.out.println("Pessoa2: "+pessoa);
			List<Endereco> endremov = new ArrayList<Endereco>();
			
			endremov = pess.getEndereco();
			if(endremov.size() > 0) {
				for(Endereco end : endremov) {
					edao.excluir(end);
				}
			}
			
			List<Contato> contremov = new ArrayList<Contato>();
			
			contremov = pess.getContato();
			if(contremov.size() > 0) {
				for(Contato cont : contremov) {
					ctdao.excluir(cont);
				}
			}
			
			if(pessoa.getEndereco().size() > 0) {
				List<Endereco> endlist = new ArrayList<Endereco>();
				endlist = pessoa.getEndereco();
				for(Endereco end : endlist) {
					end.setAlteracao(new Date());
					//edao.salvar(end);
				}
				pessoa.setEndereco(endlist);
			}
			
			if(pessoa.getContato().size() > 0) {
				List<Contato> contlist = new ArrayList<Contato>();
				contlist = pessoa.getContato();
				for(Contato cont : contlist) {
					cont.setAlteracao(new Date());
					//ctdao.salvar(cont);
				}
				pessoa.setContato(contlist);
			}*/
			result.redirectTo(this).index(pdao.salvar(pessoa),1,1); 
		} 
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		Pessoa pessoa = pdao.buscar(Pessoa.class, cod);
		
		System.out.println("Pessoa: "+ pessoa);
		/*int tamanho, metade;
		
		if(pessoa.getEndereco().size() % 2 == 0) {
			List<Endereco> ends = pessoa.getEndereco();
			List<Endereco> end = new ArrayList<Endereco>();
			
			tamanho = ends.size();
			metade = tamanho/2;
			for(int i = 0; i<metade; i++) {
				end.add(ends.get(i));
			}
			pessoa.setEndereco(end);
		}
		if(pessoa.getContato().size() % 2 == 0) {
			List<Contato> conts = pessoa.getContato();
			List<Contato> cont = new ArrayList<Contato>();
		
			tamanho = conts.size();
			metade = tamanho/2;
			for(int i = 0; i<metade; i++) {
				cont.add(conts.get(i));
			}
			pessoa.setContato(cont);
		}
		*/
		result.include("qtdendereco", pessoa.getEndereco().size());
		result.include("qtdcontato", pessoa.getContato().size());
		result.include("pessoa", pessoa);
	}
	
	@Get("/excluir")
	public void excluir(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<Usuario> usuarios = udao.listar(Usuario.class, "TODOS_USUARIOS");
		Pessoa pessoa = null;
		
		for (Usuario usuario : usuarios) {
			if(usuario.getPessoa().getCodigo() == cod)
				 pessoa = usuario.getPessoa();
		}
		
		if(pessoa == null){
			pessoa = pdao.buscar(Pessoa.class, cod);
			result.redirectTo(this).index(pdao.excluir(pessoa),2,1);
		}
		else {
			result.redirectTo(this).index(0,2,1);
		}
	}
}
