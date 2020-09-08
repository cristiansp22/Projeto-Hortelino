package model.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import model.Cliente;

public class ClienteDAO {

	private Cliente cliente;
	private BufferedReader br;
	private BufferedWriter bw;
	private String arquivo = "E:\\Renneye\\senai2\\Veiculos\\bd\\Clientes.csv";
	private String[] campos;

	public boolean save(ArrayList<Cliente> clientes) {
		boolean retorno = false;
		try {
			bw = new BufferedWriter(new FileWriter(arquivo, false));
			for (Cliente v : clientes) {
				bw.write(v.toCSV());
			}
			bw.close();
			retorno = true;
		} catch (IOException e) {
			System.out.println("Erro ao salvar " + e);
		}
		return retorno;
	}

	public ArrayList<Cliente> open() {
		ArrayList<Cliente> clientes = new ArrayList<>();
		try {
			br = new BufferedReader(new FileReader(arquivo));
			String linha = br.readLine();
			while (linha != null) {
				campos = linha.split(";");
				cliente = new Cliente();
				cliente.setCPF(Integer.parseInt(campos[0]));
				cliente.setNome(campos[1]);
				cliente.setNascimento(campos[2]);
				cliente.setTelefone(Integer.parseInt(campos[3]));
				clientes.add(cliente);
				linha = br.readLine();
			}
			br.close();
		} catch (FileNotFoundException e) {
			System.out.println("O arquivo não foi encontrado.");
		} catch (IOException e) {
			System.out.println("Erro ao abrir arquivo: " + e);
		}
		return clientes;
	}
}
