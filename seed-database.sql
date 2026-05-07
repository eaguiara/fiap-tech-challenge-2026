-- ============================================================
-- SCRIPT PARA POPULAR O BANCO DE DADOS - GarageFlowService
-- ============================================================
-- Este script insere dados de teste nas tabelas do banco
-- Customize conforme necessário

USE GarageFlowServiceDb;

-- ============================================================
-- DECLARAR VARIÁVEIS PARA ARMAZENAR IDs
-- ============================================================
DECLARE @CustomerId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @CustomerId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @CustomerId3 UNIQUEIDENTIFIER = NEWID();
DECLARE @CustomerId4 UNIQUEIDENTIFIER = NEWID();
DECLARE @CustomerId5 UNIQUEIDENTIFIER = NEWID();

DECLARE @VehicleId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @VehicleId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @VehicleId3 UNIQUEIDENTIFIER = NEWID();
DECLARE @VehicleId4 UNIQUEIDENTIFIER = NEWID();
DECLARE @VehicleId5 UNIQUEIDENTIFIER = NEWID();
DECLARE @VehicleId6 UNIQUEIDENTIFIER = NEWID();

DECLARE @ServiceId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId3 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId4 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId5 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId6 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId7 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId8 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId9 UNIQUEIDENTIFIER = NEWID();
DECLARE @ServiceId10 UNIQUEIDENTIFIER = NEWID();

DECLARE @PartId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId3 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId4 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId5 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId6 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId7 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId8 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId9 UNIQUEIDENTIFIER = NEWID();
DECLARE @PartId10 UNIQUEIDENTIFIER = NEWID();

DECLARE @WorkOrderId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @WorkOrderId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @WorkOrderId3 UNIQUEIDENTIFIER = NEWID();
DECLARE @WorkOrderId4 UNIQUEIDENTIFIER = NEWID();
DECLARE @WorkOrderId5 UNIQUEIDENTIFIER = NEWID();
DECLARE @WorkOrderId6 UNIQUEIDENTIFIER = NEWID();

-- ============================================================
-- 1. INSERIR CLIENTES
-- ============================================================
INSERT INTO Customers (Id, Name, Email, Phone, Document, CreatedAt, UpdatedAt)
VALUES 
    (@CustomerId1, 'Joao Silva', 'joao.silva@email.com', '11987654321', '12345678901', GETDATE(), GETDATE()),
    (@CustomerId2, 'Maria Santos', 'maria.santos@email.com', '11987654322', '12345678902', GETDATE(), GETDATE()),
    (@CustomerId3, 'Carlos Oliveira', 'carlos.oliveira@email.com', '11987654323', '12345678903', GETDATE(), GETDATE()),
    (@CustomerId4, 'Ana Costa', 'ana.costa@email.com', '11987654324', '12345678904', GETDATE(), GETDATE()),
    (@CustomerId5, 'Pedro Mendes', 'pedro.mendes@email.com', '11987654325', '12345678905', GETDATE(), GETDATE());

-- ============================================================
-- 2. INSERIR VEÍCULOS
-- ============================================================
INSERT INTO Vehicles (Id, CustomerId, Brand, Model, Year, LicensePlate, Color, CreatedAt, UpdatedAt)
VALUES 
    (@VehicleId1, @CustomerId1, 'Toyota', 'Corolla', 2020, 'ABC1234', 'Branco', GETDATE(), GETDATE()),
    (@VehicleId2, @CustomerId1, 'Honda', 'Civic', 2019, 'XYZ5678', 'Prata', GETDATE(), GETDATE()),
    (@VehicleId3, @CustomerId2, 'Ford', 'Focus', 2021, 'DEF9012', 'Preto', GETDATE(), GETDATE()),
    (@VehicleId4, @CustomerId3, 'Volkswagen', 'Golf', 2020, 'GHI3456', 'Azul', GETDATE(), GETDATE()),
    (@VehicleId5, @CustomerId4, 'Chevrolet', 'Cruze', 2018, 'JKL7890', 'Cinza', GETDATE(), GETDATE()),
    (@VehicleId6, @CustomerId5, 'Hyundai', 'HB20', 2022, 'MNO1234', 'Vermelho', GETDATE(), GETDATE());

-- ============================================================
-- 3. INSERIR SERVIcOS
-- ============================================================
INSERT INTO Services (Id, Name, Description, Price, EstimatedHours, IsActive, CreatedAt, UpdatedAt)
VALUES 
    (@ServiceId1, 'Troca de Oleo', 'Troca de Oleo do motor com filtro', 89.90, 1.0, 1, GETDATE(), GETDATE()),
    (@ServiceId2, 'Alinhamento', 'Alinhamento de rodas 4 rodas', 150.00, 1.5, 1, GETDATE(), GETDATE()),
    (@ServiceId3, 'Balanceamento', 'Balanceamento de rodas', 50.00, 0.5, 1, GETDATE(), GETDATE()),
    (@ServiceId4, 'Revisao Completa', 'Revisao completa do veículo', 500.00, 4.0, 1, GETDATE(), GETDATE()),
    (@ServiceId5, 'Troca de Pneus', 'Troca de todos os 4 pneus', 400.00, 2.0, 1, GETDATE(), GETDATE()),
    (@ServiceId6, 'Troca de Bateria', 'Troca de bateria 12V', 350.00, 1.0, 1, GETDATE(), GETDATE()),
    (@ServiceId7, 'Limpeza de Freios', 'Limpeza e inspecao do sistema de freios', 200.00, 2.0, 1, GETDATE(), GETDATE()),
    (@ServiceId8, 'Troca de Pastilhas de Freio', 'Substituicao das pastilhas de freio', 250.00, 1.5, 1, GETDATE(), GETDATE()),
    (@ServiceId9, 'Polimento e Enceramento', 'Polimento + enceramento do veículo', 300.00, 3.0, 1, GETDATE(), GETDATE()),
    (@ServiceId10, 'DiagnOstico Eletrônico', 'DiagnOstico completo do computador de bordo', 120.00, 0.5, 1, GETDATE(), GETDATE());

