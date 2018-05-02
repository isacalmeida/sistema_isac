package br.edu.unoesc.model.produto;

import br.edu.unoesc.model.pessoa.Estado;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.DateTime;

@Generated(value="Dali", date="2018-05-02T14:58:00.765-0300")
@StaticMetamodel(Frete.class)
public class Frete_ {
	public static volatile SingularAttribute<Frete, Long> codigo;
	public static volatile SingularAttribute<Frete, DateTime> criacao;
	public static volatile SingularAttribute<Frete, DateTime> alteracao;
	public static volatile SingularAttribute<Frete, Estado> uf_origem;
	public static volatile SingularAttribute<Frete, Estado> uf_destino;
	public static volatile SingularAttribute<Frete, Double> valor_quilo;
	public static volatile SingularAttribute<Frete, Double> quilo_de;
	public static volatile SingularAttribute<Frete, Double> quilo_ate;
	public static volatile SingularAttribute<Frete, Long> previsao;
}
