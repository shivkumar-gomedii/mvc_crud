using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inventory.MVC.Models
{
    public class productVM
    {        
        public string ProductName { get; set; }
        public string AvailableQty { get; set; }
        public string Price { get; set; }
        public string Category { get; set; }
        public string ColorName { get; set; }        
        public string[] Companies { get; set; }
    }
}
