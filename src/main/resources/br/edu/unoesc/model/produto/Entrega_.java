package br.edu.unoesc.model.produto;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.joda.time.DateTime;

@Generated(value="Dali", date="2018-05-02T14:57:55.973-0300")
@StaticMetamodel(Entrega.class)
public class Entrega_ {
	public static volatile SingularAttribute<Entrega, Long> codigo;
	public static volatile SingularAttribute<Entrega, DateTime> criacao;
	public static volatile SingularAttribute<Entrega, DateTime> alteracao;
	public static volatile SingularAttribute<Entrega, Frete> frete;
	public static volatile SingularAttribute<Entrega, Long> codigo_pedido;
	public static volatile SingularAttribute<Entrega, Long> status;
	public static volatile SingularAttribute<Entrega, String> observacao;
}
