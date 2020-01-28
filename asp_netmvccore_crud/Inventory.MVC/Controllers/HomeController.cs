using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Inventory.MVC.Models;
using Inventory.BusinessLib;
using Microsoft.AspNetCore.Mvc.Rendering;

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

        public IActionResult Create()
        {
            List<SelectListItem> Categories = new List<SelectListItem>();
            Categories.Add(new SelectListItem { Text = "Electronic", Value = "Electronic" });
            Categories.Add(new SelectListItem() { Text = "Mobile", Value = "Mobile" });
            Categories.Add(new SelectListItem() { Text = "Men Wear", Value = "Men Wear" });
            Categories.Add(new SelectListItem() { Text = "Woman Wear", Value = "Woman Wear" });
            ViewBag.Categories = Categories;
            Dictionary<string, string> colors = new Dictionary<string, string>();
            colors.Add("Red", "Red");
            colors.Add("Green", "Green");
            colors.Add("Yellow", "Yellow");
            colors.Add("Grey", "Grey");
            ViewBag.Colors = colors;

            Dictionary<string, string> Companies = new Dictionary<string, string>();
            Companies.Add("FlipKart", "FlipKart");
            Companies.Add("Amazon", "Amazon");
            Companies.Add("Ebay", "Ebay");
            Companies.Add("Relience", "Relience");
            ViewBag.Companies = Companies;

            return View();
        }

        [HttpPost]
        public IActionResult Create(productVM product,string btnSubmit)
        {
            List<SelectListItem> Categories = new List<SelectListItem>();
            Categories.Add(new SelectListItem { Text = "Electronic", Value = "Electronic" });
            Categories.Add(new SelectListItem() { Text = "Mobile", Value = "Mobile" });
            Categories.Add(new SelectListItem() { Text = "Men Wear", Value = "Men Wear" });
            Categories.Add(new SelectListItem() { Text = "Woman Wear", Value = "Woman Wear" });
            ViewBag.Categories = Categories;
            Dictionary<string, string> colors = new Dictionary<string, string>();
            colors.Add("Red", "Red");
            colors.Add("Green", "Green");
            colors.Add("Yellow", "Yellow");
            colors.Add("Grey", "Grey");
            ViewBag.Colors = colors;

            Dictionary<string, string> Companies = new Dictionary<string, string>();
            Companies.Add("FlipKart", "FlipKart");
            Companies.Add("Amazon", "Amazon");
            Companies.Add("Ebay", "Ebay");
            Companies.Add("Relience", "Relience");
            ViewBag.Companies = Companies;

            if (btnSubmit == "Reset")
            {
                ModelState.Clear();
                return View(product);
            }
            else
            {
                if (!ModelState.IsValid)
                    return View();

                return View();
            }
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