-- ============================================================
-- 4. INSERIR PEcAS
-- ============================================================
INSERT INTO Parts (Id, Name, Description, Price, StockQuantity, IsActive, CreatedAt, UpdatedAt)
VALUES 
    (@PartId1, 'Filtro de Oleo', 'Filtro de Oleo para motor 1.6/1.8', 35.00, 50, 1, GETDATE(), GETDATE()),
    (@PartId2, 'Oleo do Motor', 'Oleo sintetizado 5W-30', 40.00, 100, 1, GETDATE(), GETDATE()),
    (@PartId3, 'Filtro de Ar', 'Filtro de ar para motor', 25.00, 40, 1, GETDATE(), GETDATE()),
    (@PartId4, 'Vela de Ignicao', 'Vela de ignicao Iridium', 30.00, 60, 1, GETDATE(), GETDATE()),
    (@PartId5, 'Bateria 12V', 'Bateria 12V 60Ah', 280.00, 15, 1, GETDATE(), GETDATE()),
    (@PartId6, 'Pastilha de Freio', 'Conjunto de pastilhas para freio dianteiro', 120.00, 30, 1, GETDATE(), GETDATE()),
    (@PartId7, 'Disco de Freio', 'Disco de freio ventilado', 180.00, 20, 1, GETDATE(), GETDATE()),
    (@PartId8, 'Pneu Radial', 'Pneu 185/65 R15', 250.00, 40, 1, GETDATE(), GETDATE()),
    (@PartId9, 'Correia Sincronizada', 'Correia sincronizada para motor', 150.00, 25, 1, GETDATE(), GETDATE()),
    (@PartId10, 'Corrente de Distribuicao', 'Corrente com tensionador', 280.00, 10, 1, GETDATE(), GETDATE());

-- ============================================================
-- 5. INSERIR ORDENS DE SERVIcO
-- ============================================================
INSERT INTO WorkOrders (Id, OrderNumber, CustomerId, VehicleId, Status, Description, TotalAmount, CreatedAt, UpdatedAt)
VALUES 
    (@WorkOrderId1, 'WO001', @CustomerId1, @VehicleId1, 0, 'Cliente solicitou revisao completa', 589.90, GETDATE(), GETDATE()),
    (@WorkOrderId2, 'WO002', @CustomerId1, @VehicleId2, 1, 'Servico em progresso - aguardando pecas', 139.90, GETDATE(), GETDATE()),
    (@WorkOrderId3, 'WO003', @CustomerId2, @VehicleId3, 2, 'Servico concluído - aguardando pagamento', 600.00, GETDATE(), GETDATE()),
    (@WorkOrderId4, 'WO004', @CustomerId3, @VehicleId4, 0, 'Novo servico - alinhamento e balanceamento', 200.00, GETDATE(), GETDATE()),
    (@WorkOrderId5, 'WO005', @CustomerId4, @VehicleId5, 1, 'Revisao em andamento', 500.00, GETDATE(), GETDATE()),
    (@WorkOrderId6, 'WO006', @CustomerId5, @VehicleId6, 0, 'Servico de polimento agendado', 300.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId1, @ServiceId4, 1, 500.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId1, @ServiceId10, 1, 120.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId2, @ServiceId1, 1, 89.90, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId2, @ServiceId3, 1, 50.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId3, @ServiceId2, 1, 150.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId3, @ServiceId3, 1, 50.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId3, @ServiceId5, 1, 400.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId4, @ServiceId2, 1, 150.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId4, @ServiceId3, 1, 50.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId5, @ServiceId6, 1, 350.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId5, @ServiceId8, 1, 250.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId6, @ServiceId9, 1, 300.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId1, @PartId1, 1, 35.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId1, @PartId2, 5, 40.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId1, @PartId3, 1, 25.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId2, @PartId1, 1, 35.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId2, @PartId2, 5, 40.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId3, @PartId8, 4, 250.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId3, @PartId6, 1, 120.00, GETDATE(), GETDATE());

INSERT INTO WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    (NEWID(), @WorkOrderId5, @PartId5, 1, 280.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId5, @PartId6, 1, 120.00, GETDATE(), GETDATE()),
    (NEWID(), @WorkOrderId5, @PartId7, 1, 180.00, GETDATE(), GETDATE());

-- ============================================================
-- RESUMO DOS DADOS INSERIDOS
-- ============================================================
PRINT '====== DADOS INSERIDOS COM SUCESSO ======';
PRINT '';
PRINT 'Clientes: 5';
PRINT 'Veículos: 6';
PRINT 'Servicos: 10';
PRINT 'Pecas: 10';
PRINT 'Ordens de Servico: 6';
PRINT '';
PRINT 'Use este comando para visualizar os dados:';
PRINT 'SELECT * FROM Customers;';
PRINT 'SELECT * FROM Vehicles;';
PRINT 'SELECT * FROM Services;';
PRINT 'SELECT * FROM Parts;';
PRINT 'SELECT * FROM WorkOrders;';
