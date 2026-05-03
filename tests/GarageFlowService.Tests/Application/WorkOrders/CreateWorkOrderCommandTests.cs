using FluentAssertions;
using Moq;
using GarageFlowService.Application.UseCases.WorkOrders;
using GarageFlowService.Domain.Entities;
using GarageFlowService.Domain.Interfaces;
using GarageFlowService.Application.Interfaces;

namespace GarageFlowService.Tests.Application.WorkOrders;

public class CreateWorkOrderCommandTests
{
    private readonly Mock<IWorkOrderRepository> _workOrderRepositoryMock;
    private readonly Mock<IUnitOfWork> _unitOfWorkMock;
    private readonly CreateWorkOrderHandler _handler;

    public CreateWorkOrderCommandTests()
    {
        _workOrderRepositoryMock = new Mock<IWorkOrderRepository>();
        _unitOfWorkMock = new Mock<IUnitOfWork>();
        
        _handler = new CreateWorkOrderHandler(
            _workOrderRepositoryMock.Object,
            _unitOfWorkMock.Object
        );
    }

    [Fact]
    public async Task Handle_ValidCommand_ShouldCreateWorkOrder()
    {
        var customerId = Guid.NewGuid();
        var vehicleId = Guid.NewGuid();

        var command = new CreateWorkOrderCommand(customerId, vehicleId, "Revisão geral");
        var result = await _handler.Handle(command, CancellationToken.None);

        result.Should().NotBeNull();
        result!.Id.Should().NotBeEmpty();
        result.Description.Should().Be("Revisão geral");
    }

    [Fact]
    public async Task Handle_ValidCommand_ShouldCallRepository()
    {
        var customerId = Guid.NewGuid();
        var vehicleId = Guid.NewGuid();

        var command = new CreateWorkOrderCommand(customerId, vehicleId, "Revisão geral");
        await _handler.Handle(command, CancellationToken.None);

        _workOrderRepositoryMock.Verify(
            x => x.AddAsync(It.IsAny<WorkOrder>(), It.IsAny<CancellationToken>()), 
            Times.Once
        );
    }

    [Fact]
    public async Task Handle_ValidCommand_ShouldCallUnitOfWorkCommit()
    {
        var customerId = Guid.NewGuid();
        var vehicleId = Guid.NewGuid();

        var command = new CreateWorkOrderCommand(customerId, vehicleId, "Revisão geral");
        await _handler.Handle(command, CancellationToken.None);

        _unitOfWorkMock.Verify(
            x => x.CommitAsync(It.IsAny<CancellationToken>()), 
            Times.Once
        );
    }
}
