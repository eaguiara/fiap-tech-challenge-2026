using FluentAssertions;
using Moq;
using GarageFlowService.Application.UseCases.WorkOrders;
using GarageFlowService.Domain.Entities;
using GarageFlowService.Domain.Interfaces;

namespace GarageFlowService.Tests.Application.WorkOrders;

public class GetAllWorkOrdersQueryTests
{
    private readonly Mock<IWorkOrderRepository> _workOrderRepositoryMock;
    private readonly GetAllWorkOrdersHandler _handler;

    public GetAllWorkOrdersQueryTests()
    {
        _workOrderRepositoryMock = new Mock<IWorkOrderRepository>();
        _handler = new GetAllWorkOrdersHandler(_workOrderRepositoryMock.Object);
    }

    [Fact]
    public async Task Handle_NoWorkOrders_ShouldReturnEmptyList()
    {
        var workOrders = new List<WorkOrder>();
        
        _workOrderRepositoryMock
            .Setup(x => x.GetAllWithDetailsAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(workOrders);

        var query = new GetAllWorkOrdersQuery();
        var result = await _handler.Handle(query, CancellationToken.None);

        result.Should().BeEmpty();
    }

    [Fact]
    public async Task Handle_MultipleWorkOrders_ShouldReturnAllWorkOrders()
    {
        var customerId1 = Guid.NewGuid();
        var vehicleId1 = Guid.NewGuid();
        var customerId2 = Guid.NewGuid();
        var vehicleId2 = Guid.NewGuid();

        var workOrder1 = new WorkOrder(customerId1, vehicleId1, "Revisão 1");
        var workOrder2 = new WorkOrder(customerId2, vehicleId2, "Revisão 2");
        var workOrders = new List<WorkOrder> { workOrder1, workOrder2 };
        
        _workOrderRepositoryMock
            .Setup(x => x.GetAllWithDetailsAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(workOrders);

        var query = new GetAllWorkOrdersQuery();
        var result = await _handler.Handle(query, CancellationToken.None);

        result.Should().HaveCount(2);
        result.Should().AllSatisfy(dto => dto.Should().NotBeNull());
    }

    [Fact]
    public async Task Handle_WorkOrdersWithServices_ShouldMapCorrectly()
    {
        var customerId = Guid.NewGuid();
        var vehicleId = Guid.NewGuid();
        var workOrder = new WorkOrder(customerId, vehicleId, "Revisão completa");
        
        var service = new Service("Troca de óleo", "desc", 150m, 1m);
        workOrder.AddService(service, 1);
        
        var workOrders = new List<WorkOrder> { workOrder };
        
        _workOrderRepositoryMock
            .Setup(x => x.GetAllWithDetailsAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(workOrders);

        var query = new GetAllWorkOrdersQuery();
        var result = await _handler.Handle(query, CancellationToken.None);

        result.Should().HaveCount(1);
        var dto = result.First();
        dto.Description.Should().Be("Revisão completa");
    }

    [Fact]
    public async Task Handle_ShouldCallRepositoryGetAllWithDetailsAsync()
    {
        _workOrderRepositoryMock
            .Setup(x => x.GetAllWithDetailsAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(new List<WorkOrder>());

        var query = new GetAllWorkOrdersQuery();
        await _handler.Handle(query, CancellationToken.None);

        _workOrderRepositoryMock.Verify(
            x => x.GetAllWithDetailsAsync(It.IsAny<CancellationToken>()),
            Times.Once
        );
    }
}
