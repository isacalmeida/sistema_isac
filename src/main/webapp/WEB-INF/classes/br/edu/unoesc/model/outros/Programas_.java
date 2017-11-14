package br.edu.unoesc.model.outros;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-11-12T14:13:23.640-0200")
@StaticMetamodel(Programas.class)
public class Programas_ {
	public static volatile SingularAttribute<Programas, Long> codigo;
	public static volatile SingularAttribute<Programas, String> programa;
	public static volatile SingularAttribute<Programas, String> endereco;
	public static volatile SingularAttribute<Programas, Date> data;
	public static volatile SingularAttribute<Programas, Boolean> ativo;
}
