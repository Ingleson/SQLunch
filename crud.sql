-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

    INSERT INTO clientes 
      (nome, lealdade)
    VALUES 
      ('Georgia', 0);

-- 2)

    INSERT INTO pedidos 
      (status, cliente_id)
    VALUES 
      ('Recebido', 6);

-- 3)

    INSERT INTO produtos_pedidos
      (pedido_id, produto_id)
    VALUES 
      (6, 1),
      (6, 2),
      (6, 6),
      (6, 8),
      (6, 8);

-- Leitura

-- 1)

    SELECT 
      cl.id,
      cl.nome,
      cl.lealdade,
      pe.id,
      pe.status,
      pe.cliente_id,
      pr.id,
      pr.nome,
      pr.tipo,
      pr.preco,
      pr.pts_de_lealdade 
    FROM 
      clientes cl
    JOIN
      pedidos pe ON cl.id = pe.cliente_id
    JOIN 
      produtos_pedidos pp ON pe.id = pp.pedido_id
    JOIN
      produtos pr ON pp.produto_id = pr.id
    WHERE 
      cl.nome ILIKE '%georgia%';

-- Atualização

-- 1)

    UPDATE 
      clientes 
    SET
      lealdade = 48
    WHERE 
      nome = 'Georgia';

-- Deleção

-- 1)

    DELETE FROM 
      clientes
    WHERE 
      nome = 'Marcelo';