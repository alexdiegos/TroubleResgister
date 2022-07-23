# Projeto de Desenvolvimento Nativo para iOS (Atividade 3)

## Curso: Pós-Graduação em Desenvolvimento Mobile
## Disciplina: Desenvolvimento Nativo para iOS
## Aluno: Alexandre Diego Santos Silva
## Sala: 185835

A proposta é um aplicativo onde o usuário poderá registrar qualquer problema que ele avistar em seu bairro ou em sua cidade. Encontrou um semáforo com defeito? Uma placa de trânsito quebrada? Buraco na rua ou na calçada? Lixeira danificada? Abra o app e registre esse problema (com foto, localização e demais informações) para que posteriormente você possa entrar em contato com o órgão responsável.

1. O aplicativo terá 3 telas: Listagem, Exibição e Edição/Criação;
2. A tela inicial será a tela de Listagem, uma TableViewController onde serão listados todos os problemas registrados pelo usuário. Nesta lista deverá aparecer o nome e a data do problema registrado;
3. A navegação entre as telas será feita via NavigationController;
4. A partir da tela inicial o usuário poderá criar um novo registro (clicando em algum botão presente) ou selecionar um dos registros listados;
5. Ele também poderá excluir um registro utilizando o gesto de Swipe;
6. Ao selecionar um registro, ele será levado para a tela de Exibição, onde serão apresentados todos os dados do mesmo, que são:
	
	a. Nome
	
	b. Localização (endereço)
	
	c. Foto
	
	d. Descrição

Segue abaixo um exemplo:
	- Nome: Buraco calçada
	- Endereço: Av. Lins de Vasconcelos 3100, Aclimação, São Paulo – SP
	- Descrição: Este buraco de aproximadamente 80 cm de diâmetro, encontrado na calçada direita (sentido centro) em frente ao Pet Shop da Lins, está atrapalhando a circulação de pedestres que por muitas vezes acabam tendo que invadir a pista correndo risco de atropelamento.

7. A partir dessa tela, ele poderá voltar para a tela de Listagem ou ir para a tela de Edição/Criação;
8. A tela de Edição/Criação servirá tanto para a edição de um novo registro (alteração dos seus dados) quanto para a criação de um novo. Se ela for acessada a partir do botão de criação na tela Listagem, ela entrará no modo "Criação". Caso seja acessada pela tela de Exibição, entrará no modo "Edição";
9. Os dados deverão ser armazenados utilizando Core Data;