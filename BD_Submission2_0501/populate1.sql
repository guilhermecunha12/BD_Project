PRAGMA foreign_keys = ON;

/* Os comentários presentes neste ficheiro serviram para guiar a ferramenta de IA usada para inserir corretamente os dados. */

/*Já está completo, não alterar esta tabela*/
INSERT INTO DiaFestival VALUES
(1, 20250627150000, 20250628030000),
(2, 20250628150000, 20250629030000),
(3, 20250629150000, 20250630030000);

/*Já está completo, não alterar esta tabela*/
INSERT INTO Espetaculo VALUES
(1, 'Ramp',20250627160000,20250627164000,1),
(2, 'Death Angel',20250627164500,20250627173000,1),
(3, 'Municipal Waste',20250627180000,20250627185000,1),
(4, 'Triptykon',20250627193000,20250627204000,1),
(5, 'Judas Priest',20250627213500,20250627230000,1),
(6, 'Bizarra Locomotiva',20250628155000,20250628163000,2),
(7, 'Seven Hours After Violet',20250628164000,20250628172500,2),
(8, 'Eagles of Death Metal',20250628173000,20250628182500,2),
(9, 'Opeth',20250628184500,20250628202000,2),
(10, 'Till Lindemann',20250628202000,20250628215000,2),
(11, 'Korn',20250628221500,20250629010000,2),
(12, 'Faemine',20250629155000,20250629163000,3),
(13, 'Gaerea',20250629164000,20250629172500,3),
(14, 'Adept',20250629173000,20250629182500,3),
(15, 'Jinjer',20250629184500,20250629202000,3),
(16, 'Falling in Reverse',20250629202000,20250629215000,3),
(17, 'Slipknot',20250629221500,20250630010000,3);

/*Cria mais 200 espectadores, com diferentes nomes, datas de nascimento, países e emails. Mas a sua despesa tem que ter em conta a tabela
Compra, a despesa de Espectador tem que ser a soma de cada valor em Compra com o seu Espectador_id correspondente. A despesa do
espectador deve ser rondar os 40€ em média, mas podem haver espectadores que não gastaram nada (raro). Esta despesa do espectador
deve corresponder com as compras (tabela Compra) feitas por esses espectador. O ano de nascimento do espectador deve rondar o ano
1995, em média (podem haver mais velhos e mais novos). O país maioritário deve ser Portugal, mas deves inserir espectadores de outros
países. */
INSERT INTO Espectador VALUES
(1,'João Leite', '1990-02-03', 'Portugal', 'johnnymilk@yahoo.com', 45),
(2, 'Guilherme Cunha', '2006-05-12', 'Portugal', 'guilhermecunha@gmail.com', 50),
(3, 'Gabriel Magalhães', '2006-03-03', 'Portugal', 'gabrielmagalhaes@gmail.com', 40),
(4, 'Pedro Pires', '2006-03-24', 'Portugal', 'pedropires@gmail.com', 40),
(5, 'Pedro Teixeira', '2006-03-06', 'Portugal', 'pedroteixeira@gmail.com', 30),
(6, 'Carlos Duarte', '1988-03-15', 'Portugal', 'cduarte88@mail.com', 32),
(7, 'Marta Ribeiro', '1992-07-22', 'Portugal', 'marta.ribeiro@gmail.com', 89),
(8, 'Pedro Cunha', '2006-10-12', 'Portugal', 'pedrocunha2006@gmail.com', 50),
(9, 'João Pacheco', '1985-11-09', 'Portugal', 'jpacheco85@outlook.com', 10),
(10, 'William Price', '1999-10-12', 'England', 'williamprice@outlook.com', 87),
(11, 'Mário Pinto', '2005-11-18', 'Portugal', 'mariopinto@gmail.com', 41),
(12, 'Sofia Marques', '1991-01-05', 'Portugal', 'sofiamarq@hotmail.com', 43),
(13, 'Ricardo Lopes', '1980-06-30', 'Portugal', 'ricardolopes80@mail.pt', 6),
(14, 'Ana Silva', '1995-12-17', 'Portugal', 'asilva95@gmail.com', 90),
(15, 'Gustav Johansson', '2001-01-17', 'Suécia', 'gustavvv103@gmail.com', 32),
(16, 'Pedro Moreira', '1987-09-08', 'Portugal', 'p.moreira87@email.com', 15),
(17, 'Inês Fernandes', '1993-04-19', 'Portugal', 'inesfernandes93@mail.com', 46),
(18, 'José Santos', '1984-10-25', 'Portugal', 'jsantos84@live.pt', 14),
(19, 'Cláudia Matos', '1990-08-14', 'Portugal', 'claudiamatos90@gmail.com', 19),
(20, 'Miguel Costa', '1986-05-02', 'Portugal', 'miguelcosta86@mail.com', 27),
(21, 'Beatriz Oliveira', '1994-02-27', 'Portugal', 'beatriz.oliv@gmail.com', 9);

