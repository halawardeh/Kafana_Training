﻿//using Microsoft.AspNet.Identity;
//using Microsoft.AspNet.Identity.EntityFramework;
//using Microsoft.AspNet.Identity.Owin;
//using Microsoft.Owin;
//using DocumentProject.Models;

//namespace DocumentProject   
//{
//    public class ApplicationUserManager : UserManager<ApplicationUser>
//    {
//        public ApplicationUserManager(IUserStore<ApplicationUser> store)
//            : base(store)
//        {
//        }

//        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
//        {
//            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>()));
//            // Configure validation logic for usernames
//            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
//            {
//                AllowOnlyAlphanumericUserNames = false,
//                RequireUniqueEmail = true
//            };
//            return manager;
//        }
//    }
//}