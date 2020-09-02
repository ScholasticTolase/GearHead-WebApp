using System;
using System.ComponentModel.DataAnnotations;

namespace GH.Models
{
    public class AdminAccount
    {
        [Key]
        public int AdminId { get; set; }

        [Required(ErrorMessage = "First Name is required!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is required!")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Email is required!")]
        [EmailAddress(ErrorMessage = "Invalid Email!")]
        public string Email { get; set; }

        [Required(ErrorMessage = "PhoneNumber is required!")]
        public String PhoneNumber { get; set; }


        [Required(ErrorMessage = "Username is required!")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password is required!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Compare("Password", ErrorMessage = "Please Confirm your password!")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}