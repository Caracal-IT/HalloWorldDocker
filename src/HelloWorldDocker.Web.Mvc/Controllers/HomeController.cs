using System.Diagnostics;
using HalloWorldDocker.Utilities;
using Microsoft.AspNetCore.Mvc;
using HelloWorldDocker.Web.Mvc.Models;

namespace HelloWorldDocker.Web.Mvc.Controllers;

public class HomeController : Controller {
  private readonly ILogger<HomeController> _logger;

  public HomeController(ILogger<HomeController> logger) {
    _logger = logger;
  }

  public IActionResult Index() {
    var greeter = new Greeter();
    ViewData["Message"] = greeter.Greet("Ettiene");
    
    return View();
  }

  public IActionResult Privacy() {
    return View();
  }

  [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
  public IActionResult Error() {
    return View(new ErrorViewModel {RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier});
  }
}