/*Espetaculo que um Espectador viu, obviamente dependendo do tipo de bilhete que cada Espectador tem. Se tem bilhete diário,
apenas poder ver os espetáculos de um dia do festival, se tem bilhete dois dias pode assistir aos espetáculo entre [1,11], por fim se tiver
bilhete geral, pode assistir a qualquer espetáculo*/
INSERT INTO Assiste VALUES
(1,1),(2,1),(3,1),(5,1);

/*Já está completo, não alterar esta tabela*/
INSERT INTO Banda VALUES
(1,'Ramp','Portugal','Trash Metal',3000),
(2,'Death Angel','Estados Unidos','Trash Metal',20000),
(3,'Municipal Waste','Estados Unidos','Trash Metal',25000),
(4,'Triptykon','Suiça','Doom Metal',37000),
(5,'Judas Priest','Inglaterra','Heavy Metal',500000),
(6,'Bizarra Locomotiva','Portugal','Industrial Metal',8000),
(7,'Seven Hours After Violet','Estados Unidos','Metalcore',25000),
(8,'Eagles of Death Metal','Estadoa Unidos','Alternative Rock',60000),
(9,'Opeth','Suécia','Progressive Metal',20000),
(10,'Till Lindemann','Alemanha','Industrial Metal',150000),
(11,'Korn','Estados Unidos','Nu Metal',500000),
(12,'Faemine','Portugal','Metalcore',30000),
(13,'Gaerea','Portugal','Black Metal',8000),
(14,'Adept','Suécia','Metalcore',15000),
(15,'Jinjer','Ucránia','Progressive Metal',50000),
(16,'Falling in Reverse','Estados Unidos','Metalcore',200000),
(17,'Slipknot','Estados Unidos','Nu Metal',800000);

/*Insere 10 estabelecimentos. Só existe um palco, só precisas inserir mais estabelecimentos.*/
INSERT INTO Local VALUES
(1,'Palco'),
(2,'Estabelecimento'),
(3,'Estabelecimento');

/*Cria mais staffs, criando novos NIFS, IBANS, verfica as restrições de tipo. O tipo só ser daqueles que estão no ficheiro create2.sql
O local_id tem que estar devidamente associado a um local já existente*/
INSERT INTO Staff VALUES
(1,'482917354','PT50999900000048291735401','Seguranca',400,1);

/*Cria mais 10 estabelecimentos,pode ser Restauracao ou Merch, tendo em conta as foreign keys com o id do Local*/
INSERT INTO Estabelecimento VALUES
(2,'Kebab Tourbillon', 'Restauracao', 4312, 2000),
(3,'Unkind','Merch',23124,3000);

/*Já está completo, não alterar a tabela*/
INSERT INTO Palco VALUES
(1,'Palco EviLLive');

/* Não insiras tuplos nesta tabela, não alterar esta tabela*/
INSERT INTO Concerto VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,1),
(17,17,1);

/*Insere tuplos nesta tabela, tal que o seu id seja diferente de um id em BilheteDoisDias e BilheteGeral.
a terceira coluna deve corresponder a um id de um espectador existente na tabela Espectador, tal que cada
espectador só pode ter um BilheteDiario, BilheteDoisDias e BilheteGeral. Todos os espectadores devem ter um
e um só bilhete, pelo que a soma dos tuplos das tabelas BilheteDiario, BilheteDoisDias e BilheteGeral tem
de ser igual ao número de tuplos da tabela Espectador. A segunda coluna deve ser ou 69 ou 79, dependendo das
restrições presentes no ficheiro create2.sql enviado. A quarta coluna deve ser 1, 2 ou 3.*/
INSERT INTO BilheteDiario VALUES
(3, 69, 1, 1),
(4, 79, 5, 2),
(8, 79, 8, 2),
(10, 79, 10, 2),
(15, 69, 11, 1),
(20, 69, 15, 1);

/*Insere tuplos nesta tabela, tal que o seu id seja diferente de um id em BilheteDiario e BilheteGeral.
a terceira coluna deve corresponder a um id de um espectador existente na tabela Espectador, tal que cada
espectador só pode ter um BilheteDiario, BilheteDoisDias e BilheteGeral. A segunda coluna tem de ter o valor 139.
Todos os espectadores devem ter um e um só bilhete, pelo que a soma dos tuplos das tabelas BilheteDiario, 
BilheteDoisDias e BilheteGeral tem de ser igual ao número de tuplos da tabela Espectador.  */
INSERT INTO BilheteDoisDias VALUES
(2, 139, 2),
(5, 139, 3),
(7, 139, 7),
(9, 139, 12),
(11, 139, 13),
(13, 139, 16);

/*Insere tuplos nesta tabela, tal que o seu id seja diferente de um id em BilheteDiario e BilheteDoisDias.
a terceira coluna deve corresponder a um id de um espectador existente na tabela Espectador, tal que cada
espectador só pode ter um BilheteDiario, BilheteDoisDias e BilheteGeral. A segunda coluna tem de ter o valor 159 ou 169.
Todos os espectadores devem ter um e um só bilhete, pelo que a soma dos tuplos das tabelas BilheteDiario, 
BilheteDoisDias e BilheteGeral tem de ser igual ao número de tuplos da tabela Espectador. */
INSERT INTO BilheteGeral VALUES
(1, 169, 4),
(6, 169, 6),
(12, 159, 9),
(14, 169, 14),
(16, 169, 17),
(17, 159, 18),
(18, 169, 19),
(19, 169, 20),
(20, 159, 21);

