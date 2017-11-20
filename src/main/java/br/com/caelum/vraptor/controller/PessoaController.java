package br.com.caelum.vraptor.controller;

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
	public void salvar(Pessoa pessoa, UploadedFile imagem) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		Configuracoes confs = cdao.buscar(Configuracoes.class, 1L);
		
		if(pessoa.getCodigo() == null) {
			pessoa.setCriacao(new DateTime());
			pessoa.setAlteracao(new DateTime());
			
			if(imagem == null) {
				String endImagem = new String("/imagem/pessoa/avatarpadrao.png");
				pessoa.setImagem(endImagem);
			}
			else {
				//File savedPhoto = new File("/path/to/photo/repository", photo.getFileName());
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
			result.redirectTo(this).index(pdao.salvar(pessoa),0,1);
		}
		else {
			List<Pessoa> pes = pdao.buscar(Pessoa.class, pessoa.getCodigo(), "PESSOA_POR_CODIGO");
			Pessoa pess = pes.get(0);
			
			pessoa.setCriacao(pess.getCriacao());
			pessoa.setAlteracao(new DateTime());
			System.out.println("Pessoa 1: "+ pess);
			System.out.println("Pessoa 2: "+ pessoa);
			
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
			System.out.println("Final: "+ pessoa);
			result.redirectTo(this).index(pdao.salvar(pessoa),1,1); 
		} 
	}
	
	@Get("/{cod}/editar")
	public void editar(Long cod) throws DAOException {
		if(usuarioSessao.isLogado() == false)
			result.redirectTo(LoginController.class).index(null);
		result.include("usuario_nome", usuarioSessao.getNome());
		
		List<Pessoa> pessoa = pdao.buscar(Pessoa.class,cod,"PESSOA_POR_CODIGO");
		
		//System.out.println("Pessoa Pag: "+ pessoa);
		
		result.include("qtdendereco", pessoa.get(0).getEndereco().size());
		result.include("qtdcontato", pessoa.get(0).getContato().size());
		result.include("pessoa", pessoa.get(0));
	}
	
	@Get("/{cod}/excluir")
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
