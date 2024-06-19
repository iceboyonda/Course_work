# beb
## Типовые запросы:
**1-Извлечь все записи из таблицы client и список их покупок, также общую сумму потраченных на покупки денег**
``` sql 
SELECT 
    c.id AS ClientID,
    c.name AS ClientName,
    c.surname AS ClientSurname,
    c.number AS PhoneNumber,
    COUNT(s.id) AS TotalPurchases,
    COALESCE(SUM(s.sum), 0) AS TotalSpent
FROM 
    client c
LEFT JOIN 
    sell s ON c.id = s.client_id
GROUP BY 
    c.id, c.name, c.surname, c.number
ORDER BY 
    TotalSpent DESC;
```
**2-Найти все продажи, сделанные конкретным менеджером за определенный период**
``` sql 
SELECT 
    s.id AS SaleID, 
    s.date AS SaleDate, 
    s.sum AS SaleAmount, 
    s.kolvo AS Quantity,
    r.firm AS RimFirm, 
    r.model AS RimModel, 
    c.name AS ClientName, 
    c.surname AS ClientSurname
FROM 
    sell s
JOIN 
    rims r ON s.rims_id = r.id
JOIN 
    client c ON s.client_id = c.id
WHERE 
    s.manager_id = 2 AND 
    s.date BETWEEN '2023-11-01 00:00:00' AND '2023-11-15 23:59:59';
``` 
**3-Получение общего количества проданных дисков по каждому типу**
``` sql 
SELECT 
    rims.firm,
    rims.model,
    SUM(sell.kolvo) AS TotalSold
FROM 
    sell
JOIN 
    rims ON sell.rims_id = rims.id
GROUP BY 
    rims.firm, rims.model
ORDER BY 
    TotalSold DESC;
``` 
**4-Получить список всех складов и количество каждого типа дисков на складе**
``` sql 
SELECT 
    st.id AS StorageID, 
    st.summa AS Quantity, 
    r.firm AS RimFirm, 
    r.model AS RimModel, 
    st.storages AS StorageName
FROM 
    storage st
JOIN 
    rims r ON st.rims_id = r.id;

SELECT 
    st.id AS StorageID, 
    st.summa AS Quantity, 
    r.firm AS RimFirm, 
    r.model AS RimModel, 
    st.storages AS StorageName
FROM 
    storage st
JOIN 
    rims r ON st.rims_id = r.id;
``` 
**5-Найти общую сумму продаж, сделанных каждым менеджером**
``` sql 
SELECT m.id AS ManagerID, m.name AS ManagerName, m.surname AS ManagerSurname, SUM(s.sum) AS TotalSales
FROM sell s
JOIN manager m ON s.manager_id = m.id
GROUP BY m.id, m.name, m.surname
ORDER BY TotalSales DESC;
``` 
## Создание ролей:
**Создание роли Менеджера и выдача ему привилегий**
``` sql 
CREATE ROLE 'manager_role';
GRANT SELECT ON mydb.client TO 'manager_role';
GRANT SELECT ON mydb.sell TO 'manager_role';
GRANT SELECT ON mydb.rims TO 'manager_role';
``` 
**Создание роли Админа и выдача ему привилегий**
``` sql 
CREATE ROLE 'storage_admin_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.storage TO 'storage_admin_role';
GRANT SELECT ON mydb.rims TO 'storage_admin_role';
``` 
## Транзакция, которая будет добавлять новую продажу и обновлять количество дисков на складе 
``` sql 

START TRANSACTION;

INSERT INTO `sell` (`date`, `sum`, `kolvo`, `rims_id`, `manager_id`, `client_id`)
VALUES ('2024-06-18 10:00:00', 1800.00, '2', 1, 3, 18);

SET @new_sale_id = LAST_INSERT_ID();

UPDATE `storage`
SET `summa` = `summa` - 2
WHERE `rims_id` = 1 AND `storages` = 'Склад A';

COMMIT;

ROLLBACK;
``` 
## Код для запуска Хранимой процедуры:
``` sql 
CALL ProcessSalesByManagerAndDateRange(2, '2023-10-25 00:00:00', '2023-10-29 23:59:59');
``` 
> 2-Айди айди менеджера, '2023-10-25 00:00:00', '2023-10-29 23:59:59' временной промежуток, в котором смотрим продажи
