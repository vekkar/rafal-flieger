
namespace SdtBusinessApplication.Web.Services
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.Data;
    using System.Linq;
    using System.ServiceModel.DomainServices.EntityFramework;
    using System.ServiceModel.DomainServices.Hosting;
    using System.ServiceModel.DomainServices.Server;
    using SdtBusinessApplication.Web;


    // Implements application logic using the NorthwindEntities context.
    // TODO: Add your application logic to these methods or in additional methods.
    // TODO: Wire up authentication (Windows/ASP.NET Forms) and uncomment the following to disable anonymous access
    // Also consider adding roles to restrict access as appropriate.
    // [RequiresAuthentication]
    [EnableClientAccess()]
    public class NorthwindDomianService : LinqToEntitiesDomainService<NorthwindEntities>
    {

        // TODO:
        // Consider constraining the results of your query method.  If you need additional input you can
        // add parameters to this method or create additional query methods with different names.
        // To support paging you will need to add ordering to the 'Customers' query.
        public IQueryable<Customer> GetCustomers()
        {
            return this.ObjectContext.Customers;
        }

        public void InsertCustomer(Customer customer)
        {
            if ((customer.EntityState != EntityState.Detached))
            {
                this.ObjectContext.ObjectStateManager.ChangeObjectState(customer, EntityState.Added);
            }
            else
            {
                this.ObjectContext.Customers.AddObject(customer);
            }
        }

        public void UpdateCustomer(Customer currentCustomer)
        {
            this.ObjectContext.Customers.AttachAsModified(currentCustomer, this.ChangeSet.GetOriginal(currentCustomer));
        }

        public void DeleteCustomer(Customer customer)
        {
            if ((customer.EntityState == EntityState.Detached))
            {
                this.ObjectContext.Customers.Attach(customer);
            }
            this.ObjectContext.Customers.DeleteObject(customer);
        }

        // TODO:
        // Consider constraining the results of your query method.  If you need additional input you can
        // add parameters to this method or create additional query methods with different names.
        // To support paging you will need to add ordering to the 'Employees' query.
        public IQueryable<Employee> GetEmployees()
        {
            return this.ObjectContext.Employees;
        }

        public void InsertEmployee(Employee employee)
        {
            if ((employee.EntityState != EntityState.Detached))
            {
                this.ObjectContext.ObjectStateManager.ChangeObjectState(employee, EntityState.Added);
            }
            else
            {
                this.ObjectContext.Employees.AddObject(employee);
            }
        }

        public void UpdateEmployee(Employee currentEmployee)
        {
            this.ObjectContext.Employees.AttachAsModified(currentEmployee, this.ChangeSet.GetOriginal(currentEmployee));
        }

        public void DeleteEmployee(Employee employee)
        {
            if ((employee.EntityState == EntityState.Detached))
            {
                this.ObjectContext.Employees.Attach(employee);
            }
            this.ObjectContext.Employees.DeleteObject(employee);
        }

        // TODO:
        // Consider constraining the results of your query method.  If you need additional input you can
        // add parameters to this method or create additional query methods with different names.
        // To support paging you will need to add ordering to the 'Orders' query.
        public IQueryable<Orders> GetOrders()
        {
            return this.ObjectContext.Orders;
        }

        public void InsertOrders(Orders orders)
        {
            if ((orders.EntityState != EntityState.Detached))
            {
                this.ObjectContext.ObjectStateManager.ChangeObjectState(orders, EntityState.Added);
            }
            else
            {
                this.ObjectContext.Orders.AddObject(orders);
            }
        }

        public void UpdateOrders(Orders currentOrders)
        {
            this.ObjectContext.Orders.AttachAsModified(currentOrders, this.ChangeSet.GetOriginal(currentOrders));
        }

        public void DeleteOrders(Orders orders)
        {
            if ((orders.EntityState == EntityState.Detached))
            {
                this.ObjectContext.Orders.Attach(orders);
            }
            this.ObjectContext.Orders.DeleteObject(orders);
        }
    }
}


