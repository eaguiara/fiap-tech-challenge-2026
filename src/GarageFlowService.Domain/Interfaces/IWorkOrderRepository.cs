using GarageFlowService.Domain.Entities;

namespace GarageFlowService.Domain.Interfaces;

public interface IWorkOrderRepository : IRepository<WorkOrder>
{
    Task<WorkOrder?> GetByIdWithDetailsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<IEnumerable<WorkOrder>> GetAllWithDetailsAsync(CancellationToken cancellationToken = default);
}

