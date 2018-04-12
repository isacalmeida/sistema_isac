package br.edu.unoesc.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.hibernate.criterion.MatchMode;

import br.edu.unoesc.exception.DAOException;
import br.edu.unoesc.model.MinhaEntidade;

@RequestScoped
public abstract class HibernateDAO<T extends MinhaEntidade>  {

	@Produces
	private static EntityManagerFactory emf = 
			Persistence.createEntityManagerFactory("unidade");

	@Produces
	protected EntityManager em;

	@Produces
	protected EntityTransaction et;

	protected void conectar() {
		em = emf.createEntityManager();
	}

	protected void finalizar() {
		em.close();
	}

	public Integer salvar(T entidade) throws DAOException {
		this.conectar();
		Integer var = 0;
		et = em.getTransaction();
		try {
			et.begin();
			if (entidade.getCodigo() == null) {
				em.persist(entidade);
			} else {
				em.merge(entidade);
			}
			et.commit();
			var = 2;
		} catch (PersistenceException ex) {
			if (et.isActive()) {
				et.rollback();
			}
			//throw new DAOException("Erro ao Salvar", ex.getCause());
		} finally {
			this.finalizar();
		}
		return var;
	}
	
	public Integer excluir(T entidade) throws DAOException {
		this.conectar();
		Integer var = 0;
		et = em.getTransaction();
		try {
			et.begin();
			Object t = em.find(entidade.getClass(), entidade.getCodigo());
			em.remove(t);
			et.commit();
			var = 2;
		} catch (PersistenceException ex) {
			if (et.isActive()) {
				et.rollback();
			}
			//throw new DAOException("Erro ao Excluir", ex.getCause());
		} finally {
			this.finalizar();	
		}
		return var;
	}

	public T buscar(Class<T> classe, Long codigo) {
		this.conectar();
		try {
			return em.find(classe, codigo);
		} finally {
			this.finalizar();
		}
	}
	
	public List<T> buscar(Class<T> classe, String desc, String named) {
		this.conectar();
		try {
			// String hql = "from "+classe.getName()+" a where upper(a.nome)
			// like ?";
			// TypedQuery<T> query = em.createQuery(hql, classe);
			// TypedQuery<T> query = em.createNativeQuery("SELECT * FROM ALUNO",
			// classe);
			TypedQuery<T> query = em.createNamedQuery(named, classe);
			query.setParameter("descricao", MatchMode.ANYWHERE.toMatchString(desc.toLowerCase()));
			return query.getResultList();
		} finally {
			this.finalizar();
		}
	}

	public List<T> buscar(Class<T> classe, Long cod, String named) {
		this.conectar();
		try {
			// String hql = "from "+classe.getName()+" a where upper(a.nome)
			// like ?";
			// TypedQuery<T> query = em.createQuery(hql, classe);
			// TypedQuery<T> query = em.createNativeQuery("SELECT * FROM ALUNO",
			// classe);
			TypedQuery<T> query = em.createNamedQuery(named, classe);
			query.setParameter("codigo", cod);
			return query.getResultList();
		} finally {
			this.finalizar();
		}
	}

	public List<T> listar(Class<T> entidade, String named) {
		this.conectar();
		try {
			TypedQuery<T> query = em.createNamedQuery(named, entidade);
			return query.getResultList();
		} finally {
			this.finalizar();
		}
	}
	
	public Long buscar(Class<T> entidade, String named) {
		this.conectar();
		try {
			Query query = em.createNamedQuery(named);
			return (Long) query.getSingleResult();
		} finally {
			this.finalizar();
		}
	}

}
