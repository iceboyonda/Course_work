# beb
![вфвффвфв](https://github.com/iceboyonda/Course_work/assets/120388523/43fd7eac-ef16-40c8-935c-30ad0f4355fa)
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
**2-Информация о дисках на складе**
``` sql 
SELECT 
    rims.id AS RimID,
    rims.firm AS RimFirm,
    rims.model AS RimModel,
    storage.summa AS QuantityInStock,
    storage.storages AS StorageLocation
FROM 
    rims
JOIN 
    storage ON rims.id = storage.rims_id
ORDER BY 
    rims.firm, rims.model;

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
## Код для запуска первой Хранимой процедуры:
``` sql 
CALL ProcessSalesByManagerAndDateRange(2, '2023-10-25 00:00:00', '2023-10-29 23:59:59');
``` 
> 2-Айди айди менеджера, '2023-10-25 00:00:00', '2023-10-29 23:59:59' временной промежуток, в котором смотрим продажи
 ## вторая Хранимая процедура:
 ``` sql 
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewClient`(
    IN p_name VARCHAR(255),
    IN p_surname VARCHAR(255),
    IN p_number VARCHAR(13)
)
BEGIN
	DECLARE phone_number VARCHAR(13);
    
    SET phone_number = (SELECT number FROM client WHERE  number = p_number);
    IF phone_number is not NULL THEN 
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Номер телефона уже используется';
      ELSE 
        START TRANSACTION;
        
        INSERT INTO client (name, surname, number) VALUES (p_name, p_surname, p_number);
        
        COMMIT;
    END IF;
END
``` 
