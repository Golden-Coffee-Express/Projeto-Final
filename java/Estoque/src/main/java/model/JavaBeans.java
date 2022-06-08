package model;

public class JavaBeans {
private String id;
private String item;
private String distribuidora;
private String quantidade;

public JavaBeans(String id, String item, String distribuidora, String quantidade) {
	super();
	this.id = id;
	this.item = item;
	this.distribuidora = distribuidora;
	this.quantidade = quantidade;}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getItem() {
	return item;
}
public void setItem(String item) {
	this.item = item;
}
public String getDistribuidora() {
	return distribuidora;
}
public void setDistribuidora(String distribuidora) {
	this.distribuidora = distribuidora;
}
public String getQuantidade() {
	return quantidade;
}
public void setQuantidade(String quantidade) {
	this.quantidade = quantidade;
}
public JavaBeans() {
	super();

	
}

}

