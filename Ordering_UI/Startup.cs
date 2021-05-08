using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Ordering_UI.Startup))]
namespace Ordering_UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
