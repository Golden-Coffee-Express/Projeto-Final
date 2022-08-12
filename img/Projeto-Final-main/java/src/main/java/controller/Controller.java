package controller;

import java.io.IOException;
import java.util.ArrayList;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO;
import model.JavaBeans;

@WebServlet(urlPatterns = { "/Controller", "/main", "/insert", "/select", "/update", "/delete", "/report" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();

	JavaBeans item = new JavaBeans();

	public Controller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println(action);
		if (action.equals("/main")) {
			;
			items(request, response);
		} else if (action.equals("/insert")) {
			novoItem(request, response);
		} else if (action.equals("/select")) {
			listarItems(request, response);
		} else if (action.equals("/update")) {
			editarItem(request, response);
		} else if (action.equals("/report")) {
			gerarRelatorio(request, response);
		} else if (action.equals("/delete")) {
			removerItem(request, response);

		} else {
			response.sendRedirect("index.html");
		}

	}

	// Listar intems
	protected void items(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// criando um objeto que recebera os dados JavaBeans
		ArrayList<JavaBeans> lista = dao.listarItems();
		// Encaminhar a lista ao documento estoque.jsp
		request.setAttribute("item", lista);
		RequestDispatcher rd = request.getRequestDispatcher("estoque.jsp");
		rd.forward(request, response);
	}

	// Novos intens
	protected void novoItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// setar as variaveis javabeans
		item.setItem(request.getParameter("item"));
		item.setDistribuidora(request.getParameter("distribuidora"));
		item.setQuantidade(request.getParameter("quantidade"));
		// invocar o método inserirItem passando o objeto item
		dao.inserirItem(item);
		// redirecionar para o estoque.jsp
		response.sendRedirect("main");

	}

	// Editar item
	protected void listarItems(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		// Setar a variavel JavaBeans
		item.setId(id);
		// executar o metodo selecionar item
		dao.SelecionarItem(item);
		// setar os atributos do form com o Java Beans
		request.setAttribute("id", item.getId());
		request.setAttribute("item", item.getItem());
		request.setAttribute("distribuidora", item.getDistribuidora());
		request.setAttribute("quantidade", item.getQuantidade());
		// encaminha ao editar.jsp
		RequestDispatcher rd = request.getRequestDispatcher("editar.jsp");
		rd.forward(request, response);
	}

	protected void editarItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// setar as variaveis JavaBeans
		item.setId(request.getParameter("id"));
		item.setItem(request.getParameter("item"));
		item.setDistribuidora(request.getParameter("distribuidora"));
		item.setQuantidade(request.getParameter("quantidade"));
		// executar o alterarItem
		dao.alterarItem(item);
		// redirecio para o estoque.jsp (fazendo alteraçoes)
		response.sendRedirect("main");
	}

	// reover um item
	protected void removerItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// setar variavel id JavaBeans
		item.setId(id);
		// executar deletar item (dao) passando item como parametro
		dao.deletarItem(item);
		// redirecio para o estoque.jsp (fazendo alteraçoes)
		response.sendRedirect("main");
	}
	//gerar relatorio pdf
	protected void gerarRelatorio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Document documento = new Document();
		try {
			//tipp de cpnteudo
			response.setContentType("application/pdf");
			//nome
			response.addHeader("Content-disposition", "inline; filename="+"item.pdf");
			//crir documento
			PdfWriter.getInstance(documento, response.getOutputStream());
			//abrir documento gera conteudo
			documento.open();
			documento.add(new Paragraph("lista de itens:"));
			documento.add(new Paragraph(" "));
			//criar uma tabela
			PdfPTable tabela = new PdfPTable(3);
			//cabeçalho
			PdfPCell col1 = new PdfPCell(new Paragraph("item"));
			PdfPCell col2 = new PdfPCell(new Paragraph("distribuidora"));
			PdfPCell col3 = new PdfPCell(new Paragraph("quantidade"));
			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			//colocar items na tabela
			ArrayList<JavaBeans> lista = dao.listarItems();
			for (int i = 0; i < lista.size(); i++) {
				tabela.addCell(lista.get(i).getItem());
				tabela.addCell(lista.get(i).getDistribuidora());
				tabela.addCell(lista.get(i).getQuantidade());
			}
			
			documento.add(tabela);
			documento.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
