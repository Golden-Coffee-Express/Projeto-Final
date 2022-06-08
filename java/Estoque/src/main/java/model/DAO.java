package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	/** M�dilo de conex�o **/
	// parametros de conex�o
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/golden_express?use Timezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "";

	// Metodo de conex�o
	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			return null;
		}
	}

	// teste conex�o
	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
		}

	}

	/** crud creat **/
	public void inserirItem(JavaBeans item) {
		String criar = "insert into estoque (item,distribuidora,quantidade) values (?,?,?)";

		try {
			// abrir a conex�o
			Connection con = conectar();
			// preparar a quary para execu��o no bd
			PreparedStatement pst = con.prepareStatement(criar);
			// substituir os parametros pelo conteudo javabeans
			pst.setString(1, item.getItem());
			pst.setString(2, item.getDistribuidora());
			pst.setString(3, item.getQuantidade());
			// executar a quary
			pst.executeUpdate();
			// encerrar a conx�o com o bd
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	// crud read
	public ArrayList<JavaBeans> listarItems() {
		// criando um objeto para criar a classe JavaBeans
		ArrayList<JavaBeans> items = new ArrayList<>();
		String read = "select * from estoque order by item";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			// o la�o abaixo sera executado enquanto houver items
			while (rs.next()) {
				// variaveis de apoio que rebem dados do BD
				String id = rs.getString(1);
				String item = rs.getString(2);
				String distribuidora = rs.getString(3);
				String quantidade = rs.getString(4);
				// populando a ArrayList

				items.add(new JavaBeans(id, item, distribuidora, quantidade));
			}
			con.close();
			return items;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	//crud update
	//selecionar o item
	public void SelecionarItem(JavaBeans item) {
		String read2 = "select * from estoque where id = ? ";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setString(1, item.getId());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				//setar as bariaveis JavaBeans
				item.setId(rs.getString(1));
				item.setItem(rs.getString(2));
				item.setDistribuidora(rs.getString(3));
				item.setQuantidade(rs.getString(4));	
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	//editar os items
	public void alterarItem(JavaBeans item) {
		String create = "update estoque set item=?,distribuidora=?,quantidade=? where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			pst.setString(1, item.getItem());
			pst.setString(2, item.getDistribuidora());
			pst.setString(3, item.getQuantidade());
			pst.setString(4, item.getId());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// crud delete
	public void deletarItem(JavaBeans item) {
		String delete = "delete from estoque where id=?";
		try {
			Connection con= conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setString(1, item.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}