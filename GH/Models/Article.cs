using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;


namespace GH.Models
{
    public class Article
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "Product Name is required!")]
        [StringLength(150, MinimumLength = 2)]
        public string Title { get; set; }
        [AllowHtml]
        public String Content { get; set; }

        public string ImageUrl { get; set; }

        // Foreign Key
        /* Product have relationship with the Category
         CatId is a foreign Key
         Category is the object that the CatId is related to*/
        public string CategoryType { get; set; }
        public Category Category { get; set; }
    }
}