/*Insere tuplos nesta tabela, tal que cada BilheteDoisDias tenha dois dias do festival associados. Todos os BilheteDoisDias (segunda coluna) 
devem ter dois DiaFestival válidos (entre 1 e 3) (primeira coluna) associados, sem exceção. Os ids dos BilhetesDoisDias têm de ser
consistentes com os ids dos tuplos de BilheteDoisDias existentes. */
INSERT INTO DiaDoBilheteDoisDias VALUES
(2,2),(3,2),
(2,5),(3,5),
(2,7),(3,7),
(2,9),(3,9),
(1,11),(2,11),
(1,13),(2,13);

/*Insere tuplos nesta tabela, tal que cada BilheteGeral tenha os três dias do festival associados. Todos os BilheteGeral (segunda coluna)
devem ter os três DiaFestival válidos (entre 1 e 3) (primeira coluna) associados, sem exceção.  Os ids dos BilheteGeral têm de ser
consistentes com os ids dos tuplos de BilheteGeral existentes. */
INSERT INTO DiaDoBilheteGeral VALUES
(1,1),(2,1),(3,1),
(1,6),(2,6),(3,6),
(1,12),(2,12),(3,12),
(1,14),(2,14),(3,14),
(1,16),(2,16),(3,16),
(1,17),(2,17),(3,17),
(1,18),(2,18),(3,18),
(1,19),(2,19),(3,19),
(1,20),(2,20),(3,20);

/*
O último valor do tuplo deve corresponder a um ID do estabelecimento 
válido (existente nos tuplos da classe estabelecimento (adiciona cerca de 10 patrocinadores distintos)
Um patrocinador patrocina apenas um estabelecimento mas um estabelecimento pode ter vários patrocinadores (torna isso consistente)
Se possível os valores da contribuição devem ser o mais realistas possível 
*/
INSERT INTO Patrocinador VALUES
(1, 'San Miguel', 1000000, 2),
(2, 'Unkind', 200000, 3);

/*
Banda id deve se consistente com o tipo de artigo: 
se for um artigo de merch (camisola, porta-chave, CD, Vinil, etc..) colocar o ID da banda correspondente
(tem de ser uma banda válida que atue no festival - presente na tabela Banda)
se não o último valor do tuplo é NULL (adiciona  20 artigos de banda e 20 artigos de consumo (bebidas e comida) - aproximadamente)
*/
INSERT INTO Artigo VALUES
(123, 'Cerveja 33cl', 'bebida', 4, 1, NULL),
(124, 'Camisola Slipknot', 'merch', 29, 5, 17);

/*
O Espectador_id e o Estabelecimento_id têm de ser consistentes 
com os tuplos já existentes nas relações Espectador e Estabelecimento,
respetivamente (cerca de 500 compras distintas)
Respeita os triggers em comentário referentes a esta secção no modelo sql. 
Todas as compras devem referenciar um espectador existente. No entanto, podem
haver espectadores que não tenham feito nenhuma compra (raro).
*/
INSERT INTO Compra VALUES
(1, 16, 1, 2, 20250627160328),
(2, 29, 1, 3, 20250627184210);

/*
O código do artigo e o id da compra têm de ser consistentes com tuplos das relações Artigo e Compra
(Para cada ID da compra o valor tem de ser consistente com o valor na tabela compra:
por exemplo: se alguém gasta 16 euros em cerveja, então nesta tabela o id da compra deve ser o mesmo, o código do artigo tem de
ser consistente com o do produto e a soma total dos tuplos de cada compra artigo devem ser consistentes com cada compra
4 cervejas a 4 euros cada por exemplo)
Respeita os triggers em comentário referentes a esta secção no modelo sql. 
*/
INSERT INTO ArtigoNumaCompra VALUES
(123, 1, 4, 4),
(124, 2, 1, 29);

/*
Tendo em conta as restrições impostas na relação Fluxo monetário verifica corretamente as restrições existentes no modelo SQL
(o valor do montante tem de ser consistente com o valor da classe que está a referenciar. Os ids/codigos das foreign keys devem
corresponder aos ids/codigos dos tuplos nas tabelas referenciadas por esta tabela.
Vê as restrições e comentários do modelo SQL) 
Respeita os triggers em comentário referentes a esta secção no modelo sql. 
*/
INSERT INTO FluxoMonetario VALUES
(1, 169, 'receita', NULL, 1 , NULL, NULL, NULL, NULL, NULL),
(2, 3000, 'despesa', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2000, 'despesa', NULL, NULL, NULL, NULL, NULL, 2, NULL),
(4, 400, 'despesa', NULL, NULL, NULL, NULL, 1, NULL, NULL);