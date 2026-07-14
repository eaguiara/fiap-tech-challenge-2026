-- ============================================================
-- SCRIPT PARA POPULAR O BANCO DE DADOS - GarageFlowService
-- ============================================================
-- Este script insere dados de teste nas tabelas do banco
-- Customize conforme necessário

USE garage_flow;

-- ============================================================
-- 1. INSERIR CLIENTES
-- ============================================================
INSERT INTO dbo.Customers (Id, Name, Email, Phone, Document, CreatedAt, UpdatedAt)
VALUES 
    ('11111111-1111-1111-1111-111111111111', 'Joao Silva', 'joao.silva@email.com', '11987654321', '12345678901', GETDATE(), GETDATE()),
    ('22222222-2222-2222-2222-222222222222', 'Maria Santos', 'maria.santos@email.com', '11987654322', '12345678902', GETDATE(), GETDATE()),
    ('33333333-3333-3333-3333-333333333333', 'Carlos Oliveira', 'carlos.oliveira@email.com', '11987654323', '12345678903', GETDATE(), GETDATE()),
    ('44444444-4444-4444-4444-444444444444', 'Ana Costa', 'ana.costa@email.com', '11987654324', '12345678904', GETDATE(), GETDATE()),
    ('55555555-5555-5555-5555-555555555555', 'Pedro Mendes', 'pedro.mendes@email.com', '11987654325', '12345678905', GETDATE(), GETDATE());

-- ============================================================
-- 2. INSERIR VEÍCULOS
-- ============================================================
INSERT INTO dbo.Vehicles (Id, CustomerId, Brand, Model, Year, LicensePlate, Color, CreatedAt, UpdatedAt)
VALUES 
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Toyota', 'Corolla', 2020, 'ABC1234', 'Branco', GETDATE(), GETDATE()),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'Honda', 'Civic', 2019, 'XYZ5678', 'Prata', GETDATE(), GETDATE()),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'Ford', 'Focus', 2021, 'DEF9012', 'Preto', GETDATE(), GETDATE()),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '33333333-3333-3333-3333-333333333333', 'Volkswagen', 'Golf', 2020, 'GHI3456', 'Azul', GETDATE(), GETDATE()),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '44444444-4444-4444-4444-444444444444', 'Chevrolet', 'Cruze', 2018, 'JKL7890', 'Cinza', GETDATE(), GETDATE()),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '55555555-5555-5555-5555-555555555555', 'Hyundai', 'HB20', 2022, 'MNO1234', 'Vermelho', GETDATE(), GETDATE());

-- ============================================================
-- 3. INSERIR SERVIcOS
-- ============================================================
INSERT INTO dbo.Services (Id, Name, Description, Price, EstimatedHours, IsActive, CreatedAt, UpdatedAt)
VALUES 
    ('10000000-0000-0000-0000-000000000001', 'Troca de Oleo', 'Troca de Oleo do motor com filtro', 89.90, 1.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000002', 'Alinhamento', 'Alinhamento de rodas 4 rodas', 150.00, 1.5, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000003', 'Balanceamento', 'Balanceamento de rodas', 50.00, 0.5, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000004', 'Revisao Completa', 'Revisao completa do veículo', 500.00, 4.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000005', 'Troca de Pneus', 'Troca de todos os 4 pneus', 400.00, 2.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000006', 'Troca de Bateria', 'Troca de bateria 12V', 350.00, 1.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000007', 'Limpeza de Freios', 'Limpeza e inspecao do sistema de freios', 200.00, 2.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000008', 'Troca de Pastilhas de Freio', 'Substituicao das pastilhas de freio', 250.00, 1.5, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000009', 'Polimento e Enceramento', 'Polimento + enceramento do veículo', 300.00, 3.0, 1, GETDATE(), GETDATE()),
    ('10000000-0000-0000-0000-000000000010', 'DiagnOstico Eletrônico', 'DiagnOstico completo do computador de bordo', 120.00, 0.5, 1, GETDATE(), GETDATE());

