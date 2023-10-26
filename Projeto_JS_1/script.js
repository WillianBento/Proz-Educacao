// Capturando os elementos
const titulo = document.getElementById("titulo");
const listaNaoOrdenada = document.querySelector("ul");
const link = document.getElementById("link");
const listaOrdenada = document.getElementById("lista-ordenada");

// Adicionando conteúdo textual aos elementos h1 e a
titulo.innerText = "Título da Página";
link.innerText = "Visite o site Proz Educação";

// Adicionando itens à lista não ordenada
listaNaoOrdenada.innerHTML = "<li>Item 1</li><li>Item 2</li><li>Item 3</li>";

// Adicionando itens à lista ordenada com links
listaOrdenada.innerHTML = "<li><a href='https://www.site1.com'>Link 1</a></li><li><a href='https://www.site2.com'>Link 2</a></li><li><a href='https://www.site3.com'>Link 3</a></li>";
