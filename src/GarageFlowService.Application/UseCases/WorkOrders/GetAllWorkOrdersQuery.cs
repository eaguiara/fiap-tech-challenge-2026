using GarageFlowService.Application.DTOs;
using GarageFlowService.Domain.Interfaces;
using MediatR;

namespace GarageFlowService.Application.UseCases.WorkOrders;

public record GetAllWorkOrdersQuery : IRequest<IEnumerable<WorkOrderDto>>;

public class GetAllWorkOrdersHandler : IRequestHandler<GetAllWorkOrdersQuery, IEnumerable<WorkOrderDto>>
{
    private readonly IWorkOrderRepository _workOrderRepository;

    public GetAllWorkOrdersHandler(IWorkOrderRepository workOrderRepository)
    {
        _workOrderRepository = workOrderRepository;
    }

    public async Task<IEnumerable<WorkOrderDto>> Handle(GetAllWorkOrdersQuery request, CancellationToken cancellationToken)
    {
        var workOrders = await _workOrderRepository.GetAllWithDetailsAsync(cancellationToken);
        return workOrders.Select(CreateWorkOrderHandler.MapToDto);
    }
}

