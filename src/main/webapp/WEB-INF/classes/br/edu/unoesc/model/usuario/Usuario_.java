package br.edu.unoesc.model.usuario;

import br.edu.unoesc.model.pessoa.Pessoa;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-11-12T14:10:59.186-0200")
@StaticMetamodel(Usuario.class)
public class Usuario_ {
	public static volatile SingularAttribute<Usuario, Long> codigo;
	public static volatile SingularAttribute<Usuario, String> usuario;
	public static volatile SingularAttribute<Usuario, String> senha;
	public static volatile SingularAttribute<Usuario, Date> data;
	public static volatile SingularAttribute<Usuario, Pessoa> pessoa;
	public static volatile SingularAttribute<Usuario, Boolean> ativo;
}
