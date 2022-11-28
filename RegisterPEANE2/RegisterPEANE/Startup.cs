using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RegisterPEANE.Startup))]
namespace RegisterPEANE
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
