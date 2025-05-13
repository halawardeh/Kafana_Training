using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WingtipToys.Models
{
    public class Checkout
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        [Range(0.01, 5000)]
        public decimal TotalAmount { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime CheckedAt { get; set; }

        [Required]
        public PaymentMethod PaymentMethod { get; set; }

    }

    public enum PaymentMethod
    {
        Paypal,
        Click
    }
}


