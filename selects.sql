-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

    SELECT 
      pe.id,
      pe.status,
      pe.cliente_id,
      pr.id,
      pr.nome,
      pr.tipo,
      pr.preco,
      pr.pts_de_lealdade
    FROM 
      pedidos pe
    JOIN
      produtos_pedidos pp ON pe.id = pp.pedido_id 
    JOIN
      produtos pr ON pp.produto_id = pr.id;

-- 2)

    SELECT 
      pe.id 
    FROM 
      pedidos pe
    JOIN
      produtos_pedidos pp ON pe.id = pp.pedido_id
    JOIN
      produtos pr ON pp.produto_id = pr.id
    WHERE 
      pr.nome ILIKE '%fritas%';

-- 3)

    SELECT 
      cl.nome AS gostam_de_fritas
    FROM 
      clientes cl
    JOIN 
      pedidos pe ON cl.id = pe.cliente_id
    JOIN
      produtos_pedidos pp ON pe.id = pp.pedido_id
    JOIN 
      produtos pr ON pp.produto_id = pr.id
    WHERE
      pr.nome ILIKE '%fritas%';

-- 4)

    SELECT
      sum(pr.preco) AS sum
    FROM 
      clientes cl
    JOIN 
      pedidos pe ON cl.id = pe.cliente_id
    JOIN
      produtos_pedidos pp ON pe.id = pp.pedido_id
    JOIN 
      produtos pr ON pp.produto_id = pr.id
    WHERE
      cl.nome ILIKE '%laura%';

-- 5)

    SELECT 	
      nome,
      COUNT(nome)
    FROM 
      produtos pr
    JOIN
      produtos_pedidos pp ON pr.id = pp.produto_id
    GROUP BY 
      nome;