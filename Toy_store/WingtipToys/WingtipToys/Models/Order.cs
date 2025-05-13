using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WingtipToys.Models
{
    public class Order
    {
        [Key]
        [ScaffoldColumn(false)]
        public int OrderID { get; set; }

        [Required]
        [Range(0.01, 5000)]
        public decimal TotalAmount { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime CreatedAt { get; set; }

        [Required(ErrorMessage = "Your Address is Required!")]
        [StringLength(100)]
        public string Address { get; set; }

        [Required]
        public Status Status { get; set; }

        [Required(ErrorMessage = "Your Email is Required!")]
        [EmailAddress(ErrorMessage = "Your Email is Not Valid!")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Your Name is Required!")]
        [StringLength(50)]
        [Display(Name = "Enter Your Name")]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "Only letters and spaces allowed!")]
        public string Name { get; set; }

        public List<OrderDetail> OrderDetails { get; set; } // optional
    }

    public enum Status
    {
        Pending,
        Paid,
        Cancelled
    }
}
