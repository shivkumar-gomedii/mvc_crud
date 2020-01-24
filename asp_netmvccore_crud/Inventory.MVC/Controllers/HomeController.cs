using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Inventory.MVC.Models;
using Inventory.BusinessLib;

namespace Inventory.MVC.Controllers
{
    public class HomeController : Controller
    {
        IProductOperation operation;
        public HomeController(IProductOperation _operation)
        {
            operation = _operation;
        }
        public IActionResult Index()
        {
            var result = operation.GetProducts();
            return View(result);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
