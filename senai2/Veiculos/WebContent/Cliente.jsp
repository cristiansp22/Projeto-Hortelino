<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>Clientes</title>
</head>
<body>

	<form method="POST">
		<input type="text" size="10" name="CPF" placeholder="CPF" /> <input
			type="text" size="10" name="Nome" placeholder="Nome" /> <input
			type="text" size="10" name="Nascimento" placeholder="Nascimento" />
		<input type="text" size="6" name="Telefone" placeholder="Telefone" />
		<input type="submit" value="Enviar">
	</form>
	<table>
		<thead>
			<tr>
				<th>CPF</th>
				<th>Nome</th>
				<th>Nascimento</th>
				<th>Telefone</th>
			</tr>
		</thead>
		<tbody>

			<%
				//Cabeçalho
			Cliente cliente;
			ClienteDAO vd = new ClienteDAO();
			ArrayList<Cliente> clientes = vd.open();

			//Validando e Recebendo dados por request (Dados do frontEnd)
			String Nome = request.getParameter("Nome");
			String Nascimento = request.getParameter("Nascimento");
			int CPF = 0, Telefone = 0;

			if (request.getParameter("CPF") != null) {
				CPF = Integer.parseInt(request.getParameter("CPF"));
			}
			if (request.getParameter("Telefone") != null) {
				Telefone = Integer.parseInt(request.getParameter("Telefone"));
			}

			//(CREATE UPDATE) Cadastra um veículo no arquivo de Banco de Dados
			if (Nome != null && Nascimento != null && Telefone != 0 && CPF != 0) {
				cliente = new Cliente(); //Novo objeto vazio
				//Preencher o objeto configurando os dados recebido do front End
				cliente.setCPF(CPF);
				cliente.setNome(Nome);
				cliente.setNascimento(Nascimento);
				cliente.setTelefone(Telefone);
				if (!clientes.contains(cliente)) {//Se a lista não contem o novo veículo
					clientes.add(cliente);//Adicionar o veículo a lista
					vd.save(clientes);//Salvar a nova lista no arquivo
					response.sendRedirect("#"); //Renova a página respondendo vazio #
				} else {
					clientes.set(clientes.indexOf(cliente), cliente);
					vd.save(clientes);
					response.sendRedirect("#"); 
					out.print("esse já está cadastrado e foi atualizado");
				}
			}

			//(READ) Retorna todos ou só um veículo conforme a placa.
			if (Nome == null) {
				//Todos
				for (Cliente v : clientes) {
					out.print("<tr>");//Inicio da linha da tabela
					out.print(v.toHTML()); //Percorre toda a lista
					out.print("<form method='POST'>");
					out.print("<td><input type='hidden' name='delete' value='" + v.getNome() + "' ></td>");
					out.print("<td><input type='submit' value=	' - '></td>");
					out.print("</form>");
					out.print("</tr>");//Fim da linha da tabela
				}
			} else {
				cliente = new Cliente();
				cliente.setNome(request.getParameter("nome"));
				if (clientes.contains(cliente)) {
					//Só um
					out.print("<tr>");
					out.print(clientes.get(clientes.indexOf(cliente)).toHTML());
					out.print("<td><input type='submit' value=	' - '></td>");
					out.print("</tr>");
				} else {
					out.print("cadastro não encontrada.");
				}
			}

			//(DELETE)
			if (request.getParameter("delete") != null) {
				cliente = new Cliente();
				cliente.setNome(request.getParameter("delete"));
				clientes.remove(clientes.indexOf(cliente));
				vd.save(clientes);
				out.print("cadstro removido com sucesso");
				response.sendRedirect("#"); //Renova a página respondendo vazio #
			}
			%>

		</tbody>
	</table>
</body>
</html>