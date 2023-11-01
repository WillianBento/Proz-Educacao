// Encontre o elemento com o id 'titulo' e adicione um título a ele usando innerHTML
var tituloElement = document.getElementById('titulo');
tituloElement.innerHTML = '<h1>Título do Produto</h1>';

// Encontre o elemento onde você deseja adicionar o produto e adicione o HTML do produto
var produtoContainer = document.body; // Por exemplo, adicione o produto ao corpo da página
produtoContainer.innerHTML += `
    <div class="produto">
        <h2>Nome do Produto</h2>
        <p>Descrição do Produto</p>
        <p>Preço: R$ 19.99</p>
    `;
