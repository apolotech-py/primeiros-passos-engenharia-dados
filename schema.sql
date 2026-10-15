-- Criar tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    plano_fidelidade TEXT CHECK(plano_fidelidade IN ('Premium', 'Standard')),
    estado_origem TEXT NOT NULL
);

-- Criar tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos_vendas (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    data_pedido TEXT NOT NULL,
    valor_total REAL NOT NULL,
    status_pagamento TEXT CHECK(status_pagamento IN ('Aprovado', 'Pendente', 'Cancelado')),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserir dados na tabela clientes (10 clientes para pulverizar as vendas)
INSERT INTO clientes (id, nome, plano_fidelidade, estado_origem) VALUES
(1, 'Ana Silva', 'Premium', 'SP'),
(2, 'Bruno Gomes', 'Standard', 'RJ'),
(3, 'Carlos Souza', 'Premium', 'MG'),
(4, 'Daniela Lima', 'Standard', 'SP'),
(5, 'Eduardo Costa', 'Premium', 'RS'),
(6, 'Fernanda Alves', 'Standard', 'SC'),
(7, 'Gabriel Rocha', 'Premium', 'RJ'),
(8, 'Helena Ribeiro', 'Standard', 'BA'),
(9, 'Igor Oliveira', 'Premium', 'SP'),
(10, 'Julia Mendes', 'Standard', 'PE');

-- Inserir dados na tabela pedidos_vendas (26 registros com cenários específicos para filtros)
INSERT INTO pedidos_vendas (id, cliente_id, data_pedido, valor_total, status_pagamento) VALUES
(101, 1, '2026-10-01', 1500.00, 'Aprovado'),   -- Gasto alto / SP / Premium
(102, 1, '2026-10-05', 2300.50, 'Aprovado'),   -- Gasto alto / SP / Premium
(103, 2, '2026-10-05', 120.00, 'Pendente'),    -- Pendente / RJ
(104, 3, '2026-10-06', 450.00, 'Aprovado'),    -- MG
(105, 4, '2026-10-06', 89.90, 'Cancelado'),    -- Cancelado / SP
(106, 5, '2026-10-07', 3500.00, 'Aprovado'),   -- Gasto alto / RS / Premium
(107, 6, '2026-10-07', 210.00, 'Aprovado'),    -- SC
(108, 7, '2026-10-08', 95.00, 'Pendente'),     -- Pendente / RJ
(109, 8, '2026-10-08', 410.00, 'Aprovado'),    -- BA
(110, 9, '2026-10-09', 1250.00, 'Aprovado'),   -- SP / Premium
(111, 10, '2026-10-09', 320.00, 'Aprovado'),   -- PE
(112, 1, '2026-10-10', 85.00, 'Aprovado'),     -- SP
(113, 3, '2026-10-10', 4200.00, 'Aprovado'),   -- Gasto alto / MG / Premium
(114, 5, '2026-10-11', 150.00, 'Pendente'),    -- Pendente / RS
(115, 2, '2026-10-11', 500.00, 'Aprovado'),    -- RJ
(116, 4, '2026-10-12', 1150.00, 'Aprovado'),   -- SP
(117, 7, '2026-10-12', 2800.00, 'Aprovado'),   -- Gasto alto / RJ / Premium
(118, 6, '2026-10-12', 75.00, 'Cancelado'),    -- Cancelado
(119, 8, '2026-10-13', 1800.00, 'Pendente'),   -- Gasto alto e Pendente / BA
(120, 9, '2026-10-13', 90.00, 'Aprovado'),     -- SP
(121, 10, '2026-10-13', 60.00, 'Pendente'),    -- Pendente / PE
(122, 3, '2026-10-14', 190.00, 'Aprovado'),    -- MG
(123, 5, '2026-10-14', 5100.00, 'Aprovado'),   -- Gasto altíssimo / RS / Premium
(124, 1, '2026-10-14', 340.00, 'Pendente'),    -- Pendente / SP
(125, 2, '2026-10-14', 1250.00, 'Cancelado'),  -- Cancelado / RJ
(126, 4, '2026-10-14', 920.00, 'Aprovado');    -- SP
