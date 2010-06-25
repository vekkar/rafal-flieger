
namespace SdtBusinessApplication.Web
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    using System.ServiceModel.DomainServices.Hosting;
    using System.ServiceModel.DomainServices.Server;


    // The MetadataTypeAttribute identifies CustomerMetadata as the class
    // that carries additional metadata for the Customer class.
    [MetadataTypeAttribute(typeof(Customer.CustomerMetadata))]
    public partial class Customer
    {

        // This class allows you to attach custom attributes to properties
        // of the Customer class.
        //
        // For example, the following marks the Xyz property as a
        // required property and specifies the format for valid values:
        //    [Required]
        //    [RegularExpression("[A-Z][A-Za-z0-9]*")]
        //    [StringLength(32)]
        //    public string Xyz { get; set; }
        internal sealed class CustomerMetadata
        {

            // Metadata classes are not meant to be instantiated.
            private CustomerMetadata()
            {
            }

            public string Address { get; set; }

            public string City { get; set; }

            public string Company_Name { get; set; }

            public string Contact_Name { get; set; }

            public string Contact_Title { get; set; }

            public string Customer_ID { get; set; }

            public EntityCollection<Orders> Orders { get; set; }

            public string Postal_Code { get; set; }
        }
    }

    // The MetadataTypeAttribute identifies EmployeeMetadata as the class
    // that carries additional metadata for the Employee class.
    [MetadataTypeAttribute(typeof(Employee.EmployeeMetadata))]
    public partial class Employee
    {

        // This class allows you to attach custom attributes to properties
        // of the Employee class.
        //
        // For example, the following marks the Xyz property as a
        // required property and specifies the format for valid values:
        //    [Required]
        //    [RegularExpression("[A-Z][A-Za-z0-9]*")]
        //    [StringLength(32)]
        //    public string Xyz { get; set; }
        internal sealed class EmployeeMetadata
        {

            // Metadata classes are not meant to be instantiated.
            private EmployeeMetadata()
            {
            }

            public string City { get; set; }

            public int Employee_ID { get; set; }

            public string First_Name { get; set; }

            public string Last_Name { get; set; }

            public EntityCollection<Orders> Orders { get; set; }

            public byte[] Photo { get; set; }

            public string Title { get; set; }
        }
    }

    // The MetadataTypeAttribute identifies OrdersMetadata as the class
    // that carries additional metadata for the Orders class.
    [MetadataTypeAttribute(typeof(Orders.OrdersMetadata))]
    public partial class Orders
    {

        // This class allows you to attach custom attributes to properties
        // of the Orders class.
        //
        // For example, the following marks the Xyz property as a
        // required property and specifies the format for valid values:
        //    [Required]
        //    [RegularExpression("[A-Z][A-Za-z0-9]*")]
        //    [StringLength(32)]
        //    public string Xyz { get; set; }
        internal sealed class OrdersMetadata
        {

            // Metadata classes are not meant to be instantiated.
            private OrdersMetadata()
            {
            }

            public string Customer_ID { get; set; }

            public Customer Customers { get; set; }

            public Nullable<int> Employee_ID { get; set; }

            public Employee Employees { get; set; }

            public Nullable<decimal> Freight { get; set; }

            public Nullable<DateTime> Order_Date { get; set; }

            public int Order_ID { get; set; }

            public Nullable<DateTime> Required_Date { get; set; }

            public string Ship_Address { get; set; }

            public string Ship_City { get; set; }

            public string Ship_Country { get; set; }

            public string Ship_Name { get; set; }

            public string Ship_Postal_Code { get; set; }

            public string Ship_Region { get; set; }

            public Nullable<int> Ship_Via { get; set; }

            public Nullable<DateTime> Shipped_Date { get; set; }
        }
    }
}
