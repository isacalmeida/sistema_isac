package br.edu.unoesc.model.usuario;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-11-20T21:01:51.476-0200")
@StaticMetamodel(Programas.class)
public class Programas_ {
	public static volatile SingularAttribute<Programas, Long> codigo;
	public static volatile SingularAttribute<Programas, String> descricao;
	public static volatile SingularAttribute<Programas, String> endereco;
	public static volatile SingularAttribute<Programas, Boolean> ativo;
	public static volatile SingularAttribute<Programas, Date> criacao;
	public static volatile SingularAttribute<Programas, Date> alteracao;
}
