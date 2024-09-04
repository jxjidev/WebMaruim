using Microsoft.AspNetCore.Mvc;

namespace WebMaruim.API.Controllers
{
    public class ClienteController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
