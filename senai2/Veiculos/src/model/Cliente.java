package model;

public class Cliente {

	private String Nome,Nascimento;
	private int CPF, Telefone;

	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getNascimento() {
		return Nascimento;
	}
	public void setNascimento(String nascimento) {
		Nascimento = nascimento;
	}
	public int getCPF() {
		return CPF;
	}
	public void setCPF(int cPF) {
		CPF = cPF;
	}
	public int getTelefone() {
		return Telefone;
	}
	public void setTelefone(int telefone) {
		Telefone = telefone;
	}

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Nome == null) ? 0 : Nome.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (Nome == null) {
			if (other.Nome != null)
				return false;
		} else if (!Nome.equals(other.Nome))
			return false;
		return true;
	}
	//Banco de Dados Local (Arquivo de Texto)
	public String toCSV() {
		return CPF + ";" + Nome + ";" + Nascimento + ";" + Telefone + ";" + "\r\n";
	}
	
	//Front End (Colunas em uma tabela)
	public String toHTML() {
		return "<td>"+CPF + "</td><td>" + Nome + "</td><td>" + Nascimento + "</td><td>" + Telefone + "</td><td>" ;
	}

}
