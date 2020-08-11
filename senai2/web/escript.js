function processaForm(){
    var nome = document.getElementById ("name").value;
    var idade = document.getElementById ("age").value;
    var sexo = document.getElementById ("gender").value;

    if(idada < 10){
        fase = "criança";
    }else if(idade <15){
        fase="adolecente";
    }else if(idade <20){
        fase="jovem";
    }else if(idade<40){
        fase="adulto";
    }else{
        fase="velho";
    }

    alert("Olá "+nome+" você tem "+idade+" anos, é do sexo "+sexo+" e é"+fase);
}