-- ============================================================
-- 4. INSERIR PEcAS
-- ============================================================
INSERT INTO dbo.Parts (Id, Name, Description, Price, StockQuantity, IsActive, CreatedAt, UpdatedAt)
VALUES 
    ('20000000-0000-0000-0000-000000000001', 'Filtro de Oleo', 'Filtro de Oleo para motor 1.6/1.8', 35.00, 50, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000002', 'Oleo do Motor', 'Oleo sintetizado 5W-30', 40.00, 100, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000003', 'Filtro de Ar', 'Filtro de ar para motor', 25.00, 40, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000004', 'Vela de Ignicao', 'Vela de ignicao Iridium', 30.00, 60, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000005', 'Bateria 12V', 'Bateria 12V 60Ah', 280.00, 15, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000006', 'Pastilha de Freio', 'Conjunto de pastilhas para freio dianteiro', 120.00, 30, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000007', 'Disco de Freio', 'Disco de freio ventilado', 180.00, 20, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000008', 'Pneu Radial', 'Pneu 185/65 R15', 250.00, 40, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000009', 'Correia Sincronizada', 'Correia sincronizada para motor', 150.00, 25, 1, GETDATE(), GETDATE()),
    ('20000000-0000-0000-0000-000000000010', 'Corrente de Distribuicao', 'Corrente com tensionador', 280.00, 10, 1, GETDATE(), GETDATE());

-- ============================================================
-- 5. INSERIR ORDENS DE SERVIcO
-- ============================================================
INSERT INTO dbo.WorkOrders (Id, OrderNumber, CustomerId, VehicleId, Status, Description, TotalAmount, CreatedAt, UpdatedAt)
VALUES 
    ('30000000-0000-0000-0000-000000000001', 'WO001', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 0, 'Cliente solicitou revisao completa', 589.90, GETDATE(), GETDATE()),
    ('30000000-0000-0000-0000-000000000002', 'WO002', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1, 'Servico em progresso - aguardando pecas', 139.90, GETDATE(), GETDATE()),
    ('30000000-0000-0000-0000-000000000003', 'WO003', '22222222-2222-2222-2222-222222222222', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 2, 'Servico concluído - aguardando pagamento', 600.00, GETDATE(), GETDATE()),
    ('30000000-0000-0000-0000-000000000004', 'WO004', '33333333-3333-3333-3333-333333333333', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 0, 'Novo servico - alinhamento e balanceamento', 200.00, GETDATE(), GETDATE()),
    ('30000000-0000-0000-0000-000000000005', 'WO005', '44444444-4444-4444-4444-444444444444', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 1, 'Revisao em andamento', 500.00, GETDATE(), GETDATE()),
    ('30000000-0000-0000-0000-000000000006', 'WO006', '55555555-5555-5555-5555-555555555555', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 0, 'Servico de polimento agendado', 300.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 1, 500.00, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000010', 1, 120.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001', 1, 89.90, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', 1, 50.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000002', 1, 150.00, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000003', 1, 50.00, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000007', '30000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000005', 1, 400.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000002', 1, 150.00, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000009', '30000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000003', 1, 50.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000010', '30000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000006', 1, 350.00, GETDATE(), GETDATE()),
    ('40000000-0000-0000-0000-000000000011', '30000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000008', 1, 250.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderServices (Id, WorkOrderId, ServiceId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('40000000-0000-0000-0000-000000000012', '30000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000009', 1, 300.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('50000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 1, 35.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000002', 5, 40.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000003', 1, 25.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('50000000-0000-0000-0000-000000000004', '30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000001', 1, 35.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000005', '30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', 5, 40.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('50000000-0000-0000-0000-000000000006', '30000000-0000-0000-0000-000000000003', '20000000-0000-0000-0000-000000000008', 4, 250.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000007', '30000000-0000-0000-0000-000000000003', '20000000-0000-0000-0000-000000000006', 1, 120.00, GETDATE(), GETDATE());

INSERT INTO dbo.WorkOrderParts (Id, WorkOrderId, PartId, Quantity, UnitPrice, CreatedAt, UpdatedAt)
VALUES 
    ('50000000-0000-0000-0000-000000000008', '30000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000005', 1, 280.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000009', '30000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000006', 1, 120.00, GETDATE(), GETDATE()),
    ('50000000-0000-0000-0000-000000000010', '30000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000007', 1, 180.00, GETDATE(), GETDATE());

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