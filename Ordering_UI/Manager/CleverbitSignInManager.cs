using Microsoft.AspNet.Identity.Owin;
using Ordering_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace Ordering_UI.Manager
{
    public class CleverbitSignInManager
    {
        public static async Task<SignInStatus> SignIn(string username, string password)
        {
            //call API to validate credentials - Claims
            if (username == "ebalili" && password == "password")
            {
                return SignInStatus.Success;
            }
            return SignInStatus.Failure;
        }
    }
}