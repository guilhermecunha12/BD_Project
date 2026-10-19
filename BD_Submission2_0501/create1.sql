DROP TABLE IF EXISTS DiaFestival;
DROP TABLE IF EXISTS Espetaculo;
DROP TABLE IF EXISTS Espectador;
DROP TABLE IF EXISTS EspetaculoEspectador;
DROP TABLE IF EXISTS Banda;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS Estabelecimento;
DROP TABLE IF EXISTS Palco;
DROP TABLE IF EXISTS EspetaculoBandaPalco;
DROP TABLE IF EXISTS BilheteDiario;
DROP TABLE IF EXISTS BilheteDoisDias;
DROP TABLE IF EXISTS DiaFestivalBilheteDoisDias;
DROP TABLE IF EXISTS BilheteGeral;
DROP TABLE IF EXISTS DiaFestivalBilheteGeral;
DROP TABLE IF EXISTS Patrocinador;
DROP TABLE IF EXISTS Artigo;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS CompraArtigo;
DROP TABLE IF EXISTS FluxoMonetario;

CREATE TABLE DiaFestival(
    id INTEGER NOT NULL CONSTRAINT DiaFestivalInvalido CHECK (id >= 1 AND id <= 3),
    tsInicio INTEGER NOT NULL,
    tsFim INTEGER NOT NULL,

    CONSTRAINT DiaFestivalPK PRIMARY KEY (id)
);

