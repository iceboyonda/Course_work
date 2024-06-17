# beb
Типовые запросы:
1-Извлечь все записи из таблицы client и список их покупок, также общую сумму потраченных на покупки денег
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
2-Найти все продажи, сделанные конкретным менеджером за определенный период
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
3-Получить информацию о продаже и ее клиенте
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
    s.id = 3;
4-Получить список всех складов и количество каждого типа дисков на складе
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
5-Найти общую сумму продаж, сделанных каждым менеджером
SELECT m.id AS ManagerID, m.name AS ManagerName, m.surname AS ManagerSurname, SUM(s.sum) AS TotalSales
FROM sell s
JOIN manager m ON s.manager_id = m.id
GROUP BY m.id, m.name, m.surname
ORDER BY TotalSales DESC;
Создние роли Менеджера и выдача ему привилегий
CREATE ROLE 'manager_role';
GRANT SELECT ON mydb.client TO 'manager_role';
GRANT SELECT ON mydb.sell TO 'manager_role';
GRANT SELECT ON mydb.rims TO 'manager_role';

Создание роли Админа и выдача ему привилегий

CREATE ROLE 'storage_admin_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.storage TO 'storage_admin_role';
GRANT SELECT ON mydb.rims TO 'storage_admin_role';
Транзакция, которая будет добавлять новую продажу и обновлять количество дисков на складе 
-- Начинаем транзакцию
START TRANSACTION;

-- Вставляем новую продажу
INSERT INTO `sell` (`date`, `sum`, `kolvo`, `rims_id`, `manager_id`, `client_id`)
VALUES ('2024-06-18 10:00:00', 1800.00, '2', 1, 3, 18);

-- Получаем ID новой продажи
SET @new_sale_id = LAST_INSERT_ID();

-- Обновляем количество дисков на складе
UPDATE `storage`
SET `summa` = `summa` - 2
WHERE `rims_id` = 1 AND `storages` = 'Склад A';

-- Фиксируем изменения, если все операции успешно выполнены
COMMIT;

-- В случае ошибки откатываем изменения
ROLLBACK;

Хранимая процедура, которая получает все продажи из таблицы sell, совершенные определенным менеджером, в определенный временой диапазон
CREATE PROCEDURE GetSalesByManagerAndDateRange (
    IN managerID INT,
    IN startDate DATETIME,
    IN endDate DATETIME
)
BEGIN
    SELECT 
        s.id AS SaleID,
        s.date AS SaleDate,
        s.sum AS SaleAmount,
        s.kolvo AS Quantity,
        r.firm AS RimFirm,
        r.model AS RimModel,
        c.name AS ClientName,
        c.surname AS ClientSurname,
        m.name AS ManagerName,
        m.surname AS ManagerSurname
    FROM 
        sell s
    INNER JOIN 
        rims r ON s.rims_id = r.id
    INNER JOIN 
        client c ON s.client_id = c.id
    INNER JOIN 
        manager m ON s.manager_id = m.id
    WHERE 
        s.manager_id = managerID AND
        s.date BETWEEN startDate AND endDate
    ORDER BY 
        s.date;
END$$

Код для запуска Хранимой процедуры: CALL ProcessSalesByManagerAndDateRange(2, '2023-10-25 00:00:00', '2023-10-29 23:59:59'); > 2-Айди айди менеджера, '2023-10-25 00:00:00', '2023-10-29 23:59:59' временной промежуток, в котором смотрим продажи
