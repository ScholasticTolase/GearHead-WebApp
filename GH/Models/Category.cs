using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GH.Models
{
    public class Category
    {
        [Key]
        [Required(ErrorMessage = "Category Type is required!")]
        public string CategoryType { get; set; }

        [Required(ErrorMessage = "Category Name is required!")]
        [StringLength(15, MinimumLength = 4)]
        public string CategoryName { get; set; }

        /* One category can have multiple products... 1 - many relationship*/
        public List<Article> Articles { get; set; }
    }
}