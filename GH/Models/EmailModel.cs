
using System.ComponentModel.DataAnnotations;

namespace GH.Models
{
    public class EmailModel { 
    
        [Required(ErrorMessage = "Fullname is required!")]
        public string FullName { get; set; }

        [Required(ErrorMessage = "Email is required!")]
        [EmailAddress(ErrorMessage = "Invalid Email")]
        [Display(Name = "Email")]
        public string UserEmail { get; set; }

        [Required(ErrorMessage = "Message is required!")]
        public string Message { get; set; }
    }
}