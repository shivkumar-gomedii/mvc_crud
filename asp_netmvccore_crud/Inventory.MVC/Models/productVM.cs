using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Inventory.MVC.Models
{
    public class productVM
    {
        [Required(ErrorMessage = "Please enter name"), MaxLength(50)]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Please enter Available Qty"), MaxLength(20)]
        public string AvailableQty { get; set; }
        [Required(ErrorMessage = "Please enter price"), MaxLength(20)]
        public string Price { get; set; }
        [Required(ErrorMessage = "Please select price")]
        public string Category { get; set; }
        [Required(ErrorMessage = "Please select color")]
        public string ColorName { get; set; }
        [Required(ErrorMessage = "Please select brand")]
        public string[] Companies { get; set; }

        [Display(Name = "Add a picture")]
        [DataType(DataType.Upload)]
        [FileExtensions(Extensions = "jpg,png,gif,jpeg,bmp,svg")]
        [Required(ErrorMessage = "Please select photo")]
        public IFormFile Photo { get; set; }
        
    }
}
