using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WingtipToys.Models
{
    public class User
    {
        public int Id { get; set; }           // المعرف الأساسي
        public string Email { get; set; }     // البريد الإلكتروني
        public string Password { get; set; }  // كلمة المرور
        public string FirstName { get; set; } // الاسم الأول
        public string LastName { get; set; }  // الاسم الأخير
        public string Role { get; set; }      // الدور (مثلاً: Admin, Customer)
    }
}