package br.edu.unoesc.model.pessoa;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-11-12T13:55:50.056-0200")
@StaticMetamodel(Pessoa.class)
public class Pessoa_ {
	public static volatile SingularAttribute<Pessoa, Long> codigo;
	public static volatile SingularAttribute<Pessoa, Character> tipo;
	public static volatile SingularAttribute<Pessoa, String> cpf_cnpj;
	public static volatile SingularAttribute<Pessoa, String> nome_razao;
	public static volatile SingularAttribute<Pessoa, String> fantasia;
	public static volatile SingularAttribute<Pessoa, Boolean> cliente;
	public static volatile SingularAttribute<Pessoa, Boolean> fornecedor;
	public static volatile SingularAttribute<Pessoa, Boolean> ativo;
	public static volatile SingularAttribute<Pessoa, Date> alteracao;
	public static volatile SingularAttribute<Pessoa, Date> criacao;
}
