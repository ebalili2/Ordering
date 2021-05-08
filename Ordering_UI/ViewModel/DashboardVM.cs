using Ordering_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ordering_UI.ViewModel
{
    public class DashboardVM
    {
        public User LoggedInUser { get; set; }
        public Product CurrentProduct { get; set; }
    }
}