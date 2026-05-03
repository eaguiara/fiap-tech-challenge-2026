using GarageFlowService.Domain.Entities;
using GarageFlowService.Domain.Interfaces;
using GarageFlowService.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace GarageFlowService.Infrastructure.Repositories;

public class WorkOrderRepository : Repository<WorkOrder>, IWorkOrderRepository
{
    public WorkOrderRepository(AppDbContext context) : base(context) { }

    public async Task<WorkOrder?> GetByIdWithDetailsAsync(Guid id, CancellationToken cancellationToken = default)
        => await _dbSet
            .Include(wo => wo.Customer)
            .Include(wo => wo.Vehicle)
            .Include(wo => wo.WorkOrderServices).ThenInclude(ws => ws.Service)
            .Include(wo => wo.WorkOrderParts).ThenInclude(wp => wp.Part)
            .FirstOrDefaultAsync(wo => wo.Id == id, cancellationToken);

    public async Task<IEnumerable<WorkOrder>> GetAllWithDetailsAsync(CancellationToken cancellationToken = default)
        => await _dbSet
            .Include(wo => wo.Customer)
            .Include(wo => wo.Vehicle)
            .ToListAsync(cancellationToken);
}

