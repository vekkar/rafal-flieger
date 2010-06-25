using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using SdtBusinessApplication.Web;
using SdtBusinessApplication.Web.Services;
using System.ComponentModel;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace SdtBusinessApplication.Views
{
    public class EmployeeListingVModel : INotifyPropertyChanged
    {
        NorthwindDomianContext ctx = new NorthwindDomianContext();

        private IList<Employee> employees = null;

        public IList<Employee> Employees
        {
            get { return employees; }
            set { employees = value; }
        }

        public EmployeeListingVModel()
        {
            employees = new ObservableCollection<Employee>(ctx.Employees); 
        }
 
        
        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        #endregion
    }
}
