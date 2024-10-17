#LISTAR TODOS OS CLIENTES QUE NAO TENHAM REALIZADO UMA COMPRA

SELECT CUSTOMER_ID
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT EXISTS (SELECT CUSTOMER_ID FROM ORDERS)

#verifiquei se o customer id existe na orders, se nao existir, retorna no select

#############################################################


#Listar os produtos que nao tenham sido comprados

SELECT PRODUCT_ID
FROM PRODUCTS
WHERE PRODUCT_ID NOT EXISTS (SELECT PRODUCT_ID FROM ORDER_ITEMS)

verifiquei se o product id existe na order_items, se nao existir significa que nao foi comprador, entao retorna no select

#############################################################

#listar os produtos sem estoque

SELECT P.PRODUCT_ID, P.PRODUCT_NAME, S.QUANTITY
FROM PRODUCTS P JOIN STOCKS S ON P.PRODUCT_ID=S.PRODUCT_ID
WHERE S.QUANTITY = 0

#fiz o join entre product e stocks baseado no product_id e trouxe os produtos que tem quantidade = 0 (sem estoque).

#############################################################

#Agrupar a quantidade de vendas que uma determinada Marca por Loja


SELECT S.STORE_ID, B.BRAND_ID, COUNT(DISTINCT O.ORDER_ID) AS TOTAL_VENDAS
FROM ORDERS O
LEFT JOIN ORDER_ITEMS OI ON O.ORDER_ID=OI.ORDER_ID
LEFT JOIN STORES S ON O.STORE_ID=S.STORE_ID
LEFT JOIN PRODUCTS P ON OI.PRODUCT_ID=P.PRODUCT_ID
LEFT JOIN BRANDS B ON P.BRAND_ID=B.BRAND_ID 
GROUP BY 1,2

#join entre order e order items com order_id
#join entre orders e stores com store_id
#join entre order_items e products com product_id para chegar na brands com o join entre products e brands com brand_id
fazendo o count distinto de numero de order_id para saber o total de vendas (pedidos) de determinada marca em determinada Loja
#utilizando o group by store_id e brand_id

###############################################################


#Listar os funcionarios que nao estejam relacionados a um pedido

SELECT STAFF_ID, FIRST_NAME
FROM STAFFS
WHERE STAFF_ID NOT EXISTS (SELECT STAFF_ID FROM ORDERS)

#checa se o staff id exista na orders, se nao existir, retorna o staff id e first_name do funcionario