CREATE TABLE Espetaculo(
    id INTEGER NOT NULL,
    nome TEXT,
    tsInicio INTEGER NOT NULL,
    tsFim INTEGER NOT NULL,
    DiaFestival_id INTEGER NOT NULL,

    CONSTRAINT HorarioUnique UNIQUE (tsInicio, tsFim),
    CONSTRAINT EspetaculoPK PRIMARY KEY (id),
    CONSTRAINT Espetaculo_DiaFestivalFK FOREIGN KEY (DiaFestival_id) REFERENCES DiaFestival (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Espectador(
    id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    dataNascimento TEXT NOT NULL,
    pais TEXT  NOT NULL,
    email TEXT NOT NULL,
    despesa REAL NOT NULL CONSTRAINT DespesaInvalida CHECK (despesa >= 0),

    CONSTRAINT EspectadorPK PRIMARY KEY (id),
    CONSTRAINT EmailUnique UNIQUE (email)
);

CREATE TABLE EspetaculoEspectador(
    Espetaculo_id INTEGER,
    Espectador_id INTEGER,

    CONSTRAINT EspetaculoEspectadorPK PRIMARY KEY (Espetaculo_id, Espectador_id),
    CONSTRAINT EspetaculoEspectador_EspetaculoFK FOREIGN KEY (Espetaculo_id) REFERENCES Espetaculo (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EspetaculoEspectador_EspectadorFK FOREIGN KEY (Espectador_id) REFERENCES Espectador (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Banda(
    id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL,
    genero TEXT NOT NULL,
    cache REAL NOT NULL CONSTRAINT CacheInvalido CHECK (cache >= 0),

    CONSTRAINT BandaPK PRIMARY KEY (id)
);

CREATE TABLE Pagamento(
    id INTEGER NOT NULL,
    numeroHoras REAL NOT NULL CONSTRAINT NumeroHorasInvalido CHECK (numeroHoras >= 0),
    precoHora REAL NOT NULL CONSTRAINT PrecoHoraInvalido CHECK (precoHora >= 0),
    montante REAL NOT NULL CONSTRAINT PagamentoInvalido CHECK (montante = numeroHoras * precoHora), 

    CONSTRAINT PagamentoPK PRIMARY KEY(id)
);

CREATE TABLE Staff(
    id INTEGER NOT NULL,
    NIF INTEGER NOT NULL,
    IBAN TEXT NOT NULL,
    tipo TEXT NOT NULL CONSTRAINT TipoInvalido CHECK (tipo = 'Geral' or tipo = 'Seguranca' or tipo = 'Socorrista' or tipo = 'Tecnico especializado'),
    Pagamento_id INTEGER NOT NULL,
    Local_id INTEGER NOT NULL,

    CONSTRAINT StaffPK PRIMARY KEY (id),
    CONSTRAINT Staff_PagamentoFK FOREIGN KEY (Pagamento_id) REFERENCES Pagamento (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Staff_LocalFK FOREIGN KEY (Local_id) REFERENCES Local (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT NIFUnique UNIQUE (NIF),
    CONSTRAINT IBANUnique UNIQUE (IBAN)
);

CREATE TABLE Local(
    id INTEGER NOT NULL,
    tipo TEXT NOT NULL CONSTRAINT TipoInvalido CHECK (tipo = 'Estabelecimento' OR tipo = 'Palco'),

    CONSTRAINT LocalPK PRIMARY KEY (id)
);

CREATE TABLE Estabelecimento (
    Local_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,
    receita REAL NOT NULL CONSTRAINT ReceitaInvalida CHECK (receita >= 0),
    aluguer REAL NOT NULL CONSTRAINT AluguerInvalido CHECK (aluguer > 0),

    CONSTRAINT EstabelecimentoPK PRIMARY KEY (Local_id),
    CONSTRAINT Estabelecimento_LocalFK FOREIGN KEY (Local_id) REFERENCES Local (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Palco (
    Local_id INTEGER NOT NULL,
    nome TEXT NOT NULL,

    CONSTRAINT PalcoPK PRIMARY KEY (Local_id),
    CONSTRAINT Palco_LocalFK FOREIGN KEY (Local_id) REFERENCES Local (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EspetaculoBandaPalco (
    Espetaculo_id INTEGER NOT NULL,
    Banda_id INTEGER NOT NULL,
    Palco_id INTEGER NOT NULL,

    CONSTRAINT EspetaculoBandaPalcoPK PRIMARY KEY (Espetaculo_id, Banda_id, Palco_id),
    CONSTRAINT EspetaculoBandaPalco_EspetaculoFK FOREIGN KEY (Espetaculo_id) REFERENCES Espetaculo (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EspetaculoBandaPalco_BandaFK FOREIGN KEY (Banda_id) REFERENCES Banda (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EspetaculoBandaPalco_PalcoFK FOREIGN KEY (Palco_id) REFERENCES Palco (Local_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE BilheteDiario (
    codigo INTEGER NOT NULL,
    preco REAL NOT NULL CONSTRAINT PrecoInvalido CHECK (preco > 0),
    Espectador_id INTEGER NOT NULL,
    DiaFestival_id INTEGER NOT NULL,

    CONSTRAINT BilheteDiarioPK PRIMARY KEY (codigo),
    CONSTRAINT BilheteDiario_EspectadorFK FOREIGN KEY (Espectador_id) REFERENCES Espectador (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT BilheteDiario_DiaFestivalFK FOREIGN KEY (DiaFestival_id) REFERENCES DiaFestival (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BilheteDoisDias (
    codigo INTEGER NOT NULL,
    preco REAL NOT NULL CONSTRAINT PrecoInvalido CHECK (preco > 0),
    Espectador_id INTEGER NOT NULL,

    CONSTRAINT BilheteDoisDiasPK PRIMARY KEY (codigo),
    CONSTRAINT BilheteDoisDias_EspectadorFK FOREIGN KEY (Espectador_id) REFERENCES Espectador (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DiaFestivalBilheteDoisDias (
    DiaFestival_id INTEGER NOT NULL,
    BilheteDoisDias_codigo INTEGER,

    CONSTRAINT DiaFestivalBilheteDoisDiasPK PRIMARY KEY (DiaFestival_id, BilheteDoisDias_codigo),
    CONSTRAINT DiaFestivalBilheteDoisDias_DiaFestivalFK FOREIGN KEY (DiaFestival_id) REFERENCES DiaFestival (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT DiaFestivalBilheteDoisDias_BilheteDoisDiasFK FOREIGN KEY (BilheteDoisDias_codigo) REFERENCES BilheteDoisDias (codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BilheteGeral (
    codigo INTEGER NOT NULL,
    preco REAL NOT NULL CONSTRAINT PrecoInvalido CHECK (preco > 0),
    Espectador_id INTEGER NOT NULL,

    CONSTRAINT BilheteGeralPK PRIMARY KEY (codigo),
    CONSTRAINT BilheteGeral_EspectadorFK FOREIGN KEY (Espectador_id) REFERENCES Espectador (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE DiaFestivalBilheteGeral(
    DiaFestival_id INTEGER NOT NULL,
    BilheteGeral_codigo INTEGER,

    CONSTRAINT DiaFestivalBilheteGeralPK PRIMARY KEY (DiaFestival_id, BilheteGeral_codigo),
    CONSTRAINT DiaFestivalBilheteGeral_DiaFestivalFK FOREIGN KEY (DiaFestival_id) REFERENCES DiaFestival (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT DiaFestivalBilheteGeral_BilheteGeralFK FOREIGN KEY (BilheteGeral_codigo) REFERENCES BilheteGeral (codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Patrocinador(
    id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    contribuicao REAL NOT NULL CONSTRAINT ContribuicaoInvalida CHECK(contribuicao >= 0),
    Estabelecimento_id INTEGER NOT NULL,

    CONSTRAINT PatrocinadorPK PRIMARY KEY (id),
    CONSTRAINT Patrocinador_EstabelecimentoFK FOREIGN KEY (Estabelecimento_id) REFERENCES Estabelecimento(Local_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Artigo (
    codigo INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    tipo TEXT NOT NULL CONSTRAINT TipoInvalido CHECK (tipo = 'comida' OR tipo = 'bebida' OR tipo = 'merch'),
    precoAtual REAL NOT NULL CONSTRAINT PrecoArtigoInvalido CHECK(precoAtual > 0),
    custoObtencao REAL NOT NULL CONSTRAINT CustoObtencaoInvalido CHECK(custoObtencao > 0),
    Banda_id INTEGER,

    CONSTRAINT ArtigoPK PRIMARY KEY (codigo),
    CONSTRAINT Artigo_BandaFK FOREIGN KEY (Banda_id) REFERENCES Banda(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Compra (
    id INTEGER NOT NULL,
    valor REAL NOT NULL CONSTRAINT ValorCompraInvalido CHECK(valor > 0),
    Espectador_id INTEGER NOT NULL,
    Estabelecimento_id INTEGER NOT NULL,
    tsCompra INTEGER NOT NULL,

    CONSTRAINT CompraPK PRIMARY KEY (id),
    CONSTRAINT Compra_EspectadorFK FOREIGN KEY (Espectador_id) REFERENCES Espectador(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Compra_EstabelecimentoFK FOREIGN KEY (Estabelecimento_id) REFERENCES Estabelecimento(Local_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CompraArtigo(
    Artigo_codigo INTEGER NOT NULL, 
    Compra_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CONSTRAINT QuantidadeArtigoInvalida CHECK(quantidade > 0),
    precoUnitario REAL NOT NULL CONSTRAINT PrecoUnitarioInvalido CHECK(precoUnitario > 0),

    CONSTRAINT CompraArtigoPK PRIMARY KEY (Artigo_codigo, Compra_id),
    CONSTRAINT CompraArtigo_ArtigoFK FOREIGN KEY (Artigo_codigo) REFERENCES Artigo(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CompraArtigo_CompraFK FOREIGN KEY (Compra_id) REFERENCES Compra(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FluxoMonetario(
  id INTEGER NOT NULL,
  montante REAL NOT NULL CONSTRAINT MontanteInvalido CHECK (montante > 0),
  direcao TEXT NOT NULL CONSTRAINT DirecaoInvalida CHECK(direcao = 'receita' OR direcao = 'despesa'),
  Banda_id INTEGER,
  BilheteGeral_codigo INTEGER,
  BilheteDoisDias_codigo INTEGER,
  BilheteDiario_codigo INTEGER,
  Staff_id INTEGER,
  Estabelecimento_id INTEGER,
  Patrocinador_id INTEGER,

  PRIMARY KEY(id),

  CONSTRAINT ApenasUmaFKNotNull CHECK (
    (Banda_id IS NOT NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NOT NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NOT NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NOT NULL AND Staff_id IS NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NOT NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NULL AND Estabelecimento_id IS NOT NULL AND Patrocinador_id IS NULL) OR
    (Banda_id IS NULL AND BilheteGeral_codigo IS NULL AND BilheteDoisDias_codigo IS NULL AND BilheteDiario_codigo IS NULL AND Staff_id IS NULL AND Estabelecimento_id IS NULL AND Patrocinador_id IS NOT NULL)
  ),

  CONSTRAINT Fluxo_BandaFK FOREIGN KEY (Banda_id) REFERENCES Banda(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_BilheteGeralFK FOREIGN KEY (BilheteGeral_codigo) REFERENCES BilheteGeral(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_BilheteDoisDiasFK FOREIGN KEY (BilheteDoisDias_codigo) REFERENCES BilheteDoisDias(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_BilheteDiarioFK FOREIGN KEY (BilheteDiario_codigo) REFERENCES BilheteDiario(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_StaffFK FOREIGN KEY (Staff_id) REFERENCES Staff(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_EstabelecimentoFK FOREIGN KEY (Estabelecimento_id) REFERENCES Estabelecimento(Local_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Fluxo_PatrocinadorFK FOREIGN KEY (Patrocinador_id) REFERENCES Patrocinador(id) ON DELETE CASCADE ON UPDATE CASCADE
);